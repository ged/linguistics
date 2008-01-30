#####################################################################
###	S U B V E R S I O N   T A S K S   A N D   H E L P E R S
#####################################################################

require 'yaml'
require 'English'

# Strftime format for tags/releases
TAG_TIMESTAMP_FORMAT = '%Y%m%d-%H%M%S'
TAG_TIMESTAMP_PATTERN = /\d{4}\d{2}\d{2}-\d{6}/

RELEASE_VERSION_PATTERN = /\d+\.\d+\.\d+/

DEFAULT_EDITOR = 'vi'

COMMIT_MSG_FILE = 'commit-msg.txt'

###
### Helpers
###

### Return a new tag for the given time
def make_new_tag( time=Time.now )
	return time.strftime( TAG_TIMESTAMP_FORMAT )
end


### Get the subversion information for the current working directory as
### a hash.
def get_svn_info( dir='.' )
	info = IO.read( '|-' ) or exec 'svn', 'info', dir
	return YAML.load( info ) # 'svn info' outputs valid YAML! Yay!
end


### Return the URL to the repository root for the specified +dir+.
def get_svn_repo_root( dir='.' )
	info = get_svn_info( dir )
	return info['Repository Root'] + '/thingfish'
end


### Return the Subversion URL to the given +dir+.
def get_svn_url( dir='.' )
	info = get_svn_info( dir )
	return info['URL']
end


### Return the path of the specified +dir+ under the svn root of the 
### checkout.
def get_svn_path( dir='.' )
	root = get_svn_repo_root( dir )
	url = get_svn_url( dir )
	
	return url.sub( root + '/', '' )
end


### Return the latest revision number of the specified +dir+ as an Integer.
def get_svn_rev( dir='.' )
	info = get_svn_info( dir )
	return info['Revision']
end


### Return a list of the entries at the specified Subversion url. If
### no +url+ is specified, it will default to the list in the URL
### corresponding to the current working directory.
def svn_ls( url=nil )
	url ||= get_svn_url()
	list = IO.read( '|-' ) or exec 'svn', 'ls', url

	trace 'svn ls of %s: %p' % [url, list] if $trace
	
	return [] if list.nil? || list.empty?
	return list.split( $INPUT_RECORD_SEPARATOR )
end


### Return the URL of the latest timestamp in the tags directory.
def get_latest_svn_timestamp_tag
	rooturl = get_svn_repo_root()
	tagsurl = rooturl + '/tags'
	
	tags = svn_ls( tagsurl ).grep( TAG_TIMESTAMP_PATTERN ).sort
	return nil if tags.nil? || tags.empty?
	return tagsurl + '/' + tags.last
end


### Return the URL of the latest timestamp in the tags directory.
def get_latest_release_tag
	rooturl    = get_svn_repo_root()
	releaseurl = rooturl + '/releases'
	
	tags = svn_ls( releaseurl ).grep( RELEASE_VERSION_PATTERN ).sort_by do |tag|
		tag.split('.').collect {|i| Integer(i) }
	end
	return nil if tags.empty?

	return releaseurl + '/' + tags.last
end


### Extract a diff from the specified subversion working +dir+, rewrite its
### file lines as Trac links, and return it.
def make_svn_commit_log( dir='.' )
	editor_prog = ENV['EDITOR'] || ENV['VISUAL'] || DEFAULT_EDITOR
	
	diff = IO.read( '|-' ) or exec 'svn', 'diff'
	fail "No differences." if diff.empty?

	return diff
end



###
### Tasks
###

desc "Subversion tasks"
namespace :svn do

	desc "Copy the HEAD revision of the current trunk/ to tags/ with a " +
		 "current timestamp."
	task :tag do
		svninfo   = get_svn_info()
		tag       = make_new_tag()
		svntrunk  = svninfo['Repository Root'] + '/thingfish/trunk'
		svntagdir = svninfo['Repository Root'] + '/thingfish/tags'
		svntag    = svntagdir + '/' + tag

		desc = "Tagging trunk as #{svntag}"
		ask_for_confirmation( desc ) do
			msg = prompt_with_default( "Commit log: ", "Tagging for code push" )
			run 'svn', 'cp', '-m', msg, svntrunk, svntag
		end
	end


	desc "Copy the most recent tag to releases/#{PKG_VERSION}"
	task :release do
		last_tag    = get_latest_svn_timestamp_tag()
		svninfo     = get_svn_info()
		release     = PKG_VERSION
		svnrel      = svninfo['Repository Root'] + '/thingfish/releases'
		svnrelease  = svnrel + '/' + release

		if last_tag.nil?
			error "There are no tags in the repository"
			fail
		end

		releases = svn_ls( svnrel )
		trace "Releases: %p" % [releases]
		if releases.include?( release )
			error "Version #{release} already has a branch (#{svnrelease}). Did you mean" +
				"to increment the version in thingfish.rb?"
			fail
		else
			trace "No #{svnrel} version currently exists"
		end
		
		desc = "Release tag\n  #{last_tag}\nto\n  #{svnrelease}"
		ask_for_confirmation( desc ) do
			msg = prompt_with_default( "Commit log: ", "Branching for release" )
			run 'svn', 'cp', '-m', msg, last_tag, svnrelease
		end
	end


	desc "Generate a commit log"
	task :commitlog => [COMMIT_MSG_FILE]
	
	desc "Show the (pre-edited) commit log for the current directory"
	task :show_commitlog do
		puts make_svn_commit_log()
	end
	

	file COMMIT_MSG_FILE do
		diff = make_svn_commit_log()
		
		File.open( COMMIT_MSG_FILE, File::WRONLY|File::EXCL|File::CREAT ) do |fh|
			fh.print( diff )
		end

		editor = ENV['EDITOR'] || ENV['VISUAL'] || DEFAULT_EDITOR
		system editor, COMMIT_MSG_FILE
		unless $?.success?
			fail "Editor exited uncleanly."
		end
	end


	desc "Update from Subversion"
	task :update do
		run 'svn', 'up'
	end


	desc "Check in all the changes in your current working copy"
	task :checkin => ['svn:update', 'coverage:verify', COMMIT_MSG_FILE] do
		$deferr.puts File.read( COMMIT_MSG_FILE )
		ask_for_confirmation( "Continue with checkin?" ) do
			run 'svn', 'ci', '-F', COMMIT_MSG_FILE
			rm_f COMMIT_MSG_FILE
		end
	end
	task :commit => :checkin
	task :ci => :checkin
		
	
	task :clean do
		rm_f COMMIT_MSG_FILE
	end

	
	task :debug_helpers do
		methods = [
			:make_new_tag,
			:get_svn_info,
			:get_svn_repo_root,
			:get_svn_url,
			:get_svn_path,
			:svn_ls,
			:get_latest_svn_timestamp_tag,
		]
		maxlen = methods.collect {|sym| sym.to_s.length }.max
		
		methods.each do |meth|
			res = send( meth )
			puts "%*s => %p" % [ maxlen, colorize(meth.to_s, :cyan), res ]
		end
	end
end

