#!/usr/bin/ruby
#
#	RDoc Documentation Generation Script
#	$Id: makedocs.rb,v 1.2 2003/09/11 04:51:26 deveiant Exp $
#
#	Copyright (c) 2001-2003 The FaerieMUD Consortium.
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
require 'getoptlong'
require 'rdoc/rdoc'
require 'utils'
include UtilityFunctions

def makeDocs( docsdir, template='css2', diagrams=false, upload=nil, ridocs=false )
	debugMsg "docsdir = %p, template = %p, diagrams = %p, upload = %p, ridocs = %p" %
		[docsdir, template, diagrams, upload, ridocs]

	title = findRdocTitle()
	docs = findRdocableFiles()
	main = findRdocMain()
	webcvs = findRdocCvsURL()

	header "Making documentation in #{docsdir}."
	header "Will upload to '#{upload}'\n" if upload
	header "Will also create/install 'ri' source" if ridocs

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

	buildDocs( flags, docs )
	uploadDocs( upload, docsdir ) if upload
	buildRi( docs ) if ridocs
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
	message "Running 'rdoc #{flags.join(' ')} #{docs.join(' ')}'\n" if $VERBOSE
	unless $DEBUG
		begin
			r = RDoc::RDoc.new
			r.document([ '-i', 'docs', '-f', 'xml', 'lib', 'ext' ])
		rescue RDoc::RDocError => e
			$stderr.puts e.message
			exit(1)
		end
	end
	
end


if $0 == __FILE__
	opts = GetoptLong.new
	opts.set_options(
		[ '--debug',	'-d',	GetoptLong::NO_ARGUMENT ],
		[ '--verbose',	'-v',	GetoptLong::NO_ARGUMENT ],
		[ '--upload',	'-u',	GetoptLong::OPTIONAL_ARGUMENT ],
		[ '--diagrams', '-D',	GetoptLong::NO_ARGUMENT ],
		[ '--template',	'-T',	GetoptLong::REQUIRED_ARGUMENT ],
		[ '--output',	'-o',	GetoptLong::REQUIRED_ARGUMENT ]
		#[ '--ri',		'-r',	GetoptLong::NO_ARGUMENT ],
	)

	debug = false
	verbose = false
	upload = nil
	diagrams = false
	template = 'css2'
	docsdir = "docs/html"
	rimode = false
	
	opts.each {|opt,val|
		case opt

		when '--debug'
			debug = true

		when '--verbose'
			verbose = true

		when '--upload'
			upload = val
			upload = findRdocUpload() if val.nil? || val.empty?

		when '--diagrams'
			diagrams = true

		when '--output'
			docsdir = val

 		when '--ri'
 			rimode = true

		end
	}

	$DEBUG = true if debug
	$VERBOSE = true if verbose

	makeDocs( docsdir, template, diagrams, upload, rimode )
end
