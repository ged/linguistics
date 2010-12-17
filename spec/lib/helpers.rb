#!/usr/bin/ruby
# coding: utf-8

BEGIN {
	require 'pathname'
	basedir = Pathname.new( __FILE__ ).dirname.parent

	libdir = basedir + "lib"

	$LOAD_PATH.unshift( libdir.to_s ) unless $LOAD_PATH.include?( libdir.to_s )
}

require 'yaml'
require 'linguistics'

require 'rspec'
require 'spec/lib/constants'


### RSpec helper functions.
module Linguistics::SpecHelpers
	include Linguistics::TestConstants


	class ArrayLogger
		### Create a new ArrayLogger that will append content to +array+.
		def initialize( array )
			@array = array
		end

		### Write the specified +message+ to the array.
		def write( message )
			@array << message
		end

		### No-op -- this is here just so Logger doesn't complain
		def close; end

	end # class ArrayLogger


	unless defined?( LEVEL )
		LEVEL = {
			:debug => Logger::DEBUG,
			:info  => Logger::INFO,
			:warn  => Logger::WARN,
			:error => Logger::ERROR,
			:fatal => Logger::FATAL,
		  }
	end

	###############
	module_function
	###############

	### Reset the logging subsystem to its default state.
	def reset_logging
		Linguistics.reset_logger
	end


	### Alter the output of the default log formatter to be pretty in SpecMate output
	def setup_logging( level=Logger::FATAL )

		# Turn symbol-style level config into Logger's expected Fixnum level
		if Linguistics::Loggable::LEVEL.key?( level )
			level = Linguistics::Loggable::LEVEL[ level ]
		end

		logger = Logger.new( $stderr )
		Linguistics.logger = logger
		Linguistics.logger.level = level

		# Only do this when executing from a spec in TextMate
		if ENV['HTML_LOGGING'] || (ENV['TM_FILENAME'] && ENV['TM_FILENAME'] =~ /_spec\.rb/)
			Thread.current['logger-output'] = []
			logdevice = ArrayLogger.new( Thread.current['logger-output'] )
			Linguistics.logger = Logger.new( logdevice )
			# Linguistics.logger.level = level
			Linguistics.logger.formatter = Linguistics::HtmlLogFormatter.new( logger )
		end
	end

end

### Mock with Rspec
Rspec.configure do |c|
	c.mock_with( :rspec )
	c.include( Linguistics::SpecHelpers )
end

# vim: set nosta noet ts=4 sw=4:

