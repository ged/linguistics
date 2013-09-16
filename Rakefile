#!/usr/bin/env rake

begin
	require 'rspec'
	require 'rspec/core/rake_task'
rescue LoadError
	abort "This Rakefile requires RSpec. Try again after doing 'gem install rspec'"
end

begin
	require 'hoe'
rescue LoadError
	abort "This Rakefile requires Hoe. Try again after doing 'gem install hoe'"
end

# The path to the generated .gemspec file
GEMSPEC = '.gemspec'

Hoe.plugin :mercurial
Hoe.plugin :bundler
Hoe.plugin :publish
Hoe.plugin :signing

Hoe.plugins.delete :rubyforge

hoespec = Hoe.spec 'linguistics' do |spec|
	spec.name = 'linguistics'
	spec.readme_file = 'README.rdoc'
	spec.history_file = 'History.rdoc'
	spec.extra_rdoc_files = FileList[ '*.rdoc' ]
	spec.license 'BSD'

	spec.developer 'Michael Granger', 'ged@FaerieMUD.org'

	spec.dependency 'loggability', '~> 0.7'

	spec.dependency 'hoe-deveiate', '~> 0.3', :development
	spec.dependency 'hoe-bundler', '~> 1.2', :development
	spec.dependency 'linkparser', '~> 1.1', :development
	spec.dependency 'wordnet', '~> 1.0', :development
	spec.dependency 'wordnet-defaultdb', '~> 1.0', :development
	spec.dependency 'ruby-stemmer', '~> 0.9', :development

	spec.spec_extras[:rdoc_options] = ['-f', 'fivefish', '-t', 'Ruby Linguistics Toolkit']
	spec.spec_extras[:post_install_message] = [
			"This library also presents tie-ins for the 'linkparser' and",
			"'wordnet' libraries, which you can enable by installing the",
			"gems of the same name."
		  ].join( "\n" )

	spec.require_ruby_version( '>=1.9.3' )
	spec.hg_sign_tags = true if spec.respond_to?( :hg_sign_tags= )
	spec.check_history_on_release = true if spec.respond_to?( :check_history_on_release= )

	spec.rdoc_locations << "deveiate:/usr/local/www/public/code/#{remote_rdoc_dir}"
end

ENV['VERSION'] ||= hoespec.spec.version.to_s

task 'hg:precheckin' => [ :check_history, :check_manifest, :spec ]

desc "Build a coverage report"
task :coverage do
	ENV["COVERAGE"] = 'yes'
	Rake::Task[:spec].invoke
end


desc "generate a gemspec from your Hoe.spec"
file GEMSPEC => 'Rakefile' do |task|
	spec = hoespec.spec.dup
	spec.files.delete( '.gemtest' )
	spec.version = "#{spec.version}.pre.#{Time.now.strftime("%Y%m%d%H%M%S")}"
	File.open( task.name, 'w' ) do |fh|
		fh.write( spec.to_ruby )
	end
end

