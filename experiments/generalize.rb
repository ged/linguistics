#!/usr/bin/ruby


BEGIN {
	$LOAD_PATH.unshift File::dirname(File::dirname( __FILE__ )) + "/lib"
	require 'linguistics'
}

Linguistics::use( :en, :installProxy => :en )

# Just a bit of fun -- takes a sentence, and tries to generalize it by looking
# up the hypernyms of each of the words. This'll work much better when
# integration with LinkParser is added, as this doesn't know about parts of
# speech or anything.

if ARGV.empty?
	print "Sentence: "
	sentence = $stdin.gets
else
	sentence = ARGV.join(" ")
end

newSentence = sentence.split.collect {|word|
	word.hypernyms ? word.hypernyms[0].words[0] : word
}.join(" ")


puts "Converted:\n  %s\nto\n  %s\n\n" % [ sentence, newSentence ]

