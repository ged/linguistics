#!/usr/bin/ruby -w
#
# Unit test for Linguistics::EN WordNet functions 
# $Id: wordnet.tests.rb,v 1.1 2003/09/10 03:48:46 deveiant Exp $
#
# Copyright (c) 2003 The FaerieMUD Consortium.
# 

unless defined? Linguistics::TestCase
	testsdir = File::dirname( File::dirname(File::expand_path( __FILE__ )) )
	$LOAD_PATH.unshift testsdir unless $LOAD_PATH.include?( testsdir )

	require 'lingtestcase'
end


### This test case tests ...
class EnglishWordnetTestCase < Linguistics::TestCase

	Linguistics::use( :en, :installProxy => true )

	TestObjects = [ "auto", 5, [%w{ash bin}] ]

	### Overridden to skip tests if WordNet isn't installed.
	def run( result )
		return super if Linguistics::EN::hasWordnet?
		yield( STARTED, name )
		result.add_run
		yield( FINISHED, name )
	end


	#################################################################
	###	T E S T S
	#################################################################

	### Test the wnLexicon method of the EN module
	def test_00_Lexicon
		printTestHeader "English: WordNet: Lexicon"

		assert_respond_to Linguistics::EN, :wnLexicon
		assert_nothing_raised {
			lex = Linguistics::EN::wnLexicon
			assert_instance_of WordNet::Lexicon, lex
		}
	end
	
	### Test synset method
	def test_05_Synset
		printTestHeader "English: WordNet: Synsets"
		rval = nil

		TestObjects.each do |obj|
			assert_respond_to obj, :en
			assert_respond_to obj.en, :synset

			assert_nothing_raised { rval = obj.en.synset }
			assert_instance_of WordNet::Synset, rval,
				".en.synset for %p" % obj
		end
	end

	### Test proxy method
	def test_06_ProxyMethod
		printTestHeader "English: WordNet: Proxy method"
		rval = nil

		TestObjects.each do |obj|
			assert_nothing_raised { rval = obj.synset }
			assert_instance_of WordNet::Synset, rval,
				".synset for %p" % obj
		end

		self.class.addSetupBlock {
			@obj = TestObjects[0]
		}
		self.class.addTeardownBlock {
			@obj = nil
		}
	end

	### Test #coordinates
	def test_10_Coordinates
		printTestHeader "English: WordNet: Coordinate terms"
		rval = nil

		assert_nothing_raised {
			rval = @obj.coordinates
		}
		assert_instance_of Array, rval
		assert_instance_of WordNet::Synset, rval.first
	end
	
end

