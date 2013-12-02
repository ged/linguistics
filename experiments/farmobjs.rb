#!/usr/bin/ruby

BEGIN {
	$LOAD_PATH.unshift File::dirname(File::dirname( __FILE__ )) + "/lib"
	require 'linguistics'
}

Linguistics::use( :en )

# Just a(nother) fun little demo of the conjunction (junction, what's
# your) function.
animals = %w{dog cow ox chicken goose goat cow dog rooster llama
	pig goat dog cat cat dog cow goat goose goose ox alpaca}
puts "The farm has: " +
	animals.en.conjunction
