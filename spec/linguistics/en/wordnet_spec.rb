#!/usr/bin/env spec -cfs

require_relative '../../helpers'

require 'rspec'

require 'linguistics'
require 'linguistics/en'
require 'linguistics/en/wordnet'


describe Linguistics::EN::WordNet do

	before( :all ) do
		Linguistics.use( :en )
	end


	it "adds EN::WordNet to the list of English language modules" do
		Linguistics::EN::MODULES.include?( Linguistics::EN::WordNet )
	end


	describe "on a system that has the 'wordnet' library installed" do

		before( :each ) do
			pending "installation of the wordnet library" unless
				Linguistics::EN.has_wordnet?
		end

		it "can create a WordNet::Synset from a word" do
			expect( "jackal".en.synset ).to be_a( WordNet::Synset )
		end

		it "can load all synsets for a word" do
			result = "appear".en.synsets
			expect( result.size ).to eq( 7 )
			expect( result ).to include( WordNet::Synset[200422090] )
		end

	end


	describe "on a system that doesn't have the 'wordnet' library" do

		it "raises the appropriate LoadError when you try to use wordnet functionality" do
			# If the system *does* have wordnet support, pretend it doesn't.
			if Linguistics::EN.has_wordnet?
				error = LoadError.new( "no such file to load -- wordnet" )

				allow( Linguistics::EN::WordNet ).to receive( :has_wordnet? ).
					and_return( false )
				allow( Linguistics::EN::WordNet ).to receive( :wordnet_error ).
					and_return( error )
			end

			expect {
				"persimmon".en.synset
			}.to raise_error( LoadError, %r{wordnet}i )
		end

	end

end

