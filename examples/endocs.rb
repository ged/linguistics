#!/usr/bin/env ruby

$LOAD_PATH.unshift( 'lib' )
$stdout.sync = $stderr.sync = true

require 'loggability'
require 'linguistics'
require 'pry'

lines = File.readlines( __FILE__ ).slice_before( /^__END__/ ).to_a
header = lines.shift
source = lines.shift
source.shift

header_lines = header.length + 1
code = ''
result = nil

Loggability.level = $VERBOSE ? :debug : :warn
Loggability.format_with( :color )

source.each_with_index do |line, i|
	case line

	# Eval any accumulated code on a blank line
	when /^\s*$/
		puts
		next if code.empty?
		puts( code )
		eval( code, binding(), __FILE__, header_lines + i )
		code = ''

	# Eval the code on a result marker, but also render the result after the marker
	when /^#\s+=>/
		puts( code )
		$stdout.flush
		result = eval( code, binding(), __FILE__, header_lines + i )
		print '# => '
		pp( result )
		code = ''

	# Output comment lines as-is
	when /^#/
		puts( line )

	# Anything else gets appended to the code accumulator
	else
		code << line
	end
end

__END__

# This module is a container for various English-language linguistic
# functions for the Linguistics library. It can be either loaded
# directly, or by passing some variant of +:en+ or +:eng+ to the
# Linguistics.use method.

require 'linguistics'
Linguistics.use( :en ) # extends Array, String, and Numeric

# == Pluralization

"box".en.plural
# => "boxes"

"mouse".en.plural
# => "mice"

"ruby".en.plural
# => "rubies"


# == Indefinite Articles

"book".en.a
# => "a book"

"article".en.a
# => "an article"


# == Present Participles

"runs".en.present_participle
# => "running"

"eats".en.present_participle
# => "eating"

"spies".en.present_participle
# => "spying"


# == Ordinal Numbers

5.en.ordinal
# => "5th"

2004.en.ordinal
# => "2004th"


# == Numbers to Words

5.en.numwords
# => "five"

2004.en.numwords
# => "two thousand and four"

2385762345876.en.numwords
# => "two trillion, three hundred and eighty-five billion, seven hundred and sixty-two million, three hundred and forty-five thousand, eight hundred and seventy-six"


# == Quantification

"cow".en.quantify( 5 )
# => "several cows"

"cow".en.quantify( 1005 )
# => "thousands of cows"

"cow".en.quantify( 20_432_123_000_000 )
# => "tens of trillions of cows"


# == Conjunctions

animals = %w{dog cow ox chicken goose goat cow dog rooster llama pig goat dog cat cat dog cow goat goose goose ox alpaca}
"The farm has: " + animals.en.conjunction
# => The farm has: four dogs, three cows, three geese, three goats, two oxen, two cats, a chicken, a rooster, a llama, a pig, and an alpaca

# Note that 'goose' and 'ox' are both correctly pluralized, and the correct
# indefinite article 'an' has been used for 'alpaca'.
#
# You can also use the generalization function of the #quantify method to give
# general descriptions of object lists instead of literal counts:

allobjs = []
ObjectSpace::each_object {|obj| allobjs << obj.class.name }
puts "The current Ruby objectspace contains: " + allobjs.en.conjunction( :generalize => true )
# =>


# == Infinitives

"leaving".en.infinitive
# => "leave"

"left".en.infinitive
# => "leave"

"leaving".en.infinitive.suffix
# => "ing"


# == Conjugation

#Conjugate a verb given an infinitive:

"run".en.past_tense
# => "ran"

"run".en.past_participle
# => "run"

"run".en.present_tense
# => "run"

"run".en.present_participle
# => "running"

# Conjugate an infinitive with an explicit tense and grammatical person:

"be".en.conjugate( :present, :third_person_singular )
# => "is"

"be".en.conjugate( :present, :first_person_singular )
# => "am"

"be".en.conjugate( :past, :first_person_singular )
# => "was"

# The functionality is a port of the verb conjugation portion of Morph
# Adorner (http://morphadorner.northwestern.edu/).
#
# It includes a good number of irregular verbs, but it's not going to be
# 100% correct everytime.


# == WordNet® Integration

# If you have the 'wordnet' gem installed, you can look up WordNet synsets using
# the Linguistics interface:

