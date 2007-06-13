#!/usr/bin/ruby -w
#
# Unit test for Linguistics::EN#lprintf
# $Id$
#
# Copyright (c) 2006 The FaerieMUD Consortium.
# 

unless defined?( Linguistics::TestCase )
	require 'pathname'
	basedir = Pathname.new( __FILE__ ).dirname.parent.parent.expand_path
	
	libdir = basedir + "lib"
	testsdir = basedir + "tests"
	$LOAD_PATH.unshift( libdir ) unless $LOAD_PATH.include?( libdir )
	$LOAD_PATH.unshift( testsdir ) unless $LOAD_PATH.include?( testsdir )
	
	require 'lingtestcase'
end

require 'linguistics/en'

### This test case tests the lprintf method of the Linguistics English module
class Linguistics::LPrintfTestCase < Linguistics::TestCase

	Items = %w{ruby moose mouse nexus}
	
	def initialize( *args )
		Linguistics::use( :en )
		super
	end

	def test_lprintf_with_conjunct_tag_should_conjunctionize_the_corresponding_argument
		rval = nil
		
		assert_nothing_raised do
			rval = "I have %CONJUNCT in my pocket".en.lprintf( Items )
		end
		
		assert_equal "I have a ruby, a moose, a mouse, and a nexus in my pocket",
			rval
	end

	
	def test_lprintf_with_plural_tag_should_pluralize_the_corresponding_argument
		rval = nil
		
		assert_nothing_raised do
			rval = "What's with all the %PL?".en.lprintf( "llama" )
		end
		
		assert_equal "What's with all the llamas?", rval
	end

	
	def test_lprintf_with_indef_article_tag_should_use_an_for_umbrella
		rval = nil
		
		assert_nothing_raised do
			rval = "You pick up %A.".en.lprintf( "umbrella" )
		end
		
		assert_equal "You pick up an umbrella.", rval
	end

	
	def test_lprintf_with_indef_article_tag_should_use_a_for_flagon_of_mead
		rval = nil
		
		assert_nothing_raised do
			rval = "You pick up %A.".en.lprintf( "flagon of mead" )
		end
		
		assert_equal "You pick up a flagon of mead.", rval
	end
	
end
