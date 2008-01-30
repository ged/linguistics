#!/usr/bin/env spec -cfs

BEGIN {
	require 'pathname'
	basedir = Pathname.new( __FILE__ ).dirname.parent.parent

	libdir = basedir + "lib"

	$LOAD_PATH.unshift( libdir ) unless $LOAD_PATH.include?( libdir )
}

begin
	require 'spec/runner'
	require 'linguistics'
	require 'linguistics/en'
rescue LoadError
	unless Object.const_defined?( :Gem )
		require 'rubygems'
		retry
	end
	raise
end


describe Linguistics::EN do

	before( :all ) do
		Linguistics::use( :en )
		include Linguistics::EN
	end


	describe "conjunctions with an Array of a single element" do

		before( :each ) do
			@array = ['cat']
		end

		it "results in a phrase with indefinite article" do
			@array.en.conjunction.should == "a cat"
		end
		
	end


	describe "conjunction with an Array of two different words" do

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


	describe "conjunction with an Array of two words that differ only in case" do

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


	describe "conjunction with an Array of many (more than two) words of varying cases" do

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
	

	describe "conjunction with an object-transform block" do

		it "doesn't still have #6: #conjunction doesn't invoke supplied block under some conditions"
		before( :each ) do
			# Create a new class, as we need to guarantee that this will be the
			# first #conjunction call to it.
			@collection = Class::new {
				include Enumerable, Linguistics
				def initialize( *ary )
					@ary = ary.flatten
				end

				# Delegate #each to the contained Array
				def each( &block )
					@ary.each( &block )
				end
			}

			@obj = @collection.new( 'foo', 'bar', 'baz', 'tree', 'node', 'sonogram' )
		end

		it "uses supplied block for object transform on first invocation" do
			@obj.en.conjunction {|word| "%s-letter word" % word.length.en.numwords }.should ==
				"three three-letter words, two four-letter words, and an eight-letter word"
		end
	end



	def test_conjunction_should_use_supplied_block_for_object_transform
		rval = nil

		assert_nothing_raised do
			rval = Items.en.conjunction {|word| "%s-word" % word[0,1]}
		end

		assert_equal "three c-words and a b-word", rval
	end


	def test_conjunction_should_use_supplied_block_for_object_transform_through_autoproxy
		rval = nil

		assert_nothing_raised do
			rval = Items.conjunction {|word| "%s-word" % word[0,1]}
		end

		assert_equal "three c-words and a b-word", rval
	end

	def test_conjunction_with_penultimate_separator_turned_off_should_not_use_one
		rval = nil
		
		assert_nothing_raised do
			rval = Items.en.conjunction( :penultimate => false )
		end
		
		assert_equal "a cow, a chicken, a blancmange and a cyclist", rval
	end

	def test_three_item_conjunction_should_honor_penultimate_setting
		rval = nil
		
		assert_nothing_raised do
			rval = %w{duck cow dog}.en.conjunction( :penultimate => false )
		end
		
		assert_equal "a duck, a cow and a dog", rval
	end

	def test_conjunction_uses_alt_separator_if_phrases_include_the_primary_one
		rval = nil
		scene_items = [
			"desk with stamps, paper, and envelopes on it",
			"basket containing milk, eggs, and broccoli",
			"chair",
			"wooden chest",
			"hat rack",
		]
		
		assert_nothing_raised do
			rval = scene_items.conjunction
		end
		
		assert_equal "a desk with stamps, paper, and envelopes on it; " +
			"a basket containing milk, eggs, and broccoli; " +
			"a chair; a wooden chest; and a hat rack", rval
	end

end

