#
#	Install/distribution utility functions
#	$Id: utils.rb 10 2005-08-07 03:28:54Z ged $
#
#	Copyright (c) 2001-2005, The FaerieMUD Consortium.
#
#	This is free software. You may use, modify, and/or redistribute this
#	software under the terms of the Perl Artistic License. (See
#	http://language.perl.com/misc/Artistic.html)
#

BEGIN {
	require 'rbconfig'
	require 'uri'
	require 'find'
	require 'pp'

	begin
		require 'readline'
		include Readline
	rescue LoadError => e
		$stderr.puts "Faking readline..."
		def readline( prompt )
			$stderr.print prompt.chomp
			return $stdin.gets.chomp
		end
	end

	begin
		require 'yaml'
		$yaml = true
	rescue LoadError => e
		$stderr.puts "No YAML; try() will use PrettyPrint instead."
		$yaml = false
	end
}


module UtilityFunctions
	include Config

	# The list of regexen that eliminate files from the MANIFEST
	ANTIMANIFEST = [
		/makedist\.rb/,
		/\bCVS\b/,
		/~$/,
		/^#/,
		%r{docs/html},
		%r{docs/man},
		/\bTEMPLATE\.\w+\.tpl\b/,
		/\.cvsignore/,
		/\.s?o$/,
	]

	# Set some ANSI escape code constants (Shamelessly stolen from Perl's
	# Term::ANSIColor by Russ Allbery <rra@stanford.edu> and Zenin <zenin@best.com>
	AnsiAttributes = {
		'clear'      => 0,
		'reset'      => 0,
		'bold'       => 1,
		'dark'       => 2,
		'underline'  => 4,
		'underscore' => 4,
		'blink'      => 5,
		'reverse'    => 7,
		'concealed'  => 8,

		'black'      => 30,   'on_black'   => 40, 
		'red'        => 31,   'on_red'     => 41, 
		'green'      => 32,   'on_green'   => 42, 
		'yellow'     => 33,   'on_yellow'  => 43, 
		'blue'       => 34,   'on_blue'    => 44, 
		'magenta'    => 35,   'on_magenta' => 45, 
		'cyan'       => 36,   'on_cyan'    => 46, 
		'white'      => 37,   'on_white'   => 47
	}

	ErasePreviousLine = "\033[A\033[K"

	ManifestHeader = (<<-"EOF").gsub( /^\t+/, '' )
		#
		# Distribution Manifest
		# Created: #{Time::now.to_s}
		# 

	EOF

	###############
	module_function
	###############

	# Create a string that contains the ANSI codes specified and return it
	def ansiCode( *attributes )
		return '' unless /(?:vt10[03]|xterm(?:-color)?|linux|screen)/i =~ ENV['TERM']
		attr = attributes.collect {|a| AnsiAttributes[a] ? AnsiAttributes[a] : nil}.compact.join(';')
		if attr.empty? 
			return ''
		else
			return "\e[%sm" % attr
		end
	end

	# Test for the presence of the specified <tt>library</tt>, and output a
	# message describing the test using <tt>nicename</tt>. If <tt>nicename</tt>
	# is <tt>nil</tt>, the value in <tt>library</tt> is used to build a default.
	def testForLibrary( library, nicename=nil, progress=false )
		nicename ||= library
		message( "Testing for the #{nicename} library..." ) if progress
		if $LOAD_PATH.detect {|dir|
				File.exists?(File.join(dir,"#{library}.rb")) ||
				File.exists?(File.join(dir,"#{library}.#{CONFIG['DLEXT']}"))
			}
			message( "found.\n" ) if progress
			return true
		else
			message( "not found.\n" ) if progress
			return false
		end
	end

	# Test for the presence of the specified <tt>library</tt>, and output a
	# message describing the problem using <tt>nicename</tt>. If
	# <tt>nicename</tt> is <tt>nil</tt>, the value in <tt>library</tt> is used
	# to build a default. If <tt>raaUrl</tt> and/or <tt>downloadUrl</tt> are
	# specified, they are also use to build a message describing how to find the
	# required library. If <tt>fatal</tt> is <tt>true</tt>, a missing library
	# will cause the program to abort.
	def testForRequiredLibrary( library, nicename=nil, raaUrl=nil, downloadUrl=nil, fatal=true )
		nicename ||= library
		unless testForLibrary( library, nicename )
			msgs = [ "You are missing the required #{nicename} library.\n" ]
			msgs << "RAA: #{raaUrl}\n" if raaUrl
			msgs << "Download: #{downloadUrl}\n" if downloadUrl
			if fatal
				abort msgs.join('')
			else
				errorMessage msgs.join('')
			end
		end
		return true
	end

	### Output <tt>msg</tt> as a ANSI-colored program/section header (white on
	### blue).
	def header( msg )
		msg.chomp!
		$stderr.puts ansiCode( 'bold', 'white', 'on_blue' ) + msg + ansiCode( 'reset' )
		$stderr.flush
	end

	### Output <tt>msg</tt> to STDERR and flush it.
	def message( *msgs )
		$stderr.print( msgs.join("\n") )
		$stderr.flush
	end

	### Output +msg+ to STDERR and flush it if $VERBOSE is true.
	def verboseMsg( msg )
		msg.chomp!
		message( msg + "\n" ) if $VERBOSE
	end

	### Output the specified <tt>msg</tt> as an ANSI-colored error message
	### (white on red).
	def errorMessage( msg )
		message ansiCode( 'bold', 'white', 'on_red' ) + msg + ansiCode( 'reset' )
	end

	### Output the specified <tt>msg</tt> as an ANSI-colored debugging message
	### (yellow on blue).
	def debugMsg( msg )
		return unless $DEBUG
		msg.chomp!
		$stderr.puts ansiCode( 'bold', 'yellow', 'on_blue' ) + ">>> #{msg}" + ansiCode( 'reset' )
		$stderr.flush
	end

	### Erase the previous line (if supported by your terminal) and output the
	### specified <tt>msg</tt> instead.
	def replaceMessage( msg )
		$stderr.print ErasePreviousLine
		message( msg )
	end

	### Output a divider made up of <tt>length</tt> hyphen characters.
	def divider( length=75 )
		$stderr.puts "\r" + ("-" * length )
	end
	alias :writeLine :divider


	### Output the specified <tt>msg</tt> colored in ANSI red and exit with a
	### status of 1.
	def abort( msg )
		print ansiCode( 'bold', 'red' ) + "Aborted: " + msg.chomp + ansiCode( 'reset' ) + "\n\n"
		Kernel.exit!( 1 )
	end


	### Output the specified <tt>promptString</tt> as a prompt (in green) and
	### return the user's input with leading and trailing spaces removed.  If a
	### test is provided, the prompt will repeat until the test returns true.
	### An optional failure message can also be passed in.
	def prompt( promptString, failure_msg="Try again." ) # :yields: response
		promptString.chomp!
		response = nil

		begin
			response = readline( ansiCode('bold', 'green') +
				"#{promptString}: " + ansiCode('reset') ).strip
			if block_given? && ! yield( response ) 
				errorMessage( failure_msg + "\n\n" )
				response = nil
			end
		end until response

		return response
	end


	### Prompt the user with the given <tt>promptString</tt> via #prompt,
	### substituting the given <tt>default</tt> if the user doesn't input
	### anything.  If a test is provided, the prompt will repeat until the test
	### returns true.  An optional failure message can also be passed in.
	def promptWithDefault( promptString, default, failure_msg="Try again." )
		response = nil
		
		begin
			response = prompt( "%s [%s]" % [ promptString, default ] )
			response = default if response.empty?

			if block_given? && ! yield( response ) 
				errorMessage( failure_msg + "\n\n" )
				response = nil
			end
		end until response

		return response
	end


	$programs = {}

	### Search for the program specified by the given <tt>progname</tt> in the
	### user's <tt>PATH</tt>, and return the full path to it, or <tt>nil</tt> if
	### no such program is in the path.
	def findProgram( progname )
		unless $programs.key?( progname )
			ENV['PATH'].split(File::PATH_SEPARATOR).each {|d|
				file = File.join( d, progname )
				if File.executable?( file )
					$programs[ progname ] = file 
					break
				end
			}
		end

		return $programs[ progname ]
	end


	### Search for the release version for the project in the specified
	### +directory+.
	def extractVersion( directory='.' )
		release = nil

		Dir::chdir( directory ) do
			if File::directory?( "CVS" )
				verboseMsg( "Project is versioned via CVS. Searching for RELEASE_*_* tags..." )

				if (( cvs = findProgram('cvs') ))
					revs = []
					output = %x{cvs log}
					output.scan( /RELEASE_(\d+(?:_\d\w+)*)/ ) {|match|
						rev = $1.split(/_/).collect {|s| Integer(s) rescue 0}
						verboseMsg( "Found %s...\n" % rev.join('.') )
						revs << rev
					}

					release = revs.sort.last
				end

			elsif File::directory?( '.svn' )
				verboseMsg( "Project is versioned via Subversion" )

				if (( svn = findProgram('svn') ))
					output = %x{svn pg project-version}.chomp
					unless output.empty?
						verboseMsg( "Using 'project-version' property: %p" % output )
						release = output.split( /[._]/ ).collect {|s| Integer(s) rescue 0}
					end
				end
			end
		end

		return release
	end


	### Find the current release version for the project in the specified
	### +directory+ and return its successor.
	def extractNextVersion( directory='.' )
		version = extractVersion( directory ) || [0,0,0]
		version.compact!
		version[-1] += 1

		return version
	end


	# Pattern for extracting the name of the project from a Subversion URL
	SVNUrlPath = %r{
		.*/						# Skip all but the last bit
		(\w+)					# $1 = project name
		/						# Followed by / +
		(?:
			trunk |				# 'trunk'
			(
				branches |		# ...or branches/branch-name
				tags			# ...or tags/tag-name
			)/\w	
		)
		$						# bound to the end
	}ix

	### Extract the project name (CVS Repository name) for the given +directory+.
	def extractProjectName( directory='.' )
		name = nil

		Dir::chdir( directory ) do

			# CVS-controlled
			if File::directory?( "CVS" )
				verboseMsg( "Project is versioned via CVS. Using repository name." )
				name = File.open( "CVS/Repository", "r").readline.chomp
				name.sub!( %r{.*/}, '' )

			# Subversion-controlled
			elsif File::directory?( '.svn' )
				verboseMsg( "Project is versioned via Subversion" )

				# If the machine has the svn tool, try to get the project name
				if (( svn = findProgram( 'svn' ) ))

					# First try an explicit property
					output = shellCommand( svn, 'pg', 'project-name' )
					if !output.empty?
						verboseMsg( "Using 'project-name' property: %p" % output )
						name = output.first.chomp

					# If that doesn't work, try to figure it out from the URL
					elsif (( uri = getSvnUri() ))
						name = uri.path.sub( SVNUrlPath ) { $1 }
					end
				end
			end

			# Fall back to guessing based on the directory name
			unless name
				name = File::basename(File::dirname( File::expand_path(__FILE__) ))
			end
		end

		return name
	end


	### Extract the Subversion URL from the specified directory and return it as
	### a URI object.
	def getSvnUri( directory='.' )
		uri = nil

		Dir::chdir( directory ) do
			output = %x{svn info}
			debugMsg( "Using info: %p" % output )

			if /^URL: \s* ( .* )/xi.match( output )
				uri = URI::parse( $1 )
			end
		end

		return uri
	end


	### (Re)make a manifest file in the specified +path+.
	def makeManifest( path="MANIFEST" )
		if File::exists?( path )
			reply = promptWithDefault( "Replace current '#{path}'? [yN]", "n" )
			return false unless /^y/i.match( reply )

			verboseMsg "Replacing manifest at '#{path}'"
		else
			verboseMsg "Creating new manifest at '#{path}'"
		end

		files = []
		verboseMsg( "Finding files...\n" )
		Find::find( Dir::pwd ) do |f|
			Find::prune if File::directory?( f ) &&
				/^\./.match( File::basename(f) )
			verboseMsg( "  found: #{f}\n" )
			files << f.sub( %r{^#{Dir::pwd}/?}, '' )
		end
		files = vetManifest( files )
		
		verboseMsg( "Writing new manifest to #{path}..." )
		File::open( path, File::WRONLY|File::CREAT|File::TRUNC ) do |ofh|
			ofh.puts( ManifestHeader )
			ofh.puts( files )
		end
		verboseMsg( "done." )
	end


	### Read the specified <tt>manifestFile</tt>, which is a text file
	### describing which files to package up for a distribution. The manifest
	### should consist of one or more lines, each containing one filename or
	### shell glob pattern.
	def readManifest( manifestFile="MANIFEST" )
		verboseMsg "Building manifest..."
		raise "Missing #{manifestFile}, please remake it" unless File.exists? manifestFile

		manifest = IO::readlines( manifestFile ).collect {|line|
			line.chomp
		}.select {|line|
			line !~ /^(\s*(#.*)?)?$/
		}

		filelist = []
		for pat in manifest
			verboseMsg "Adding files that match '#{pat}' to the file list"
			filelist |= Dir.glob( pat ).find_all {|f| FileTest.file?(f)}
		end

		verboseMsg "found #{filelist.length} files.\n"
		return filelist
	end


	### Given a <tt>filelist</tt> like that returned by #readManifest, remove
	### the entries therein which match the Regexp objects in the given
	### <tt>antimanifest</tt> and return the resultant Array.
	def vetManifest( filelist, antimanifest=ANTIMANIFEST )
		origLength = filelist.length
		verboseMsg "Vetting manifest..."

		for regex in antimanifest
			verboseMsg "\n\tPattern /#{regex.source}/ removed: " +
				filelist.find_all {|file| regex.match(file)}.join(', ')
			filelist.delete_if {|file| regex.match(file)}
		end

		verboseMsg "removed #{origLength - filelist.length} files from the list.\n"
		return filelist
	end


	### Combine a call to #readManifest with one to #vetManifest.
	def getVettedManifest( manifestFile="MANIFEST", antimanifest=ANTIMANIFEST )
		vetManifest( readManifest(manifestFile), antimanifest )
	end


	### Given a documentation <tt>catalogFile</tt>, extract the title, if
	### available, and return it. Otherwise generate a title from the name of
	### the CVS module.
	def findRdocTitle( catalogFile="docs/CATALOG" )

		# Try extracting it from the CATALOG file from a line that looks like:
		# Title: Foo Bar Module
		title = findCatalogKeyword( 'title', catalogFile )

		# If that doesn't work for some reason, use the name of the project.
		title = extractProjectName()

		return title
	end


	### Given a documentation <tt>catalogFile</tt>, extract the name of the file
	### to use as the initally displayed page. If extraction fails, the
	### +default+ will be used if it exists. Returns +nil+ if there is no main
	### file to be found.
	def findRdocMain( catalogFile="docs/CATALOG", default="README" )

		# Try extracting it from the CATALOG file from a line that looks like:
		# Main: Foo Bar Module
		main = findCatalogKeyword( 'main', catalogFile )

		# Try to make some educated guesses if that doesn't work
		if main.nil?
			basedir = File::dirname( __FILE__ )
			basedir = File::dirname( basedir ) if /docs$/ =~ basedir
			
			if File::exists?( File::join(basedir, default) )
				main = default
			end
		end

		return main
	end


	### Given a documentation <tt>catalogFile</tt>, extract an upload URL for
	### RDoc.
	def findRdocUpload( catalogFile="docs/CATALOG" )
		findCatalogKeyword( 'upload', catalogFile )
	end


	### Given a documentation <tt>catalogFile</tt>, extract a CVS web frontend
	### URL for RDoc.
	def findRdocCvsURL( catalogFile="docs/CATALOG" )
		findCatalogKeyword( 'webcvs', catalogFile )
	end


	### Given a documentation <tt>catalogFile</tt>, try extracting the given
	### +keyword+'s value from it. Keywords are lines that look like:
	###   # <keyword>: <value>
	### Returns +nil+ if the catalog file was unreadable or didn't contain the
	### specified +keyword+.
	def findCatalogKeyword( keyword, catalogFile="docs/CATALOG" )
		val = nil

		if File::exists? catalogFile
			verboseMsg "Extracting '#{keyword}' from CATALOG file (%s).\n" % catalogFile
			File::foreach( catalogFile ) {|line|
				debugMsg( "Examining line #{line.inspect}..." )
				val = $1.strip and break if /^#\s*#{keyword}:\s*(.*)$/i =~ line
			}
		end

		return val
	end


	### Given a documentation <tt>catalogFile</tt>, which is in the same format
	### as that described by #readManifest, read and expand it, and then return
	### a list of those files which appear to have RDoc documentation in
	### them. If <tt>catalogFile</tt> is nil or does not exist, the MANIFEST
	### file is used instead.
	def findRdocableFiles( catalogFile="docs/CATALOG" )
		startlist = []
		if File.exists? catalogFile
			verboseMsg "Using CATALOG file (%s).\n" % catalogFile
			startlist = getVettedManifest( catalogFile )
		else
			verboseMsg "Using default MANIFEST\n"
			startlist = getVettedManifest()
		end

		verboseMsg "Looking for RDoc comments in:\n"
		startlist.select {|fn|
			verboseMsg "  #{fn}: "
			found = false
			File::open( fn, "r" ) {|fh|
				fh.each {|line|
					if line =~ /^(\s*#)?\s*=/ || line =~ /:\w+:/ || line =~ %r{/\*}
						found = true
						break
					end
				}
			}

			verboseMsg( (found ? "yes" : "no") + "\n" )
			found
		}
	end

	### Open a file and filter each of its lines through the given block a
	### <tt>line</tt> at a time. The return value of the block is used as the
	### new line, or omitted if the block returns <tt>nil</tt> or
	### <tt>false</tt>.
	def editInPlace( file, testMode=false ) # :yields: line
		raise "No block specified for editing operation" unless block_given?

		tempName = "#{file}.#{$$}"
		File::open( tempName, File::RDWR|File::CREAT, 0600 ) {|tempfile|
			File::open( file, File::RDONLY ) {|fh|
				fh.each {|line|
					newline = yield( line ) or next
					tempfile.print( newline )
					$deferr.puts "%p -> %p" % [ line, newline ] if
						line != newline
				}
			}
		}

		if testMode
			File::unlink( tempName )
		else
			File::rename( tempName, file )
		end
	end

	### Execute the specified shell <tt>command</tt>, read the results, and
	### return them. Like a %x{} that returns an Array instead of a String.
	def shellCommand( *command )
		raise "Empty command" if command.empty?

		cmdpipe = IO::popen( command.join(' '), 'r' )
		return cmdpipe.readlines
	end

	### Execute a block with $VERBOSE set to +false+, restoring it to its
	### previous value before returning.
	def verboseOff
		raise LocalJumpError, "No block given" unless block_given?

		thrcrit = Thread.critical
		oldverbose = $VERBOSE
		begin
			Thread.critical = true
			$VERBOSE = false
			yield
		ensure
			$VERBOSE = oldverbose
			Thread.critical = false
		end
	end


	### Try the specified code block, printing the given 
	def try( msg, bind=nil )
		result = ''
		if msg =~ /^to\s/
			message "Trying #{msg}...\n"
		else
			message msg + "\n"
		end
			
		begin
			rval = nil
			if block_given?
				rval = yield
			else
				file, line = caller(1)[0].split(/:/,2)
				rval = eval( msg, bind, file, line.to_i )
			end

			if $yaml
				result = rval.to_yaml
			else
				PP.pp( rval, result )
			end

		rescue Exception => err
			if err.backtrace
				nicetrace = err.backtrace.delete_if {|frame|
					/in `(try|eval)'/ =~ frame
				}.join("\n\t")
			else
				nicetrace = "Exception had no backtrace"
			end

			result = err.message + "\n\t" + nicetrace
		ensure
			divider
			message result + "\n"
			divider
			$deferr.puts
		end
	end
end


if __FILE__ == $0
	# $DEBUG = true
	include UtilityFunctions

	projname = extractProjectName()
	header "Project: #{projname}"

	ver = extractVersion() || [0,0,1]
	puts "Version: %s\n" % ver.join('.')

	if File::directory?( "docs" )
		puts "Rdoc:",
			"  Title: " + findRdocTitle(),
			"  Main: " + findRdocMain(),
			"  Upload: " + findRdocUpload(),
			"  SCCS URL: " + findRdocCvsURL()
	end

	puts "Manifest:",
		"  " + getVettedManifest().join("\n  ")
end
