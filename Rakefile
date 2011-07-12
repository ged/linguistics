#!/usr/bin/env rake

require 'hoe'

Hoe.plugin :mercurial
Hoe.plugin :signing

Hoe.plugins.delete :rubyforge

hoespec = Hoe.spec 'linguistics' do
	self.name = 'linguistics'
	self.readme_file = 'README.md'
	self.history_file = 'History.md'

	self.developer 'Michael Granger', 'ged@FaerieMUD.org'

	self.dependency 'rspec', '~> 2.6.0', :development
	self.dependency 'linkparser', '~> 1.1.0', :development
	self.dependency 'wordnet', '~> 0.99.0', :development

	self.spec_extras[:licenses] = ["BSD"]
	self.spec_extras[:post_install_message] = [
			"This library also presents tie-ins for the 'linkparser' and",
			"'wordnet' libraries, which you can enable by installing the",
			"gems of the same name."
		  ].join( "\n" )

	self.require_ruby_version( '>=1.9.2' )
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

