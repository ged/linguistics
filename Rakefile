#!rake
#
# Linguistics rakefile
#
# Based on various other Rakefiles, especially one by Ben Bleything
#
# Copyright (c) 2008 The FaerieMUD Consortium
#
# Authors:
#  * Michael Granger <ged@FaerieMUD.org>
#

BEGIN {
	require 'pathname'
	basedir = Pathname.new( __FILE__ ).dirname

	libdir = basedir + "lib"
	extdir = basedir + "ext"

	$LOAD_PATH.unshift( libdir.to_s ) unless $LOAD_PATH.include?( libdir.to_s )
	$LOAD_PATH.unshift( extdir.to_s ) unless $LOAD_PATH.include?( extdir.to_s )
}

require 'rubygems'
gem 'rake', '>= 0.8.3'

require 'rbconfig'
require 'rake'
require 'rake/rdoctask'
require 'rake/testtask'
require 'rake/packagetask'
require 'rake/clean'

$dryrun = false

### Config constants
BASEDIR       = Pathname.new( __FILE__ ).dirname.relative_path_from( Pathname.getwd )
BINDIR        = BASEDIR + 'bin'
LIBDIR        = BASEDIR + 'lib'
EXTDIR        = BASEDIR + 'ext'
DOCSDIR       = BASEDIR + 'docs'
PKGDIR        = BASEDIR + 'pkg'
DATADIR       = BASEDIR + 'data'

PROJECT_NAME  = 'Linguistics'
PKG_NAME      = PROJECT_NAME.downcase
PKG_SUMMARY   = 'a framework for building linguistic utilities for Ruby objects'

