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


# Prints:
#  "The current Ruby objectspace contains: thousands of Strings, thousands of
#  Arrays, hundreds of Hashes, hundreds of Classes, many Regexps, a number of
#  Ranges, a number of Modules, several Files, several Floats, several Procs,
#  several MatchDatas, several Objects, several IOS, a Binding, a NoMemoryError,
#  a SystemStackError, a fatal, a Thread, and a ThreadGroup"
#

# If :generalize is set to 'false', it prints:
#  "The current Ruby objectspace contains: 8744 Strings, 1025 Arrays, 425
#  Hashes, 184 Classes, 74 Regexps, 18 Ranges, 18 Modules, five Files, five
#  Floats, four Procs, three MatchDatas, three Objects, three IOS, a Binding, a
#  NoMemoryError, a SystemStackError, a fatal, a Thread, and a ThreadGroup"
#

