#!/usr/bin/ruby -w
#
# Unit test for English conjunctions 
# $Id: conjunction.tests.rb,v 1.2 2003/09/11 05:03:12 deveiant Exp $
#
# Copyright (c) 2003, 2005 The FaerieMUD Consortium.
# 

unless defined? Linguistics::TestCase
	testsdir = File::dirname( File::dirname(File::expand_path( __FILE__ )) )
	$LOAD_PATH.unshift testsdir unless $LOAD_PATH.include?( testsdir )

	require 'lingtestcase'
end


### This test suite tests the stage1 (static) parser and the metagrammar it
### parses in which the actual parser-generator's behaviour is defined.
class EnglishConjunctionsTestCase < Linguistics::TestCase

	Linguistics::use( :en, :installProxy => true )
	include Linguistics::EN
	
	Tests = {
		# Test name		=> {
		#	target => {
		#		{<options>} => <expected output>
		#	},
		:singleWord => {
			['cat'] => {
				{} => %{a cat}
			},
		},

		:twoWord => {
			%w{cat dog} => {
				{} => 'a cat and a dog',
				{:conjunctive => 'plus'} => 'a cat plus a dog',
				{:conjunctive => ''} => 'a cat a dog',
			},
			%w{cat Cat} => {
				{} => %{two cats},
				{:combine => false} => 'a cat and a Cat',
				{:casefold => false} => 'a cat and a Cat',
				{:generalize => true} => 'several cats',
			},
		},

		:manyWord => {
			%w{cat dog fox dog chicken chicken Fox chicken goose Dog goose} => {
				{} => 'three dogs, three chickens, two foxes, two geese, and a cat',
				{:combine => false} => 
					'a cat, a dog, a fox, a dog, a chicken, a chicken, a Fox, a '\
					'chicken, a goose, a Dog, and a goose',
				{:casefold => false} => 
					'three chickens, two dogs, two geese, a cat, a fox, a Fox, '\
					'and a Dog',
				{:generalize => true} => 
					'several dogs, several chickens, several foxes, several '\
					'geese, and a cat',
			}
		},
	}

	# Auto-generate tests for the dataset
	Tests.each_with_index {|test,i|
		name = test[0]
		methname = "test_%03d_%s" %
			[ i + 50, name ]
		define_method( methname ) {
			printTestHeader "Conjunction: #{name}"
			Tests[name].each {|target, tests|
				rval = nil
				tests.each {|opts, output|
					op = "conjunction of %s with options=%s" %
						[ target.inspect, opts.inspect ]

					# Method interface
					assert_nothing_raised( op ) {
						rval = target.en.conjunction( opts )
					}
					assert_equal output, rval, op

					# Function interface
					assert_nothing_raised( op ) {
						rval = conjunction( target, opts )
					}
					assert_equal output, rval, op
				}
			}
		}
	}
	
	### Overridden initializer: auto-generated test methods have an arity of 1
	### even though they don't require an argument (as of the current Ruby CVS),
	### and the default initializer throws an :invalid_test for methods with
	### arity != 0.
	def initialize( test_method_name )
        if !respond_to?( test_method_name )
			throw :invalid_test
        end
        @method_name = test_method_name
        @test_passed = true
	end


	#################################################################
	###	T E S T S
	#################################################################

	Items = %w{cow chicken blancmange cyclist}

	# Test for defect #6
	def test_conjunction_should_use_supplied_block_for_object_transform_on_first_invocation
		rval = nil

		# Create a new class, as we need to guarantee that this will be the
		# first #conjunction call to it.
		collection = Class::new {
			include Enumerable, Linguistics
			def initialize( *ary )
				@ary = ary.flatten
			end

			# Delegate #each to the contained Array
			def each( &block )
				@ary.each( &block )
			end
		}

		obj = collection.new( 'foo', 'bar', 'baz' )

		assert_nothing_raised do
			rval = obj.en.conjunction {|word| "%d-letter word" % word.length }
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