VERSION_FILE  = LIBDIR + 'linguistics.rb'
if VERSION_FILE.exist? && buildrev = ENV['CC_BUILD_LABEL']
	PKG_VERSION = VERSION_FILE.read[ /VERSION\s*=\s*['"](\d+\.\d+\.\d+)['"]/, 1 ] + '.' + buildrev
elsif VERSION_FILE.exist?
	PKG_VERSION = VERSION_FILE.read[ /VERSION\s*=\s*['"](\d+\.\d+\.\d+)['"]/, 1 ]
else
	PKG_VERSION = '0.0.0'
end

PKG_FILE_NAME = "#{PKG_NAME.downcase}-#{PKG_VERSION}"
GEM_FILE_NAME = "#{PKG_FILE_NAME}.gem"

EXTCONF       = EXTDIR + 'extconf.rb'

ARTIFACTS_DIR = Pathname.new( ENV['CC_BUILD_ARTIFACTS'] || 'artifacts' )

TEXT_FILES    = %w( Rakefile ChangeLog README LICENSE ).collect {|filename| BASEDIR + filename }
BIN_FILES     = Pathname.glob( BINDIR + '*' ).delete_if {|item| item =~ /\.svn/ }
LIB_FILES     = Pathname.glob( LIBDIR + '**/*.rb' ).delete_if {|item| item =~ /\.svn/ }
EXT_FILES     = Pathname.glob( EXTDIR + '**/*.{c,h,rb}' ).delete_if {|item| item =~ /\.svn/ }
DATA_FILES    = Pathname.glob( DATADIR + '**/*' ).delete_if {|item| item =~ /\.svn/ }

SPECDIR       = BASEDIR + 'spec'
SPECLIBDIR    = SPECDIR + 'lib'
SPEC_FILES    = Pathname.glob( SPECDIR + '**/*_spec.rb' ).delete_if {|item| item =~ /\.svn/ } +
                Pathname.glob( SPECLIBDIR + '**/*.rb' ).delete_if {|item| item =~ /\.svn/ }

TESTDIR       = BASEDIR + 'tests'
TEST_FILES    = Pathname.glob( TESTDIR + '**/*.tests.rb' ).delete_if {|item| item =~ /\.svn/ }

RAKE_TASKDIR  = BASEDIR + 'rake'
RAKE_TASKLIBS = Pathname.glob( RAKE_TASKDIR + '*.rb' )

LOCAL_RAKEFILE = BASEDIR + 'Rakefile.local'

EXTRA_PKGFILES = []
EXTRA_PKGFILES.concat Pathname.glob( BASEDIR + 'examples/*.rb' ).delete_if {|item| item =~ /\.svn/ } 
EXTRA_PKGFILES.concat Pathname.glob( BASEDIR + 'README.english' ).delete_if {|item| item =~ /\.svn/ } 

RELEASE_FILES = TEXT_FILES + 
	SPEC_FILES + 
	TEST_FILES + 
	BIN_FILES +
	LIB_FILES + 
	EXT_FILES + 
	DATA_FILES + 
	RAKE_TASKLIBS +
	EXTRA_PKGFILES

RELEASE_FILES << LOCAL_RAKEFILE if LOCAL_RAKEFILE.exist?

COVERAGE_MINIMUM = ENV['COVERAGE_MINIMUM'] ? Float( ENV['COVERAGE_MINIMUM'] ) : 85.0
RCOV_EXCLUDES = 'spec,tests,/Library/Ruby,/var/lib,/usr/local/lib'
RCOV_OPTS = [
	'--exclude', RCOV_EXCLUDES,
	'--xrefs',
	'--save',
	'--callsites',
	#'--aggregate', 'coverage.data' # <- doesn't work as of 0.8.1.2.0
  ]


# Subversion constants -- directory names for releases and tags
SVN_TRUNK_DIR    = 'trunk'
SVN_RELEASES_DIR = 'releases'
SVN_BRANCHES_DIR = 'branches'
SVN_TAGS_DIR     = 'tags'

SVN_DOTDIR       = BASEDIR + '.svn'
SVN_ENTRIES      = SVN_DOTDIR + 'entries'


### Load some task libraries that need to be loaded early
require RAKE_TASKDIR + 'helpers.rb'
require RAKE_TASKDIR + 'svn.rb'
require RAKE_TASKDIR + 'verifytask.rb'

# Define some constants that depend on the 'svn' tasklib
PKG_BUILD = get_svn_rev( BASEDIR ) || 0
SNAPSHOT_PKG_NAME = "#{PKG_FILE_NAME}.#{PKG_BUILD}"
SNAPSHOT_GEM_NAME = "#{SNAPSHOT_PKG_NAME}.gem"

# Documentation constants
RDOCDIR = DOCSDIR + 'api'
RDOC_OPTIONS = [
	'-w', '4',
	'-SHN',
	'-i', '.',
	'-m', 'README',
	'-t', PKG_NAME,
	'-W', 'http://deveiate.org/projects/Linguistics/browser/trunk/'
  ]

# Release constants
SMTP_HOST = 'mail.faeriemud.org'
SMTP_PORT = 465 # SMTP + SSL

# Project constants
PROJECT_HOST = 'deveiate'
PROJECT_PUBDIR = '/usr/local/www/public/code'
PROJECT_DOCDIR = "#{PROJECT_PUBDIR}/#{PKG_NAME}"
PROJECT_SCPPUBURL = "#{PROJECT_HOST}:#{PROJECT_PUBDIR}"
PROJECT_SCPDOCURL = "#{PROJECT_HOST}:#{PROJECT_DOCDIR}"

# Rubyforge stuff
RUBYFORGE_GROUP = 'deveiate'
RUBYFORGE_PROJECT = 'linguistics'

# Gem dependencies: gemname => version
DEPENDENCIES = {
}

# Developer Gem dependencies: gemname => version
DEVELOPMENT_DEPENDENCIES = {
	'amatch'      => '>= 0.2.3',
	'rake'        => '>= 0.8.1',
	'rcodetools'  => '>= 0.7.0.0',
	'rcov'        => '>= 0',
	'RedCloth'    => '>= 4.0.3',
	'rspec'       => '>= 0',
	'rubyforge'   => '>= 0',
	'termios'     => '>= 0',
	'text-format' => '>= 1.0.0',
	'tmail'       => '>= 1.2.3.1',
	'ultraviolet' => '>= 0.10.2',
	'libxml-ruby' => '>= 0.8.3',
	'wordnet' => '>=0.0.5',
	'linkparser' => '>=1.0.3',
}

# Non-gem requirements: packagename => version
REQUIREMENTS = {
}

# RubyGem specification
GEMSPEC   = Gem::Specification.new do |gem|
	gem.name              = PKG_NAME.downcase
	gem.version           = PKG_VERSION

	gem.summary           = PKG_SUMMARY
	gem.description       = [
		"in any language. It includes a generic language-independant front end, a",
		"module for mapping language codes into language names, and a module which",
		"contains various English-language utilities.",
  	  ].join( "\n" )

	gem.authors           = 'Michael Granger'
	gem.email             = 'ged@FaerieMUD.org'
	gem.homepage          = 'http://deveiate.org/projects/Linguistics/'
	gem.rubyforge_project = RUBYFORGE_PROJECT

	gem.has_rdoc          = true
	gem.rdoc_options      = RDOC_OPTIONS
	gem.extra_rdoc_files  = %w[ChangeLog README LICENSE]

	gem.bindir            = BINDIR.relative_path_from(BASEDIR).to_s
	gem.executables       = BIN_FILES.select {|pn| pn.executable? }.
		collect {|pn| pn.relative_path_from(BINDIR).to_s }

	if EXTCONF.exist?
		gem.extensions << EXTCONF.relative_path_from( BASEDIR ).to_s
	end

	gem.files             = RELEASE_FILES.
		collect {|f| f.relative_path_from(BASEDIR).to_s }
	gem.test_files        = SPEC_FILES.
		collect {|f| f.relative_path_from(BASEDIR).to_s }
		
	DEPENDENCIES.each do |name, version|
		version = '>= 0' if version.length.zero?
		gem.add_runtime_dependency( name, version )
	end
	
	# Developmental dependencies don't work as of RubyGems 1.2.0
	unless Gem::Version.new( Gem::RubyGemsVersion ) <= Gem::Version.new( "1.2.0" )
		DEVELOPMENT_DEPENDENCIES.each do |name, version|
			version = '>= 0' if version.length.zero?
			gem.add_development_dependency( name, version )
		end
	end
	
	REQUIREMENTS.each do |name, version|
		gem.requirements << [ name, version ].compact.join(' ')
	end
end

# Manual-generation config
MANUALDIR = DOCSDIR + 'manual'

$trace = Rake.application.options.trace ? true : false
$dryrun = Rake.application.options.dryrun ? true : false


# Load any remaining task libraries
RAKE_TASKLIBS.each do |tasklib|
	next if tasklib =~ %r{/(helpers|svn|verifytask)\.rb$}
	begin
		require tasklib
	rescue ScriptError => err
		fail "Task library '%s' failed to load: %s: %s" %
			[ tasklib, err.class.name, err.message ]
		trace "Backtrace: \n  " + err.backtrace.join( "\n  " )
	rescue => err
		log "Task library '%s' failed to load: %s: %s. Some tasks may not be available." %
			[ tasklib, err.class.name, err.message ]
		trace "Backtrace: \n  " + err.backtrace.join( "\n  " )
	end
end

# Load any project-specific rules defined in 'Rakefile.local' if it exists
import LOCAL_RAKEFILE if LOCAL_RAKEFILE.exist?


#####################################################################
###	T A S K S 	
#####################################################################

### Default task
task :default  => [:clean, :local, :spec, :rdoc, :package]

### Task the local Rakefile can append to -- no-op by default
task :local


### Task: clean
CLEAN.include 'coverage'
CLOBBER.include 'artifacts', 'coverage.info', PKGDIR

# Target to hinge on ChangeLog updates
file SVN_ENTRIES

### Task: changelog
file 'ChangeLog' => SVN_ENTRIES.to_s do |task|
	log "Updating #{task.name}"

	changelog = make_svn_changelog()
	File.open( task.name, 'w' ) do |fh|
		fh.print( changelog )
	end
end


### Task: cruise (Cruisecontrol task)
desc "Cruisecontrol build"
task :cruise => [:clean, 'spec:quiet', :package] do |task|
	raise "Artifacts dir not set." if ARTIFACTS_DIR.to_s.empty?
	artifact_dir = ARTIFACTS_DIR.cleanpath + ENV['CC_BUILD_LABEL']
	artifact_dir.mkpath
	
	coverage = BASEDIR + 'coverage'
	if coverage.exist? && coverage.directory?
		$stderr.puts "Copying coverage stats..."
		FileUtils.cp_r( 'coverage', artifact_dir )
	end
	
	$stderr.puts "Copying packages..."
	FileUtils.cp_r( FileList['pkg/*'].to_a, artifact_dir )
end


desc "Update the build system to the latest version"
task :update_build do
	log "Updating the build system"
	sh 'svn', 'up', RAKE_TASKDIR
	log "Updating the Rakefile"
	sh 'rake', '-f', RAKE_TASKDIR + 'Metarakefile'
end

