#!/usr/bin/env spec -cfs

require_relative '../../helpers'

require 'rspec'

require 'linguistics'
require 'linguistics/en/linkparser'


describe Linguistics::EN::LinkParser do

	before( :all ) do
		Linguistics.use( :en )
	end


	it "adds EN::LinkParser to the list of English language modules" do
		expect( Linguistics::EN::MODULES ).to include( Linguistics::EN::LinkParser )
	end


	describe "on a system that has the 'linkparser' library installed" do

		it "can create a LinkParser::Sentence from a sentence in a string" do
			pending "installation of the linkparser library" unless
				Linguistics::EN.has_linkparser?
			expect( "This is a sentence.".en.sentence ).to be_a( LinkParser::Sentence )
		end

	end


	describe "on a system that doesn't have the 'linkparser' library" do
		it "raises an NotImplementedError when you try to use linkparser functionality" do

			# If the system *does* have linkparser support, pretend it doesn't.
			if Linguistics::EN.has_linkparser?
				exception = LoadError.new( 'no such file to load -- linkparser' )

				allow( Linguistics::EN::LinkParser ).to receive( :has_linkparser? ).
					and_return( false )
				allow( Linguistics::EN::LinkParser ).to receive( :lp_error ).
					and_return( exception )
			end

			expect {
				"This is a sentence.".en.sentence
			}.to raise_error( NotImplementedError, /not loaded/i )
		end

	end

end