# Test to be sure the WordNet module loaded okay.
Linguistics::EN.has_wordnet?
# => true

# Fetch the default synset for the word "balance"
"balance".en.synset
# => #<WordNet::Synset:0x40376844 balance (noun): "a state of equilibrium" (derivations: 3, antonyms: 1, hypernyms: 1, hyponyms: 3)>

# Fetch the synset for the first verb sense of "balance"
"balance".en.synset( :verb )
# => #<WordNet::Synset:0x4033f448 balance, equilibrate, equilibrize, equilibrise (verb): "bring into balance or equilibrium; "She has to balance work and her domestic duties"; "balance the two weights"" (derivations: 7, antonyms: 1, verbGroups: 2, hypernyms: 1, hyponyms: 5)>

# Fetch the second noun sense
"balance".en.synset( 2, :noun )
# => #<WordNet::Synset:0x404ebb24 balance (noun): "a scale for weighing; depends on pull of gravity" (hypernyms: 1, hyponyms: 5)>

# Fetch the second noun sense's hypernyms (more-general words, like a superclass)
"balance".en.synset( 2, :noun ).hypernyms
# => [#<WordNet::Synset:0x404e5620 scale, weighing machine (noun): "a measuring instrument for weighing; shows amount of mass" (derivations: 2, hypernyms: 1, hyponyms: 2)>]

# A simpler way of doing the same thing:
"balance".en.hypernyms( 2, :noun )
# => [#<WordNet::Synset:0x404e5620 scale, weighing machine (noun): "a measuring instrument for weighing; shows amount of mass" (derivations: 2, hypernyms: 1, hyponyms: 2)>]

# Fetch the first hypernym's hypernyms
"balance".en.synset( 2, :noun ).hypernyms.first.hypernyms
# => [#<WordNet::Synset:0x404c60b8 measuring instrument, measuring system, measuring device (noun): "instrument that shows the extent or amount or quantity or degree of something" (hypernyms: 1, hyponyms: 83)>]

# Find the synset to which both the second noun sense of "balance" and the
# default sense of "shovel" belong.
("balance".en.synset( 2, :noun ) | "shovel".en.synset)
# => #<WordNet::Synset:0x40473da4 instrumentality, instrumentation (noun): "an artifact (or system of artifacts) that is instrumental in accomplishing some end" (derivations: 1, hypernyms: 1, hyponyms: 13)>

# Fetch words for the specific kinds of (device-ish) "instruments"
"instrument".en.hyponyms( "device" ).collect( &:words ).flatten.join(', ')
# => ["analyzer", "analyser", "cautery", "cauterant", "drafting instrument", "extractor", "instrument of execution", "instrument of punishment", "measuring instrument", "measuring system", "measuring device", "medical instrument", "navigational instrument", "optical instrument", "plotter", "scientific instrument", "sonograph", "surveying instrument", "surveyor's instrument", "tracer", "weapon", "arm", "weapon system", "whip"]

# ...or musical instruments
"instrument".en.hyponyms( "musical" ).collect( &:words ).flatten.join(', ')
# => ["analyzer", "analyser", "cautery", "cauterant", "drafting instrument", "extractor", "instrument of execution", "instrument of punishment", "measuring instrument", "measuring system", "measuring device", "medical instrument", "navigational instrument", "optical instrument", "plotter", "scientific instrument", "sonograph", "surveying instrument", "surveyor's instrument", "tracer", "weapon", "arm", "weapon system", "whip"]

# There are many more WordNet methods supported--too many to list here. See the
# documentation for the complete list.


# == LinkParser Integration

# If you have the 'linkparser' gem installed, you can create linkages
# from English sentences that let you query for parts of speech:

# Test to see whether or not the link parser is loaded.
Linguistics::EN.has_linkparser?
# => true

# Diagram the first linkage for a test sentence
puts "he is a big dog".en.sentence.linkages.first.diagram

# Find the verb in the sentence
"he is a big dog".en.sentence.verb
# => "is"

# Combined infinitive + LinkParser: Find the infinitive form of the verb of the
# given sentence.
"he is a big dog".en.sentence.verb.en.infinitive
# => "be"

# Find the direct object of the sentence
"he is a big dog".en.sentence.object
# => "dog"

# Combine WordNet + LinkParser to find the definition of the direct object of
# the sentence
"he is a big dog".en.sentence.object.en.definition
# =>


