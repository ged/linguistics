#!/usr/bin/ruby -w
#
# Unit test for additions donated by Francis Hwang, author of Lafcadio
# $Id$
#
# Converted from ts_english.rb.
# 

unless defined? Linguistics::TestCase
	testsdir = File::dirname( File::dirname(File::expand_path( __FILE__ )) )
	$LOAD_PATH.unshift testsdir unless $LOAD_PATH.include?( testsdir )

	require 'lingtestcase'
end

### This test case tests ...
class LafcadioAdditionsTestCase < Linguistics::TestCase

	Linguistics::use( :en )
	include Linguistics::EN

	CamelCaseStrings = [
		["productCategory", 	"product category"],
		["ProductCategory", 	"product category"],
		["catalogOrder",		"catalog order"],
		["product",				"product"],
	]

	ProperNouns = {
		"albania" => "Albania",
		"bosnia and herzegovina" => "Bosnia and Herzegovina",
		"faroe islands" => "Faroe Islands",
		"macedonia, the former yugoslav republic of" =>
			"Macedonia, the Former Yugoslav Republic of",
		"virgin islands, u.s." => "Virgin Islands, U.S.",
	}

	

	#################################################################
	###	T E S T S
	#################################################################

	def test_camelCaseToEnglish
		printTestHeader "Lafcadio Additions: CamelCase to English"
		res = nil

		CamelCaseStrings.each do |src, dst|
			assert_nothing_raised { res = src.en.camel_case_to_english }
			assert_equal dst, res
		end
	end

	### This already worked before the additions, but might as well test 'em
	### some more.
	def test_plural
		assert_equal "product categories", "product category".en.plural
		assert_equal "products", "product".en.plural
		assert_equal 'addresses', 'address'.en.plural
		assert_equal 'taxes', 'tax'.en.plural
	end


	### String#proper_noun
	def test_properNoun
		printTestHeader "Lafcadio Additions: Proper Nouns"

		ProperNouns.each do |key,expected|
			input = key.dup # Get around hash keys being frozen
			debugMsg "Trying %p, expect: %p" % [input, expected]
			assert_equal expected, input.en.proper_noun
		end
	end

end

