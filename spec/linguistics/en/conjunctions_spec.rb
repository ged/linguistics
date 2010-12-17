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
require 'linguistics/en'


describe Linguistics::EN::Conjunctions do
	include Linguistics::SpecHelpers

	before( :all ) do
		Linguistics.use( :en )
		setup_logging( :fatal )
	end


	TEST_ITEMS = %w[cow chicken dog goat dog dog duck duck goose goose goose dog goat]

	it "don't use a penultimate separator if it's turned off" do
		TEST_ITEMS.en.conjunction( :penultimate => false ).should ==
			"four dogs, three geese, two goats, two ducks, a cow and a chicken"
	end

	it "honors the penultimate setting even if there are only three items (bugfix)" do
		%w[duck cow dog].en.conjunction( :penultimate => false ).should ==
			"a duck, a cow and a dog"
	end

	it "uses the supplied block for transformation before building the conjunction" do
		TEST_ITEMS.en.conjunction {|item| "'%s' animal" % [item[0]] }.should ==
			"six 'd' animals, five 'g' animals, and two 'c' animals"
	end

	it "uses the alternative separator if one or more phrases include the primary one" do
		scene_items = [
			"desk with stamps, paper, and envelopes on it",
			"basket containing milk, eggs, and broccoli",
			"chair", "chair", "chair",
			"wooden chest",
			"hat rack",
		]

		scene_items.en.conjunction.should ==
			"three chairs; a desk with stamps, paper, and envelopes on it; " +
			"a basket containing milk, eggs, and broccoli; " +
			"a wooden chest; and a hat rack"
	end


	describe "with an Array of a single element" do

		before( :each ) do
			@array = ['cat']
		end

		it "results in a phrase with indefinite article" do
			@array.en.conjunction.should == "a cat"
		end

	end


	describe "with an Array of two different words" do

		before( :each ) do
			@array = ['cat', 'dog']
		end

		it "results in a phrase joined with 'and' with default options" do
			@array.en.conjunction.should == "a cat and a dog"
		end

		it "results in a phrase joined with 'plus' if 'plus' is set as the conjunctive" do
			@array.en.conjunction(:conjunctive => 'plus').should == "a cat plus a dog"
		end

		it "results in a phrase joined with a space if an empty string is set as the conjunctive" do
			@array.en.conjunction(:conjunctive => '').should == "a cat a dog"
		end

	end


	describe "with an Array of two words that differ only in case" do

		before( :each ) do
			@array = ['cat', 'Cat']
		end

		it "combines them into their downcased equivalents with default options" do
			@array.en.conjunction.should == "two cats"
		end

		it "lists them separately if :combine is set to false" do
			@array.en.conjunction(:combine => false).should == "a cat and a Cat"
		end

		it "doesn't combine them if :casefold is turned off" do
			@array.en.conjunction(:casefold => false).should == "a cat and a Cat"
		end

		it "combines and lists them with a non-specific count if :generalize is set" do
			@array.en.conjunction(:generalize => true).should == "several cats"
		end

	end


	describe "with an Array of many (more than two) words of varying cases" do

		before( :each ) do
			@array = %w{cat dog fox dog chicken chicken Fox chicken goose Dog goose}
		end

		it "combines them into their downcased equivalents and lists them in order of amount " +
		   "with default options" do
			@array.en.conjunction.should ==
				'three dogs, three chickens, two foxes, two geese, and a cat'
		end

		it "lists them separately if :combine is set to false" do
			@array.en.conjunction(:combine => false).should ==
				'a cat, a dog, a fox, a dog, a chicken, a chicken, a Fox, a '\
				'chicken, a goose, a Dog, and a goose'
		end

		it "doesn't combine the differently-cased ones if :casefold is turned off" do
			@array.en.conjunction(:casefold => false).should ==
				'three chickens, two dogs, two geese, a cat, a fox, a Fox, '\
				'and a Dog'
		end

		it "combines and lists them with a non-specific count if :generalize is set" do
			@array.en.conjunction(:generalize => true).should ==
				'several dogs, several chickens, several foxes, several '\
				'geese, and a cat'
		end

	end


end
