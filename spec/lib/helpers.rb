#!/usr/bin/ruby
# coding: utf-8

BEGIN {
	require 'pathname'
	basedir = Pathname.new( __FILE__ ).dirname.parent

	libdir = basedir + "lib"

	$LOAD_PATH.unshift( libdir.to_s ) unless $LOAD_PATH.include?( libdir.to_s )
}

# SimpleCov test coverage reporting; enable this using the :coverage rake task
if ENV['COVERAGE']
	$stderr.puts "\n\n>>> Enabling coverage report.\n\n"
	require 'simplecov'
	SimpleCov.start do
		add_filter 'spec'
		add_group "Needing tests" do |file|
			file.covered_percent < 90
		end
	end
end

require 'linguistics'

require 'rspec'
require 'spec/lib/constants'
require 'loggability/spechelpers'

### Mock with RSpec
RSpec.configure do |c|
	c.mock_with( :rspec )
	c.include( Loggability::SpecHelpers )
end

# vim: set nosta noet ts=4 sw=4:

