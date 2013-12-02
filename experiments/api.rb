#!/usr/bin/ruby
#
# This is a little pseudo-program to work out how to best generalize the
# interface to the grammar tools.
#
# == Authors
#
# * Michael Granger <ged@FaerieMUD.org>
#
# == Copyright
#
# Copyright (c) 2003, 2005 The FaerieMUD Consortium. All rights reserved.
#
# This module is free software. You may use, modify, and/or redistribute this
# software under the terms of the Perl Artistic License. (See
# http://language.perl.com/misc/Artistic.html)
#
# == Version
#
#  $Id$
#

require 'linguistics'
Linguistics::use( :en, 'de' )


#####################################################################
###	C O N J U N C T I O N S
#####################################################################

things = [
	'a stick',
	'a stone',
	'a stick',
	'a silver hammer',
	'an old hammer',
]

print things.en.conjunction
# => "two sticks, a stone, a silver hammer, and an old hammer"

things = [
	"ein Stein",
	"ein Reisig",
	"ein Stein",
	"ein silber Hammer",
	"ein alten Hammer",
]
print things.de.conjunction
# => "zwei Steinen, ein Reisig, ein silber Hammer, und ein alten Hammer"



#####################################################################
###	I N F L E C T I O N S
#####################################################################

### Unconditional plurals

"duck".en.plural
# => "ducks"

"goose".en.plural
# => "geese"


### Conditional plurals

"trivet".en.plural( 1 )
# => "trivet"

"trivet".en.plural( 4 )
# => "trivets"


### POS plurals

"paint".en.plural_noun
# => "paints"

"paint".en.plural_verb
# => "paint"


### Ordinals

5.ord
# => 5th

### Plural/singular

# "0/1/N" -> "no/1/N" translation
[3, 1, 0].each {|errors|
	puts "There " + 'were'.en.plural_verb(errors) + " error".en.no(errors)
}
# => There were 3 errors
# => There was 1 error
# => There were no errors

# Compare two words "number-insensitively":
puts "same" if word1.en === word2.en
puts "same noun" if word1.en.noun === word2.en.noun
puts "same verb" if word1.en.verb === word2.en.verb
puts "same adjective" if word1.en.adj === word2.en.adj

# Add correct "a" or "an" for a given word:
%{Did you want #{"thing".en.a} or #{"idea".en.a}?}


### Convert numerals to words (i.e. 1->"one", 101->"one hundred and one", etc.)
### In a scalar context: get back a single string...

# Add methods to Numeric, singleton methods to returned strings for #ord and
# #words that will allow .words.to_a, etc.)

1234.words
# => "one thousand, two hundred and thirty-four"
1234.ord.words
# => "one thousand, two hundred and thirty-fourth"
1234.words.to_a
# => ["one thousand","two hundred and thirty-four"]


# Optional parameters change translation:
12345.words( :group => 1 )
# "one, two, three, four, five"
12345.words( :group => 2 )
# "twelve, thirty-four, five"
12345.words( :group => 3 )
# "one twenty-three, forty-five"
1234.words( :and => '' )
# "one thousand, two hundred thirty-four"
1234.words( :and => ', plus' )
# "one thousand, two hundred, plus thirty-four"
555_1202.words( :group => 1, :zero => 'oh' )
# "five, five, five, one, two, oh, two"
123.456.words( :group => 1, :decimal => 'mark' )
# "one two three mark four five six"

"duck".en.quantify( 0 )
# => "no ducks"
"duck".en.quantify( 1 )
# => "a duck"
"duck".en.quantify( 2 )
# => "a few ducks"
"duck".en.quantify( 5 )
# => "several ducks"
"duck".en.quantify( 50 )
# => "many ducks"
"duck".en.quantify( 504 )
# => "hundreds of ducks"
"duck".en.quantify( 5046 )
# => "thousands of ducks"
"duck".en.quantify( 50_461 )
# => "tens of thousands of ducks"
"duck".en.quantify( 504_614 )
# => "hundreds of thousands of ducks"
"duck".en.quantify( 5_046_140 )
# => "millions of ducks"


### "Classical" plurals (eg: "focus"->"foci", "cherub"->"cherubim")
#   Use classical plurals
Linguistics::use( :en, :classical => true )

# Interpolate "PL()", "PL_N()", "PL_V()", "PL_ADJ()", A()", "AN()"
# "NUM()" AND "ORD()" WITHIN STRINGS:

"The plural of #{word} is PL(word)\n".inflect


# print inflect("The plural of $word is PL($word)\n")
# print inflect("I saw $cat_count PL("cat",$cat_count)\n")
# print inflect("PL(I,$N1) PL_V(saw,$N1) PL(a,$N2) PL_N(saw,$N2)")
# print inflect("NUM($N1,)PL(I) PL_V(saw) NUM($N2,)PL(a) PL_N(saw)")
# print inflect("I saw NUM($cat_count) PL("cat")\nNUM()")
# print inflect("There PL_V(was,$errors) NO(error,$errors)\n")
# print inflect("There NUM($errors,) PL_V(was) NO(error)\n"
# print inflect("Did you want A($thing) or AN($idea)\n")
# print inflect("It was ORD($position) from the left\n")

# # ADD USER-DEFINED INFLECTIONS (OVERRIDING INBUILT RULES):

# def_noun  "VAX"  => "VAXen";	# SINGULAR => PLURAL

# def_verb  "will" => "shall",	# 1ST PERSON SINGULAR => PLURAL
# "will" => "will",	# 2ND PERSON SINGULAR => PLURAL
# "will" => "will",	# 3RD PERSON SINGULAR => PLURAL

# def_adj   "hir"  => "their",	# SINGULAR => PLURAL

# def_a	"h"			# "AY HALWAYS SEZ 'HAITCH'!"

# def_an	"horrendous.*"		# "AN HORRENDOUS AFFECTATION"

