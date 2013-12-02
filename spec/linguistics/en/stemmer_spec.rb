#!/usr/bin/env spec -cfs

require_relative '../../helpers'

require 'rspec'

require 'linguistics'
require 'linguistics/en'
require 'linguistics/en/stemmer'


describe Linguistics::EN::Stemmer do

	before( :all ) do
		Linguistics.use( :en )
	end


	it "adds EN::Stemmer to the list of English language modules" do
		expect( Linguistics::EN::MODULES ).to include( Linguistics::EN::Stemmer )
	end


	describe "on a system that has the 'ruby-stemmer' library installed" do

		before( :each ) do
			pending "installation of the ruby-stemmer library" unless
				Linguistics::EN.has_stemmer?
		end

		it "can fetch the stem of a word" do
			expect( "communication".en.stem ).to eq( 'communic' )
		end

	end


	describe "on a system that doesn't have the 'ruby-stemmer' library" do

		it "raises an NotImplementedError when you try to use stemmer functionality" do
			# If the system *does* have stemmer support, pretend it doesn't.
			if Linguistics::EN.has_stemmer?
				exception = LoadError.new( 'no such file to load -- lingua/stemmer' )

				allow( Linguistics::EN::Stemmer ).to receive( :has_stemmer? ).
					and_return( false )
				allow( Linguistics::EN::Stemmer ).to receive( :stemmer_error ).
					and_return( exception )
			end

			expect {
				"communication".en.stem
			}.to raise_error( LoadError, %r{lingua/stemmer}i )
		end

	end

end

