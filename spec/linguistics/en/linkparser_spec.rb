#!/usr/bin/env spec -cfs

BEGIN {
	require 'pathname'
	basedir = Pathname.new( __FILE__ ).dirname.parent.parent.parent

	libdir = basedir + "lib"

	$LOAD_PATH.unshift( basedir.to_s ) unless $LOAD_PATH.include?( basedir.to_s )
	$LOAD_PATH.unshift( libdir.to_s ) unless $LOAD_PATH.include?( libdir.to_s )
}

require 'rspec'
require 'spec/lib/helpers'

require 'linguistics'
require 'linguistics/en/linkparser'


describe Linguistics::EN::LinkParser do
	include Linguistics::SpecHelpers

	before( :all ) do
		setup_logging( :fatal )
		Linguistics.use( :en )
	end

	after( :all ) do
		reset_logging()
	end


	it "adds EN::LinkParser to the list of English language modules" do
		Linguistics::EN::MODULES.include?( Linguistics::EN::LinkParser )
	end


	describe "on a system that has the 'linkparser' library installed" do

		it "can create a LinkParser::Sentence from a sentence in a string" do
			pending "installation of the linkparser library" unless
				Linguistics::EN::LinkParser.has_link_parser?
			"This is a sentence.".en.sentence.should be_a( LinkParser::Sentence )
		end

	end


	describe "on a system that doesn't have the 'linkparser' library" do
		it "raises an NotImplementedError when you try to use linkparser functionality" do

			# If the system *does* have linkparser support, pretend it doesn't.
			if Linguistics::EN::LinkParser.has_link_parser?
				exception = stub( "linkparser load error", :message => 'no such file to load' )
				Linguistics::EN::LinkParser.stub!( :lp_error ).and_return( exception )
			end

			expect {
				"This is a sentence.".en.sentence
			}.to raise_error( NotImplementedError, /not loaded/i )
		end

	end

end

