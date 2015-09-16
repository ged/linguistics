#!/usr/bin/env spec -cfs

require_relative '../../helpers'

require 'rspec'

require 'linguistics'
require 'linguistics/en'
require 'linguistics/en/conjunctions'


describe Linguistics::EN::Conjunctions do

	before( :all ) do
		Linguistics.use( :en )
	end


	let( :test_items ) { %w[cow chicken dog goat dog dog duck duck goose goose goose dog goat] }


	it "don't use a penultimate separator if it's turned off" do
		expect( test_items.en.conjunction(penultimate: false) ).
			to eq( "four dogs, three geese, two goats, two ducks, a cow and a chicken" )
	end

	it "honors the penultimate setting even if there are only three items (bugfix)" do
		expect( %w[duck cow dog].en.conjunction(penultimate: false) ).
			to eq( "a duck, a cow and a dog" )
	end

	it "uses the supplied block for transformation before building the conjunction" do
		expect( test_items.en.conjunction {|item| "'%s' animal" % [ item[0] ]} ).
			to eq( "six 'd' animals, five 'g' animals, and two 'c' animals" )
	end

	it "uses the alternative separator if one or more phrases include the primary one" do
		scene_items = [
			"desk with stamps, paper, and envelopes on it",
			"basket containing milk, eggs, and broccoli",
			"chair", "chair", "chair",
			"wooden chest",
			"hat rack",
		]

		expect( scene_items.en.conjunction ).to eq(
			"three chairs; a desk with stamps, paper, and envelopes on it; " +
			"a basket containing milk, eggs, and broccoli; " +
			"a wooden chest; and a hat rack"
		)
	end


	describe "with an Array of a single element" do

		let( :array ) { %w[cat] }

		it "results in a phrase with indefinite article" do
			expect( array.en.conjunction ).to eq( "a cat" )
		end

		it "omits the indefinite article if :article is `false`" do
			expect( array.en.conjunction(article: false) ).to eq( "cat" )
		end

	end


	describe "with an Array of two different words" do

		let( :array ) { %w[cat dog] }

		it "results in a phrase joined with 'and' with default options" do
			expect( array.en.conjunction ).to eq( "a cat and a dog" )
		end

		it "results in a phrase joined with 'plus' if 'plus' is set as the conjunctive" do
			expect( array.en.conjunction(:conjunctive => 'plus') ).to eq( "a cat plus a dog" )
		end

		it "results in a phrase joined with a space if an empty string is set as the conjunctive" do
			expect( array.en.conjunction(:conjunctive => '') ).to eq( "a cat a dog" )
		end

		it "doesn't add indefinite articles if :article is set to `false`" do
			expect( array.en.conjunction( article: false ) ).to eq( "cat and dog" )
		end

	end


	describe "with an Array of two words that differ only in case" do

		let( :array ) { %w[cat Cat] }

		it "combines them into their downcased equivalents with default options" do
			expect( array.en.conjunction ).to eq( "two cats" )
		end

		it "lists them separately if :combine is set to false" do
			expect( array.en.conjunction(:combine => false) ).to eq( "a cat and a Cat" )
		end

		it "doesn't combine them if :casefold is turned off" do
			expect( array.en.conjunction(:casefold => false) ).to eq( "a cat and a Cat" )
		end

		it "combines and lists them with a non-specific count if :generalize is set" do
			expect( array.en.conjunction(:generalize => true) ).to eq( "several cats" )
		end

	end


	describe "with an Array of many (more than two) words of varying cases" do

		let( :array ) { %w[cat dog fox dog chicken chicken Fox chicken goose Dog goose] }

		it "combines them into their downcased equivalents and lists them in order of amount " +
		   "with default options" do
			expect( array.en.conjunction ).
				to eq( 'three dogs, three chickens, two foxes, two geese, and a cat' )
		end

		it "lists them separately if :combine is set to false" do
			expect( array.en.conjunction(:combine => false) ).to eq(
				'a cat, a dog, a fox, a dog, a chicken, a chicken, a Fox, a '\
				'chicken, a goose, a Dog, and a goose' )
		end

		it "omits the indefinite article if :article is `false`" do
			expect( array.en.conjunction(combine: false, article: false) ).to eq(
				'cat, dog, fox, dog, chicken, chicken, Fox, '\
				'chicken, goose, Dog, and goose' )
		end

		it "doesn't combine the differently-cased ones if :casefold is turned off" do
			expect( array.en.conjunction(:casefold => false) ).to eq(
				'three chickens, two dogs, two geese, a cat, a fox, a Fox, '\
				'and a Dog' )
		end

		it "combines and lists them with a non-specific count if :generalize is set" do
			expect( array.en.conjunction(:generalize => true) ).to eq(
				'several dogs, several chickens, several foxes, several '\
				'geese, and a cat' )
		end

	end


end
