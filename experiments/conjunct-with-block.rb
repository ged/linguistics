#!/usr/bin/ruby
#
# Written to find a minimal testcase for the #conjunction-with-block bug.
#
# Time-stamp: <04-Nov-2005 07:43:36 ged>
#

BEGIN {
	base = File::dirname( File::dirname(File::expand_path(__FILE__)) )
	$LOAD_PATH.unshift "#{base}/lib"

	require "#{base}/utils.rb"
	include UtilityFunctions
}

require 'linguistics'

Linguistics::use( :en, :installProxy => true )
array = %w{sheep shrew goose bear penguin barnacle sheep goose goose}

$defout.puts "Called via language proxy: ",
  array.en.conjunction {|word| "%s-word" % [word[0,1]]}

$defout.puts "Called via delegator proxy: ",
  array.conjunction {|word| "%s-word" % [word[0,1]]}

$defout.puts "Called via language proxy: ",
  array.en.conjunction {|word| "%s-word" % [word[0,1]]}


