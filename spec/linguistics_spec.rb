#!/usr/bin/env spec -cfs

require_relative 'helpers'

require 'rspec'
require 'linguistics'

describe Linguistics do


	describe "version methods" do

		it "returns a version string if asked" do
			expect( Linguistics.version_string ).to match( /\w+ [\d.]+/ )
		end

		it "returns a version string with a build number if asked" do
			expect( Linguistics.version_string(true) ).to match(/\w+ [\d.]+ \(build [[:xdigit:]]+\)/)
		end
	end


	describe "language-loading functions" do

		it "load a language's linguistic functions via variants of its ISO639 code" do
			testclass = Class.new
			expect( Linguistics.use( :eng, :classes => testclass ) ).to eq( [ testclass ] )
			expect( testclass.new ).to respond_to( :eng )
			expect( testclass.new ).to respond_to( :en )
		end

		it "load a language's linguistic functions via the 2-letter variant of its ISO639 code" do
			testclass = Class.new
			expect( Linguistics.use( :en, :classes => testclass ) ).to eq( [ testclass ] )
			expect( testclass.new ).to respond_to( :eng )
			expect( testclass.new ).to respond_to( :en )
		end

		it "default to extending a default set of classes" do
			expect( Linguistics.use( :eng ) ).to eq( Linguistics::DEFAULT_EXT_CLASSES )
			expect( [] ).to respond_to( :eng )
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
