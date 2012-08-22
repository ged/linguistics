#!/usr/bin/ruby

require 'rubygems' # For Gem.find_files
require 'pathname'

require 'linguistics' unless defined?( Linguistics )


# This module is a container for various English-language linguistic
# functions for the Linguistics library. It can be either loaded
# directly, or by passing some variant of +:en+ or +:eng+ to the
# Linguistics.use method.
#
# == Pluralization
#
#  "box".en.plural
#  # => "boxes"
#
#  "mouse".en.plural
#  # => "mice"
#
#  "ruby".en.plural
#  # => "rubies"
#
#
# == Indefinite Articles
#
#  "book".en.a
#  # => "a book"
#
#  "article".en.a
#  # => "an article"
#
#
# == Present Participles
#
#  "runs".en.present_participle
#  # => "running"
#
#  "eats".en.present_participle
#  # => "eating"
#
#  "spies".en.present_participle
#  # => "spying"
#
#
# == Ordinal Numbers
#
#  5.en.ordinal
#  # => "5th"
#
#  2004.en.ordinal
#  # => "2004th"
#
#
# == Numbers to Words
#
#  5.en.numwords
#  # => "five"
#
#  2004.en.numwords
#  # => "two thousand and four"
#
#  2385762345876.en.numwords
#  # => "two trillion, three hundred and eighty-five billion, seven hundred and
#  #     sixty-two million, three hundred and forty-five thousand, eight hundred
#  #     and seventy-six"
#
#
# == Quantification
#
#  "cow".en.quantify( 5 )
#  # => "several cows"
#
#  "cow".en.quantify( 1005 )
#  # => "thousands of cows"
#
#  "cow".en.quantify( 20_432_123_000_000 )
#  # => "tens of trillions of cows"
#
#
# == Conjunctions
#
#  animals = %w{dog cow ox chicken goose goat cow dog rooster llama pig goat
#               dog cat cat dog cow goat goose goose ox alpaca}
#  "The farm has: " + animals.en.conjunction
#  # => "The farm has: four dogs, three cows, three geese, three goats, two
#  #     oxen, two cats, a chicken, a rooster, a llama, a pig, and an alpaca"
#
# Note that 'goose' and 'ox' are both correctly pluralized, and the correct
# indefinite article 'an' has been used for 'alpaca'.
#
# You can also use the generalization function of the #quantify method to give
# general descriptions of object lists instead of literal counts:
#
#  allobjs = []
#  ObjectSpace::each_object {|obj| allobjs << obj.class.name }
#  puts "The current Ruby objectspace contains: " +
#       allobjs.en.conjunction( :generalize => true )
#
# Outputs:
#
#  The current Ruby objectspace contains: hundreds of thousands of Strings,
#  thousands of RubyVM::InstructionSequences, thousands of Arrays, thousands
#  of Hashes, hundreds of Procs, hundreds of Regexps, [...], a
#  SystemStackError, a Random, an ARGF.class, a Data, a fatal, an
#  OptionParser::List, a YAML::EngineManager, a URI::Parser, a Rational, and
#  a Gem::Platform
#
#
# == Infinitives
#
#   "leaving".en.infinitive
#   # => "leave"
#
#   "left".en.infinitive
#   # => "leave"
#
#   "leaving".en.infinitive.suffix
#   # => "ing"
#
#
# == Conjugation
#
# Conjugate a verb given an infinitive:
#
#   "run".en.past_tense
#   # => "ran"
#
#   "run".en.past_participle
#   # => "run"
#
#   "run".en.present_tense
#   # => "run"
#
#   "run".en.present_participle
#   # => "running"
#
# Conjugate an infinitive with an explicit tense and grammatical person:
#
#   "be".en.conjugate( :present, :third_person_singular )
#   # => "is"
#
#   "be".en.conjugate( :present, :first_person_singular )
#   # => "am"
#
#   "be".en.conjugate( :past, :first_person_singular )
#   # => "was"
#
# The functionality is a port of the verb conjugation portion of Morph
# Adorner (http://morphadorner.northwestern.edu/).
#
# It includes a good number of irregular verbs, but it's not going to be
# 100% correct everytime.
#
#
# == WordNet® Integration
#
# If you have the 'wordnet' gem installed, you can look up WordNet synsets using
# the Linguistics interface:
#
# Test to be sure the WordNet module loaded okay.
#
#    Linguistics::EN.has_wordnet?
#    # => true
#
# Fetch the default synset for the word "balance"
#
#    "balance".en.synset
#    # => #<WordNet::Synset:0x7f9fb11012f8 {102777100} 'balance' (noun):
#    #    [noun.artifact] a scale for weighing; depends on pull of gravity>
#
# Fetch the synset for the first verb sense of "balance"
#
#   "balance".en.synset( :verb )
#   # => #<WordNet::Synset:0x7f9fb10f3fb8 {201602318} 'balance, poise' (verb):
#   #    [verb.contact] hold or carry in equilibrium>
#
# Fetch the second noun sense
#
#   "balance".en.synset( 2, :noun )
#   # => #<WordNet::Synset:0x7f9fb10ebbd8 {102777402} 'balance, balance wheel'
#   #     (noun): [noun.artifact] a wheel that regulates the rate of movement in a
#   #     machine; especially a wheel oscillating against the hairspring of a
#   #     timepiece to regulate its beat>
#
# Fetch the second noun sense's hypernyms (more-general words, like a
# superclass)
#
#   "balance".en.synset( 2, :noun ).hypernyms
#   # => [#<WordNet::Synset:0x7f9fb10dd100 {104574999} 'wheel' (noun):
#   #    [noun.artifact] a simple machine consisting of a circular frame with
#   #    spokes (or a solid disc) that can rotate on a shaft or axle (as in
#   #    vehicles or other machines)>]
#
# A simpler way of doing the same thing:
#
#   "balance".en.hypernyms( 2, :noun )
#   # => [#<WordNet::Synset:0x7f9fb10d24d0 {104574999} 'wheel' (noun):
#   #    [noun.artifact] a simple machine consisting of a circular frame with
#   #    spokes (or a solid disc) that can rotate on a shaft or axle (as in
#   #    vehicles or other machines)>]
#
# Fetch the first hypernym's hypernyms
#
#   "balance".en.synset( 2, :noun ).hypernyms.first.hypernyms
#   # => [#<WordNet::Synset:0x7f9fb10c5190 {103700963} 'machine, simple machine'
#   #    (noun): [noun.artifact] a device for overcoming resistance at one point by
#   #    applying force at some other point>]
#
# Find the synset to which both the second noun sense of "balance" and the
# default sense of "shovel" belong.
#
#   ("balance".en.synset( 2, :noun ) | "shovel".en.synset)
#   # => #<WordNet::Synset:0x7f9fb1091e58 {103183080} 'device' (noun):
#   #    [noun.artifact] an instrumentality invented for a particular purpose>
#
# Fetch words for the specific kinds of (device-ish) "instruments"
#
#   "instrument".en.hyponyms( "device" ).collect( &:words ).flatten.join(', ')
#   # => "analyser, analyzer, cauterant, cautery, drafting instrument, engine,
#   #    extractor, instrument of execution, instrument of punishment, measuring
#   #    device, measuring instrument, measuring system, medical instrument,
#   #    navigational instrument, optical instrument, plotter, scientific
#   #    instrument, sonograph, surveying instrument, surveyor's instrument,
#   #    tracer, arm, weapon, weapon system, whip"
#
# ...or musical instruments
#
#   "instrument".en.hyponyms( "musical" ).collect( &:words ).flatten.join(', ')
#   # => "barrel organ, grind organ, hand organ, hurdy-gurdy, hurdy gurdy,
#   #    street organ, bass, calliope, steam organ, electronic instrument,
#   #    electronic musical instrument, jew's harp, jews' harp, mouth bow, keyboard
#   #    instrument, music box, musical box, percussion instrument, percussive
#   #    instrument, stringed instrument, wind, wind instrument"
#
# There are many more WordNet methods supported--too many to list here. See the
# WordNet::Synset API documentation for the complete list.
#
#
# == LinkParser Integration
#
# If you have the 'linkparser' gem installed, you can create linkages
# from English sentences that let you query for parts of speech:
#
# Test to see whether or not the link parser is loaded.
#
#   Linguistics::EN.has_linkparser?
#   # => true
#
# Diagram the first linkage for a test sentence
#
#   puts "he is a big dog".en.sentence.linkages.first.diagram
#
# Outputs:
#
#        +-----Ost----+
#        |  +----Ds---+
#    +-Ss+  |   +--A--+
#    |   |  |   |     |
#   he is.v a big.a dog.n
#
# Find the verb in the sentence
#
#   "he is a big dog".en.sentence.verb.to_s
#   # => "is"
#
# Combined infinitive + LinkParser: Find the infinitive form of the verb of the
# given sentence.
#
#   "he is a big dog".en.sentence.verb.en.infinitive
#   # => "be"
#
# Find the direct object of the sentence
#
#   "he is a big dog".en.sentence.object.to_s
#   # => "dog"
#
# Combine WordNet + LinkParser to find the definition of the direct object of
# the sentence
#
#   "he is a big dog".en.sentence.object.en.definition
#   # => "a member of the genus Canis (probably descended from the common wolf)
#   #    that has been domesticated by man since prehistoric times; occurs in many
#   #    breeds"
#
#
module Linguistics::EN
	extend Loggability

	# Loggability API -- log to the Linguistics logger
	log_to :linguistics

	# The list of loaded modules
	MODULES = []

	# The key to set in the thread-hash to indicate it's running in 'classical' mode
	THREAD_CLASSICAL_KEY = :english_classical_mode


	# A Hash of 'lprintf' formatters keyed by name
	@@lprintf_formatters = {}


	#################################################################
	###	U T I L I T Y   F U N C T I O N S
	#################################################################

	### A Hash of formatters for the lprintf function.
	def self::lprintf_formatters
		return @@lprintf_formatters
	end


	### Register an English-language extension.
	def self::register_extension( mod )
		MODULES.push( mod )
		self.log.debug "Registered English extension %p" % [ mod ]

		include( mod )
		mod.extend( Loggability )
		mod.log_to( :linguistics )

		if mod.const_defined?( :SingletonMethods )
			smod = mod.const_get(:SingletonMethods)
			self.log.debug "  and its singleton methods %p" % [ smod ]
			extend( smod )

			ivars = mod.instance_variables
			self.log.debug "  and instance variables %p" % [ ivars ]
			ivars.each do |ivar|
				instance_variable_set( ivar, mod.instance_variable_get(ivar) )
			end
		end
	end


	### Returns +true+ if the English-language module with the given +name+ was
	### successfully registered.
	def self::has_extension?( name )
		return MODULES.any? do |mod|
			mod.name.sub( /.*::/, '' ).downcase == name.to_s.downcase
		end
	end


	### Debugging output
	def self::debug_msg( *msgs ) # :nodoc:
		$stderr.puts msgs.join(" ") if $DEBUG
	end


	### Add an lprintf formatter named +name+ that will use the specified +callback+ method.
	### The name of the formatter is the placeholder that will be used in the
	### format string, and the +callback+ is the method to call on the english-language
	### inflector for the lprintf argument, and can either be an object that responds to
	### #call, or the name of a method to call as a Symbol.
	###
	### Using a Symbol:
	###
	###    def plural( count=2 )
	###        # return the plural of the inflected object
	###    end
	###    Linguistics::EN.register_lprintf_formatter :PL, :plural
	###
	### Using a method:
	###
	###    Linguistics::EN.register_lprintf_formatter :PL, method( :plural )
	###
	### Using a block:
	###
	###    Linguistics::EN.register_lprintf_formatter :PL do |obj|
	###        obj.en.plural
	###    end
	###
	def self::register_lprintf_formatter( name, callback=nil )
		raise LocalJumpError, "no callback or block given" unless callback || block_given?
		callback ||= Proc.new

		@@lprintf_formatters[ name ] = callback.to_proc
	end


	### Return +true+ if running in a 'classical' mode.
	def self::classical?
		return Thread.current[ THREAD_CLASSICAL_KEY ] ? true : false
	end


	### Set classical mode for the current thread inside the block, then
	### unset it when it returns.
	def self::in_classical_mode
		old_setting = Thread.current[ THREAD_CLASSICAL_KEY ]
		Thread.current[ THREAD_CLASSICAL_KEY ] = true

		yield
	ensure
		Thread.current[ THREAD_CLASSICAL_KEY ] = old_setting
	end


	#################################################################
	###	P U B L I C   F U N C T I O N S
	#################################################################

	### Format the given +fmt+ string by replacing %-escaped sequences with the
	### result of performing a specified operation on the corresponding
	### argument, ala Kernel.sprintf.
	### %PL::
	###   Plural.
	### %A, %AN::
	###   Prepend indefinite article.
	### %NO::
	###   Zero-quantified phrase.
	### %NUMWORDS::
	###   Convert a number into the corresponding words.
	### %CONJUNCT::
	###   Conjunction.
	def lprintf( *args )
		return self.to_s.gsub( /%([A-Z_]+)/ ) do |match|
			op = $1.to_s.upcase.to_sym
			if (( callback = Linguistics::EN.lprintf_formatters[op] ))
				arg = args.shift
				callback.call( arg.en )
			else
				raise "no such formatter %p" % [ op ]
			end
		end
	end


	# Add 'english' to the list of default languages
	Linguistics.register_language( :en, self )


end # module Linguistics::EN

