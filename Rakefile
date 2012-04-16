#!/usr/bin/env rake

require 'hoe'

Hoe.plugin :mercurial
Hoe.plugin :signing

Hoe.plugins.delete :rubyforge

hoespec = Hoe.spec 'linguistics' do
	self.name = 'linguistics'
	self.readme_file = 'README.rdoc'
	self.history_file = 'History.rdoc'
	self.extra_rdoc_files = FileList[ '*.rdoc' ]

	self.developer 'Michael Granger', 'ged@FaerieMUD.org'

	self.dependency 'hoe-deveiate', '~> 0.1', :development
	self.dependency 'linkparser', '~> 1.1', :development
	self.dependency 'wordnet', '~> 0.99', :development

	self.spec_extras[:licenses] = ["BSD"]
	self.spec_extras[:rdoc_options] = ['-f', 'fivefish', '-t', 'Ruby Linguistics Toolkit']
	self.spec_extras[:post_install_message] = [
			"This library also presents tie-ins for the 'linkparser' and",
			"'wordnet' libraries, which you can enable by installing the",
			"gems of the same name."
		  ].join( "\n" )

	self.require_ruby_version( '>=1.9.2' )
	self.hg_sign_tags = true if self.respond_to?( :hg_sign_tags= )
	self.check_history_on_release = true if self.respond_to?( :check_history_on_release= )

	self.rdoc_locations << "deveiate:/usr/local/www/public/code/#{remote_rdoc_dir}"
end

ENV['VERSION'] ||= hoespec.spec.version.to_s

task 'hg:precheckin' => :spec

### Make the ChangeLog update if the repo has changed since it was last built
file '.hg/branch'
file 'ChangeLog' => '.hg/branch' do |task|
	content = begin
		$stderr.puts "Updating the changelog..."
		make_changelog()
	rescue NoMethodError
		abort "This task requires the hoe-mercurial plugin (gem install hoe-mercurial)."
	end

	File.open( task.name, 'w', 0644 ) do |fh|
		fh.print( content )
	end
end

# Rebuild the ChangeLog immediately before release
task :prerelease => 'ChangeLog'

