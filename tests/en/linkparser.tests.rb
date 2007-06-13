#!/usr/bin/ruby -w
#
# Unit test for English link grammar
# $Id: linkparser.tests.rb,v 1.2 2003/09/14 10:30:38 deveiant Exp $
#
# Copyright (c) 2003-2005 The FaerieMUD Consortium.
#

unless defined? Linguistics::TestCase
	testsdir = File::dirname( File::dirname(File::expand_path( __FILE__ )) )
	$LOAD_PATH.unshift testsdir unless $LOAD_PATH.include?( testsdir )

	require 'lingtestcase'
end

### This test case tests the English language link grammar extension of
### Linguistics::EN.
class LinkParserTestCase < Linguistics::TestCase

	Linguistics::use(:en)
	include Linguistics::EN

	### Overridden to skip tests if WordNet isn't installed.
	def run( result )
		return super if Linguistics::EN::has_link_parser?
		yield( STARTED, name )
		result.add_run
		yield( FINISHED, name )
	end


	def test_sentence_should_return_a_parsed_linkparser_sentence
		rval = nil

		assert_nothing_raised do
			rval = "He is a dog.".en.sentence
		end
		
		assert_instance_of LinkParser::Sentence, rval
	end

end
