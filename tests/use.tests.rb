#!/usr/bin/ruby -w
#
# Unit test for the 'use' function of the Linguistics module.
# $Id: use.tests.rb,v 1.3 2003/07/11 00:20:10 deveiant Exp $
#
# Copyright (c) 2003 The FaerieMUD Consortium.
# 

if File::exists?( "lib/linguistics.rb" )
	require 'tests/lingtestcase'
else
	require 'lingtestcase'
end


### This test suite tests the language-installation function of the Linguistics
### module.
module Linguistics
class UseTestCase < Linguistics::TestCase

	LanguageCodes = [ :en, :EN, 'en', 'EN', 'En', 'eN' ]
	BogusLanguageCodes = [ :zz, :ry, :qi ]
	MissingLanguageCodes = [ :ja, :fr, :es ]

	TestArray = %w{stone stick hammer stone lantern}
	TestString = "banner"
	TestNumber = 5

	def test_00_UseEnglish
		printTestHeader "Linguistics: Use <language>"

		# Test the only (currently) valid codes
		LanguageCodes.each do |code|
			assert_nothing_raised {
				Linguistics::use( code )
			}
		end

		# Test bogus codes
		BogusLanguageCodes.each do |code|
			assert_raises( RuntimeError ) {
				Linguistics::use( code )
			}
		end

		# Test valid, but missing languages (might fail for implementors of new
		# languages).
		MissingLanguageCodes.each do |code|
			assert_raises( LoadError ) {
				Linguistics::use( code )
			}
		end

	end


	def test_10_InflectorMethod
		printTestHeader "Linguistics: Inflector method (core classes)"
		rval = nil

		# This shouldn't be necessary, but it's here for completeness
		Linguistics::use( :en )

		[ TestArray, TestString, TestNumber ].each do |obj|
			debugMsg "obj.class.instance_variables = %s" %
				obj.class.instance_variables.inspect

			assert_respond_to obj, :en
			assert_nothing_raised {
				rval = obj.en
			}
			assert_kind_of Linguistics::InflectorClass, rval
		end
	end


	def test_20_SpecifyClasses
		printTestHeader "Linguistics: Extend specific classes"
		
		assert_nothing_raised( "One class, not in an array" ) {
			Linguistics::use( :en, :classes => Symbol )
		}
		assert_respond_to :foo, :en

		assert_nothing_raised( "One class, in an array" ) {
			Linguistics::use( :en, :classes => [IO] )
		}
		assert_respond_to $stderr, :en

		assert_nothing_raised( "Two classes, in an Array" ) {
			Linguistics::use( :en, :classes => [Class, Range] )
		}
		assert_respond_to Array, :en
		assert_respond_to (1..5), :en
	end

end
end
