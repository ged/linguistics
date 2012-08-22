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

	before( :all ) do
		setup_logging()
	end

	after( :each ) do
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
			expect {
				Linguistics.use( :ja )
			}.to raise_error( LoadError, /failed to load a language extension/i )
		end

	end

end
