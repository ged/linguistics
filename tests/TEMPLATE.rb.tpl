#!/usr/bin/ruby -w
#
# Unit test for (>>>target<<<) 
# $Id: TEMPLATE.rb.tpl,v 1.1 2003/07/09 14:49:59 deveiant Exp $
#
# Copyright (c) (>>>YEAR<<<) The FaerieMUD Consortium.
# 

if File::exists?( "lib/linguistics.rb" )
	require 'tests/lingtestcase'
else
	require 'lingtestcase'
end


### This test suite tests the stage1 (static) parser and the metagrammar it
### parses in which the actual parser-generator's behaviour is defined.
class (>>>target<<<)TestCase < Linguistics::TestCase
	(>>>POINT<<<)
end

>>>TEMPLATE-DEFINITION-SECTION<<<
("target" "What does this testcase test?: ")
