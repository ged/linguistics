#!/usr/bin/env spec -cfs

BEGIN {
	require 'pathname'
	basedir = Pathname.new( __FILE__ ).dirname.parent

	libdir = basedir + "lib"

	$LOAD_PATH.unshift( basedir.to_s ) unless $LOAD_PATH.include?( basedir.to_s )
	$LOAD_PATH.unshift( libdir.to_s ) unless $LOAD_PATH.include?( libdir.to_s )
}

require 'rspec'
require 'spec/lib/helpers'

require 'linguistics'


describe Linguistics do
	include Linguistics::SpecHelpers

	before( :all ) do
		@original_logger = Linguistics.default_logger
		@original_log_formatter = Linguistics.default_log_formatter
		setup_logging( :fatal )
	end

	after( :each ) do
		Linguistics.default_logger = @original_logger
		Linguistics.default_log_formatter = @original_log_formatter
		reset_logging()
	end


	describe "version methods" do

		it "returns a version string if asked" do
			Linguistics.version_string.should =~ /\w+ [\d.]+/
		end

		it "returns a version string with a build number if asked" do
			Linguistics.version_string(true).should =~ /\w+ [\d.]+ \(build [[:xdigit:]]+\)/
		end
	end


	describe " logging subsystem" do
		before(:each) do
			Linguistics.reset_logger
		end

		after(:each) do
			Linguistics.reset_logger
		end


		it "knows if its default logger is replaced" do
			Linguistics.reset_logger
			Linguistics.should be_using_default_logger
			Linguistics.logger = Logger.new( $stderr )
			Linguistics.should_not be_using_default_logger
		end

		it "has the default logger instance after being reset" do
			Linguistics.logger.should equal( Linguistics.default_logger )
		end

		it "has the default log formatter instance after being reset" do
			Linguistics.logger.formatter.should equal( Linguistics.default_log_formatter )
		end

	end


	describe " logging subsystem with new defaults" do
		it "uses the new defaults when the logging subsystem is reset" do
			logger = double( "dummy logger" )
			formatter = double( "dummy logger" )

			Linguistics.default_logger = logger
			Linguistics.default_log_formatter = formatter

			logger.should_receive( :formatter= ).with( formatter )
			logger.should_receive( :level= ).with( Logger::WARN )

			Linguistics.reset_logger
			Linguistics.logger.should equal( logger )
		end

	end


	describe "language-loading functions" do

		it "load a language's linguistic functions via variants of its ISO639 code" do
			testclass = Class.new
			Linguistics.use( :eng, :classes => testclass ).should == [ testclass ]
			testclass.new.should respond_to( :eng )
			testclass.new.should respond_to( :en )
		end

		it "load a language's linguistic functions via the 2-letter variant of its ISO639 code" do
			testclass = Class.new
			Linguistics.use( :en, :classes => testclass ).should == [ testclass ]
			testclass.new.should respond_to( :eng )
			testclass.new.should respond_to( :en )
		end

		it "default to extending a default set of classes" do
			Linguistics.use( :eng ).should == Linguistics::DEFAULT_EXT_CLASSES
			[].should respond_to( :eng )
		end

		it "raise an error when a language that doesn't exist is requested" do
			expect {
				Linguistics.use( :zz )
			}.to raise_error( RuntimeError, /unknown ISO639-2 language code/i )
		end

		it "raise an error for valid languages that don't have any linguistic functions to load" do
			Linguistics.logger.level = Logger::FATAL
			expect {
				Linguistics.use( :ja )
			}.to raise_error( LoadError, /failed to load a language extension/i )
		end

	end

end
