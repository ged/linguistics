#!/usr/bin/ruby

BEGIN {
	$LOAD_PATH.unshift File::dirname(File::dirname( __FILE__ )) + "/lib"
	require 'linguistics'
}

Linguistics::use( :en )

# Just a(nother) fun little demo of the conjunction (junction, what's
# your) function.

allobjs = []
ObjectSpace::each_object {|obj| allobjs << obj.class.name}

puts "The current Ruby objectspace contains: " +
	allobjs.en.conjunction( :generalize => true )

