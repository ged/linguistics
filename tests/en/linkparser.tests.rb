#!/usr/bin/ruby -w
#
# Unit test for English link grammar
# $Id: linkparser.tests.rb,v 1.2 2003/09/14 10:30:38 deveiant Exp $
#
# Copyright (c) 2003 The FaerieMUD Consortium.
#

if !defined?( Linguistics ) || !defined?( Linguistics::TestCase )
	if File::exists?( "lib/linguistics.rb" )
		require 'tests/lingtestcase'
	else
		require 'lingtestcase'
	end
end

### This test case tests the English language link grammar extension of
### Linguistics::EN.
class LinkParserTestCase < Linguistics::TestCase

	Linguistics::use(:en)
	include Linguistics::EN

	### Overridden to skip tests if WordNet isn't installed.
	def run( result )
		return super if Linguistics::EN::hasLinkParser?
		yield( STARTED, name )
		result.add_run
		yield( FINISHED, name )
	end


	def test_010_functions 
		sent = "he is a dog"
		test = test2 = nil
		assert_nothing_raised			{test = sent.en.linkParse}
		assert_equal					sent, test.to_str
		assert_kind_of					LinkParser::Sentence, test
		assert_nothing_raised			{test2 = sent.en.sentence}
		assert_equal					sent, test2.to_str
		assert_kind_of					LinkParser::Sentence, test2
		assert_equal					test, test2
	end

	def test_030_grammatically_correct 
		test = nil
		sent = "he is a dog"
		assert_nothing_raised			{test = sent.en.sentence.sentence?}
		assert							test
		sent = "dog a he is"
		assert_nothing_raised			{test = sent.en.linkParse.sentence?}
		assert							! test
		sent = ""
		errclass = LinkParser::ParseError
		assert_raises( errclass)		{test = sent.en.sentence}
		assert							! test
	end

	def test_050_parts_of_speech 
		test = nil
		sent = "he is a dog"
		assert_nothing_raised			{test = sent.en.linkParse.verb}
		assert_equal					test, "is"
		assert_nothing_raised			{test = sent.en.linkParse.subject}
		assert_equal					test, "he"
		assert_nothing_raised			{test = sent.en.linkParse.object}
		assert_equal					test, "dog"
		sent = ""
		errclass = LinkParser::ParseError
		assert_raises( errclass )		{test = sent.en.linkParse}
	end
end
