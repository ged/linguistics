#!/usr/bin/ruby
# coding: utf-8

# SimpleCov test coverage reporting; enable this using the :coverage rake task
require 'simplecov' if ENV['COVERAGE']


require 'linguistics'

require 'rspec'
require 'loggability/spechelpers'

require_relative 'constants'

module Linguistics::SpecHelpers
end # module Linguistics::SpecHelpers


### Mock with RSpec
RSpec.configure do |config|
	include Linguistics::TestConstants

	config.run_all_when_everything_filtered = true
	config.filter_run :focus
	config.order = 'random'

	config.mock_with( :rspec ) do |mock|
		mock.syntax = :expect
	end

	config.include( Loggability::SpecHelpers )
	config.include( Linguistics::SpecHelpers )

	config.before( :all ) { setup_logging(:fatal) }
end

# vim: set nosta noet ts=4 sw=4:

