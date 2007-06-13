#!/usr/bin/ruby
#
#	Distribution Maker Script
#	$Id: makedist.rb 13 2005-10-14 06:44:00Z ged $
#
#	Copyright (c) 2001-2005, The FaerieMUD Consortium.
#
#	This is free software. You may use, modify, and/or redistribute this
#	software under the terms of the Perl Artistic License. (See
#	http://language.perl.com/misc/Artistic.html)
#

BEGIN {
	basedir = File::dirname( File::expand_path(__FILE__) )
	require "#{basedir}/utils.rb"
}

require 'optparse'
require 'fileutils'
require 'rbconfig'

include UtilityFunctions, FileUtils, Config


# SVN Revision
SVNRev = %q$Rev: 13 $

# SVN Id
SVNId = %q$Id: makedist.rb 13 2005-10-14 06:44:00Z ged $

# SVN URL
SVNURL = %q$URL: svn+ssh://svn.FaerieMUD.org/usr/local/svn/project-utils/trunk/makedist.rb $

$Programs = {
	'tar'	=> nil,
	'zip'	=> nil,
	'cvs'	=> nil,
	'svn'	=> nil,
}

Distros = [

	# Tar+gzipped
	{
		'type'		=> 'Tar+Gzipped',
		'makeProc'	=> lambda {|distName|
			gzArchiveName = "%s.tar.gz" % distName
			if File::exists?( gzArchiveName )
				message "Removing old archive #{gzArchiveName}..."
				File.delete( gzArchiveName )
			end
			system( $Programs['tar'], '-czf', gzArchiveName, distName ) or abort( "tar+gzip failed: #{$?}" )
		}
	},

	# Tar+bzipped
	{
		'type'		=> 'Tar+Bzipped',
		'makeProc'	=> lambda {|distName|
			bzArchiveName = "%s.tar.bz2" % distName
			if File::exists?( bzArchiveName )
				message "Removing old archive #{bzArchiveName}..."
				File.delete( bzArchiveName )
			end
			system( $Programs['tar'], '-cjf', bzArchiveName, distName ) or
				abort( "tar failed: #{$?}" )
		}
	},

	# Zipped
	{
		'type'		=> 'Zipped',
		'makeProc'	=> lambda {|distName|
			zipArchiveName = "%s.zip" % distName
			if File::exists?( zipArchiveName )
				message "Removing old archive #{zipArchiveName}..."
				File.delete( zipArchiveName )
			end
			system( $Programs['zip'], '-lrq9', zipArchiveName, distName ) or
				abort( "zip failed: #{$?}" )
		}
	},

	# Gem
	{
		'type'		=> 'RubyGem',
		'makeProc'	=> lambda {|distName|
			gemName = "%s.gem" % distName
			if File::exists?( ".gemspec" )
				if File::exists?( gemName )
					message "Removing old gem #{gemName}..."
					File::delete( gemName )
				end

				system( CONFIG['RUBY_INSTALL_NAME'], ".gemspec" ) or
					abort( "Gem create failed: #{$?}" )
			else
				message "Skipping Gem: no .gemspec"
			end
		}
	}
]


# Set interrupt handler to restore tty before exiting
#stty_save = `stty -g`.chomp
#trap("INT") { system "stty", stty_save; exit }

### Main function
def main
	filelist = []
	snapshot = false
	wantsTag = true
	wantsPrompt = true

	# Read command-line options
	ARGV.options do |oparser|
		oparser.banner = "Usage: #$0 [options] [VERSION]\n"

		oparser.on( "--verbose", "-v", TrueClass, "Make progress verbose" ) do
			$VERBOSE = true
			debug_msg "Turned verbose on."
		end

		oparser.on( "--snapshot", "-s", TrueClass,
			"Make a snapshot distribution instead of a versioned release" ) do
			snapshot = true
			debug_msg "Making snapshot instead of release."
		end

		oparser.on( "--no-tag", "-n", TrueClass, "Don't tag the release." ) do
			wantsTag = false
		end

		oparser.on( "--yes", "-y", TrueClass,
			"Accept all the defaults instead of prompting." ) do
			wantsPrompt = false
		end

		# Handle the 'help' option
		oparser.on( "--help", "-h", "Display this text." ) do
			$stderr.puts oparser
			exit!(0)
		end

		oparser.parse!
	end

	userversion = ARGV.shift

	# Find the project name
	header "Distribution Maker"
	project = extractProjectName()
	if wantsPrompt && project.nil?
		project = prompt( "Project name?" )
	end
	abort( "No project name" ) unless project && !project.empty?
	message( "Making distribution archives for %s\n" % project )

	# Look for programs to use
	message "Finding necessary programs...\n\n"
	for prog in $Programs.keys
		$Programs[ prog ] = findProgram( prog ) or
			abort "Required program #{prog} not found."
		message( "  #{prog}: %s\n" % $Programs[prog] )
	end
	message( "All required programs found.\n" )

	# Fetch the MANIFEST
	filelist = getVettedManifest()

	# Prompt for version/snapshot date
	version = distName = nil
	if snapshot
		verboseMsg( "Making a snapshot distname." )

		if userversion
			version = userversion
		else
			version = Time::now.strftime('%Y%m%d')
			version = promptWithDefault( "Snapshot version", version ) if wantsPrompt
		end

		verboseMsg( "Using version %p" % [version] )
		distName = "%s-%s" % [ project, version ]
		tag = "SNAPSHOT_%s" % version
	else
		verboseMsg( "Making a release distname." )

		if userversion
			version = userversion
		else
			version = extractNextVersion().join('.')
			version = promptWithDefault( "Distribution version", version ) if wantsPrompt
		end

		verboseMsg( "Using version %p" % [version] )
		distName = "%s-%s" % [ project, version ]
		tag = "RELEASE_%s" % version.gsub( /\./, '_' )
	end
	verboseMsg( "Distname = %p" % [distName] )

	# Tag if desired
	if wantsTag
		verboseMsg( "Tagging." )

		tagFlag = promptWithDefault( "Tag '%s' with %s" % [ project, tag ], 'y' )
		if /^y/i.match( tagFlag )
			if File::directory?( "CVS" )
				message "Running #{$Programs['cvs']} -q tag #{tag}\n"
				system $Programs['cvs'], '-q', 'tag', tag
			elsif File::directory?( ".svn" )
				uri = getSvnUri()
				taguri = uri + "tags/#{tag}"
				message "SVN tag URI: %s\n" % [ taguri ]
				system( $Programs['svn'], 'cp', uri.to_s, taguri.to_s,
					'-m', "Tagging for version %s" % [version] )
			else
				errorMessage "No supported version control system. Skipping tag."
			end
		end
	end

	# Make the distdir
	message "Making distribution directory #{distName}...\n"
	Dir.mkdir( distName ) unless FileTest.directory?( distName )
	for file in filelist
		FileUtils.mkdir_p( File.dirname(File.join(distName,file)), :verbose => true )
		FileUtils.ln( file, File.join(distName,file), :verbose => true )
	end

	# Make an archive file for each known kind
	for distro in Distros
		message "Making #{distro['type']} distribution..."
		distro['makeProc'].call( distName )
		message "done.\n"
	end

	# Remove the distdir
	message "removing dist build directory..."
	rm_rf distName, :verbose => $VERBOSE
	message "done.\n\n"
end

main	



