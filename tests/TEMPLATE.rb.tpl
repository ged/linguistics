#!/usr/bin/ruby -w
#
# Unit test for (>>>target<<<) 
# $Id: TEMPLATE.rb.tpl,v 1.2 2003/09/11 04:59:51 deveiant Exp $
#
# Copyright (c) (>>>YEAR<<<) The FaerieMUD Consortium.
# 

if File::exists?( "lib/linguistics.rb" )
	require 'tests/lingtestcase'
else
	require 'lingtestcase'
end


### This test case tests ...
class (>>>target<<<)TestCase < Linguistics::TestCase
	(>>>POINT<<<)
end

>>>TEMPLATE-DEFINITION-SECTION<<<
("target" "What does this testcase test?: ")
