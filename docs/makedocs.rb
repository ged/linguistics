#!/usr/bin/ruby
#
#	RDoc Documentation Generation Script
#	$Id: makedocs.rb,v b5d49e0c35ca 2005/07/13 22:35:45 ged $
#
#	Copyright (c) 2001-2005 The FaerieMUD Consortium.
#
#	This is free software. You may use, modify, and/or redistribute this
#	software under the terms of the Perl Artistic License. (See
#	http://language.perl.com/misc/Artistic.html)
#

# Make sure we're in the correct directory, and if not, change there.
BEGIN {
	basedir = File::dirname(File::dirname( File::expand_path(__FILE__) ))
	unless Dir::pwd == basedir
		Dir::chdir( basedir ) 
	end
	$LOAD_PATH.unshift basedir
}

# Load modules
require 'optparse'
require 'rdoc/rdoc'
require 'utils'
include UtilityFunctions

def makeDocs( docsdir, template='html', diagrams=false, upload=nil, ridocs=false )
	debugMsg "docsdir = %p, template = %p, diagrams = %p, upload = %p, ridocs = %p" %
		[docsdir, template, diagrams, upload, ridocs]

	title = findRdocTitle()
	docs = findRdocableFiles()
	main = findRdocMain()
	webcvs = findRdocCvsURL()


	flags = [
		'--all',
		'--inline-source',
		'--fmt', 'html',
		'--include', 'docs',
		'--template', template,
		'--op', docsdir,
		'--title', title,
		'--tab-width', 4,
	]

	flags += [ '--quiet' ] unless $VERBOSE
	flags += [ '--diagram' ] if diagrams
	flags += [ '--main', main ] if main
	flags += [ '--webcvs', webcvs ] if webcvs

	if ridocs
		header "Will create/install 'ri' source" if ridocs
		buildRi( docs )
	else
		header "Making documentation in #{docsdir}."
		header "Will upload to '#{upload}'\n" if upload
		buildDocs( flags, docs )
		uploadDocs( upload, docsdir ) if upload
	end
end


def buildDocs( flags, docs )
	message "Running 'rdoc #{flags.join(' ')} #{docs.join(' ')}'\n" if $VERBOSE
	unless $DEBUG
		begin
			r = RDoc::RDoc.new
			r.document( flags + docs )
		rescue RDoc::RDocError => e
			$stderr.puts e.message
			exit(1)
		end
	end
end


def uploadDocs( url, docsdir )
	header "Uploading new docs snapshot to #{url}."

	case url
	
	# SSH target
	when %r{^ssh://(.*)}
		target = $1
		if target =~ %r{^([^/]+)/(.*)}
			host, path = $1, $2
			path = "/" + path unless path =~ /^(\/|\.)/
			cmd = "tar -C #{docsdir} -cf - . | ssh #{host} 'tar -C #{path} -xvf -'"
			unless $DEBUG
				system( cmd )
			else
				message "Would have uploaded using the command:\n    #{cmd}\n\n"
			end
		else
			abort "--upload ssh://host/path"
		end
	when %r{^file://(.*)}
		targetdir = $1
		targetdir.gsub!( %r{^file://}, '' )

		File.makedirs targetdir, true
		Dir["#{docsdir}/**/*"].each {|file|
			fname = file.gsub( %r:#{docsdir}/:, '' )
			if File.directory? file
				unless $DEBUG
					File.makedirs File.join(targetdir, fname), true
				else
					message %{File.makedirs %s, true\n} % File.join(targetdir, fname)
				end
			else
				unless $DEBUG
					File.install( file, File.join(targetdir, fname), 0444, true )
				else
					message %{File.install( %s, %s, 0444, true )\n} % [
						file,
						File.join(targetdir, fname),
					]
				end
			end
		}

	else
		raise "I don't know how to upload to urls like '#{url}'."
	end
end

def buildRi( docs )
	message "Running 'rdoc -R #{docs.join(' ')}'\n" if $VERBOSE
	unless $DEBUG
		begin
			r = RDoc::RDoc.new
			r.document( ['-R'] + docs )
		rescue RDoc::RDocError => e
			$stderr.puts e.message
			exit(1)
		end
	end
	
end


if $0 == __FILE__
	upload = nil
	diagrams = false
	template = 'html'
	docsdir = "docs/html"
	rimode = false
	

	# Read command-line options
	ARGV.options do |oparser|
		oparser.banner = "Usage: #$0 [options]\n"

		oparser.separator "RDoc options:"
		oparser.on( "--diagrams", "-d", TrueClass, "Generate diagrams" ) do
			diagrams = true
		end

		oparser.on( "--output=DIR", "-o=DIR", String, "Set the output directory" ) do
			docsdir = val
		end

 		oparser.on( "--ri", "-R", TrueClass, "Generate content for 'ri' instead of HTML" ) do
 			rimode = true
		end

		oparser.separator ""
		oparser.separator "Post-generation options:"

		oparser.on( "--upload=[URI]", "-u=[URI]", String, "Upload to the given URI" ) do |val|
			upload = val
			upload = findRdocUpload() if val.nil? || val.empty?
		end

		oparser.separator ""
		oparser.separator "Output options:"

		oparser.on( "--debug", "-d", TrueClass, "Output debugging information" ) do
			$VERBOSE = true
			debugMsg "Turned debugging on."
		end

		oparser.on( "--verbose", "-v", TrueClass, "Make progress verbose" ) do
			$VERBOSE = true
			debugMsg "Turned verbose on."
		end

		# Handle the 'help' option
		oparser.on( "--help", "-h", "Display this text." ) do
			$stderr.puts oparser
			exit!(0)
		end

		oparser.parse!
	end

	makeDocs( docsdir, template, diagrams, upload, rimode )
end
