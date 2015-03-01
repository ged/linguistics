#!/usr/bin/env rake

require 'rake/clean'
require 'rdoc/task'

begin
	require 'hoe'
rescue LoadError
	abort "This Rakefile requires Hoe. Try again after doing 'gem install hoe'"
end

GEMSPEC = 'linguistics.gemspec'

Hoe.plugin :mercurial
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

	spec.dependency 'loggability', '~> 0.11'

	spec.dependency 'hoe-deveiate', '~> 0.5', :development
	spec.dependency 'linkparser', '~> 1.1', :development
	spec.dependency 'wordnet', '~> 1.0', :development
	spec.dependency 'wordnet-defaultdb', '~> 1.0', :development
	spec.dependency 'ruby-stemmer', '~> 0.9', :development
	spec.dependency 'rdoc-generator-fivefish', '~> 0', :development

	spec.spec_extras[:post_install_message] = [
			"This library also presents tie-ins for the 'linkparser' and",
			"'wordnet' libraries, which you can enable by installing the",
			"gems of the same name."
		  ].join( "\n" )

	spec.require_ruby_version( '>=2.0.0' )
	spec.hg_sign_tags = true if spec.respond_to?( :hg_sign_tags= )
	spec.check_history_on_release = true if spec.respond_to?( :check_history_on_release= )
	spec.rdoc_locations << "deveiate:/usr/local/www/public/code/#{remote_rdoc_dir}"
end

ENV['VERSION'] ||= hoespec.spec.version.to_s

task 'hg:precheckin' => [ :check_history, :check_manifest, :gemspec, :spec ]

desc "Build a coverage report"
task :coverage do
	ENV["COVERAGE"] = 'yes'
	Rake::Task[:spec].invoke
end


# Use the fivefish formatter for docs generated from development checkout
if File.directory?( '.hg' )
	require 'rdoc/task'

	Rake::Task[ 'docs' ].clear
	RDoc::Task.new( 'docs' ) do |rdoc|
	rdoc.main = "README.rdoc"
	rdoc.rdoc_files.include( "*.rdoc", "ChangeLog", "lib/**/*.rb" )
	rdoc.generator = :fivefish
	rdoc.title = "Ruby Linguistics"
	rdoc.rdoc_dir = 'doc'
	end
end

task :gemspec => GEMSPEC
file GEMSPEC => __FILE__
task GEMSPEC do |task|
	spec = $hoespec.spec
	spec.files.delete( '.gemtest' )
	spec.version = "#{spec.version.bump}.0.pre#{Time.now.strftime("%Y%m%d%H%M%S")}"
	File.open( task.name, 'w' ) do |fh|
		fh.write( spec.to_ruby )
	end
end

CLOBBER.include( GEMSPEC.to_s )
task :default => :gemspec
