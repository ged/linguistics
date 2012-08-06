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

	self.require_ruby_version( '>=1.9.3' )
	self.hg_sign_tags = true if self.respond_to?( :hg_sign_tags= )
	self.check_history_on_release = true if self.respond_to?( :check_history_on_release= )

	self.rdoc_locations << "deveiate:/usr/local/www/public/code/#{remote_rdoc_dir}"
end

ENV['VERSION'] ||= hoespec.spec.version.to_s
 
task 'hg:precheckin' => [ :check_history, :check_manifest, :spec ]
 
