#!/usr/bin/ruby -w
#
# Unit test for English conjunctions 
# $Id: conjunction.tests.rb,v 1.2 2003/09/11 05:03:12 deveiant Exp $
#
# Copyright (c) 2003 The FaerieMUD Consortium.
# 

unless defined? Linguistics::TestCase
	testsdir = File::dirname( File::dirname(File::expand_path( __FILE__ )) )
	$LOAD_PATH.unshift testsdir unless $LOAD_PATH.include?( testsdir )

	require 'lingtestcase'
end


### This test suite tests the stage1 (static) parser and the metagrammar it
### parses in which the actual parser-generator's behaviour is defined.
class EnglishConjunctionsTestCase < Linguistics::TestCase

	Linguistics::use( :en )
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



end

