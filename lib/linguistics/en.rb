#!/usr/bin/ruby

require 'pathname'

require 'linguistics' unless defined?( Linguistics )

# This module is a container for various English-language linguistic
# functions for the Linguistics library. It can be either loaded
# directly, or by passing some variant of +:en+ or +:eng+ to the
# Linguistics.use method.
# 
# == Pluralization
# 
#  require 'linguistics'
#  Linguistics::use( :en ) # extends Array, String, and Numeric
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
#  # => "two trillion, three hundred and eighty-five billion,
#  seven hundred and sixty-two million, three hundred and
#  forty-five thousand, eight hundred and seventy-six"
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
#    animals = %w{dog cow ox chicken goose goat cow dog rooster llama 
#    pig goat dog cat cat dog cow goat goose goose ox alpaca}
#    puts "The farm has: " + animals.en.conjunction
#    
#    # => The farm has: four dogs, three cows, three geese, three goats,
#    two oxen, two cats, a chicken, a rooster, a llama, a pig, 
#    and an alpaca
# 
# Note that 'goose' and 'ox' are both correctly pluralized, and the correct
# indefinite article 'an' has been used for 'alpaca'.
# 
# You can also use the generalization function of the #quantify method to give
# general descriptions of object lists instead of literal counts:
# 
#    allobjs = []
#    ObjectSpace::each_object {|obj| allobjs << obj.class.name}
#    
#    puts "The current Ruby objectspace contains: " +
#      allobjs.en.conjunction( :generalize => true )
# 
# which will print something like:
# 
#    The current Ruby objectspace contains: thousands of Strings,
#    thousands of Arrays, hundreds of Hashes, hundreds of
#    Classes, many Regexps, a number of Ranges, a number of
#    Modules, several Floats, several Procs, several MatchDatas,
#    several Objects, several IOS, several Files, a Binding, a
#    NoMemoryError, a SystemStackError, a fatal, a ThreadGroup,
#    and a Thread
# 
# 
# == Infinitives
# 
#    "leaving".en.infinitive
#    # => "leave"
#    
#    "left".en.infinitive
#    # => "leave"
#    
#    "leaving".en.infinitive.suffix
#    # => "ing"
# 
# 
# == Conjugation
#
#    "run".en.past
#    # => "ran"
#
#    "run".en.present_participle
#    # => "running"
#
#    "see".en.conjugate :past, :third_person_singular
#    # => "saw"
#
#
# == WordNet® Integration
# 
# If you have the Ruby-WordNet module installed, you can look up 
# WordNet synsets using the Linguistics interface:
# 
#    # Test to be sure the WordNet module loaded okay.
#    Linguistics::EN.has_wordnet?
#    # => true
#    
#    # Fetch the default synset for the word "balance"
#    "balance".en.synset
#    # => #<WordNet::Synset:0x40376844 balance (noun): "a state of equilibrium"
#    #   (derivations: 3, antonyms: 1, hypernyms: 1, hyponyms: 3)>
#    
#    # Fetch the synset for the first verb sense of "balance"
#    "balance".en.synset( :verb )
#    # => #<WordNet::Synset:0x4033f448 balance, equilibrate, equilibrize, equilibrise
#    #    (verb): "bring into balance or equilibrium; "She has to balance work and her
#    #    domestic duties"; "balance the two weights"" (derivations: 7, antonyms: 1,
#    #    verbGroups: 2, hypernyms: 1, hyponyms: 5)>
#    
#    # Fetch the second noun sense
#    "balance".en.synset( 2, :noun )
#    # => #<WordNet::Synset:0x404ebb24 balance (noun): "a scale for weighing; depends
#    #    on pull of gravity" (hypernyms: 1, hyponyms: 5)>
#    
#    # Fetch the second noun sense's hypernyms (more-general words, like a superclass)
#    "balance".en.synset( 2, :noun ).hypernyms
#    # => [#<WordNet::Synset:0x404e5620 scale, weighing machine (noun): "a measuring
#    #     instrument for weighing; shows amount of mass" (derivations: 2, hypernyms: 1,
#    #     hyponyms: 2)>]
#    
#    # A simpler way of doing the same thing:
#    "balance".en.hypernyms( 2, :noun )
#    # => [#<WordNet::Synset:0x404e5620 scale, weighing machine (noun): "a measuring
#    #     instrument for weighing; shows amount of mass" (derivations: 2, hypernyms: 1,
#    #     hyponyms: 2)>]
#    
#    # Fetch the first hypernym's hypernyms
#    "balance".en.synset( 2, :noun ).hypernyms.first.hypernyms
#    # => [#<WordNet::Synset:0x404c60b8 measuring instrument, measuring system,
#    #     measuring device (noun): "instrument that shows the extent or amount or quantity
#    #     or degree of something" (hypernyms: 1, hyponyms: 83)>]
#    
#    # Find the synset to which both the second noun sense of "balance" and the
#    # default sense of "shovel" belong.
#    ("balance".en.synset( 2, :noun ) | "shovel".en.synset)
#    # => #<WordNet::Synset:0x40473da4 instrumentality, instrumentation (noun): "an
#    #    artifact (or system of artifacts) that is instrumental in accomplishing some
#    #    end" (derivations: 1, hypernyms: 1, hyponyms: 13)>
#    
#    # Fetch just the words for the other kinds of "instruments"
#    "instrument".en.hyponyms.collect {|synset| synset.words}.flatten
#    # => ["analyzer", "analyser", "cautery", "cauterant", "drafting instrument",
#    #     "extractor", "instrument of execution", "instrument of punishment", "measuring
#    #     instrument", "measuring system", "measuring device", "medical instrument",
#    #     "navigational instrument", "optical instrument", "plotter", "scientific
#    #     instrument", "sonograph", "surveying instrument", "surveyor's instrument",
#    #     "tracer", "weapon", "arm", "weapon system", "whip"]
# 
# There are many more WordNet methods supported--too many to list here. See the
# documentation for the complete list.
# 
# 
# == LinkParser Integration
# 
# Another new feature in version 0.02 is integration with the Ruby version of the
# CMU Link Grammar Parser by Martin Chase. If you have the LinkParser module
# installed, you can create linkages from English sentences that let you query for
# parts of speech:
# 
#    # Test to see whether or not the link parser is loaded.
#    Linguistics::EN.has_link_parser?
#    # => true
#    
#    # Diagram the first linkage for a test sentence
#    puts "he is a big dog".sentence.linkages.first.to_s
#    #     +---O*---+ 
#    #     | +--Ds--+ 
#    #  +Ss+ |  +-A-+ 
#    #  |  | |  |   | 
#    # he is a big dog
#    
#    # Find the verb in the sentence
#    "he is a big dog".en.sentence.verb.to_s      
#    # => "is"
#    
#    # Combined infinitive + LinkParser: Find the infinitive form of the verb of the
#    # given sentence.
#    "he is a big dog".en.sentence.verb.infinitive
#    # => "be"
#    
#    # Find the direct object of the sentence
#    "he is a big dog".en.sentence.object.to_s
#    # => "dog"
#    
#    # Look at the raw LinkParser::Word for the direct object of the sentence.
#    "he is a big dog".en.sentence.object     
#    # => #<LinkParser::Word:0x403da0a0 @definition=[[{@A-}, Ds-, {@M+}, J-], [{@A-},
#    #    Ds-, {@M+}, Os-], [{@A-}, Ds-, {@M+}, Ss+, {@CO-}, {C-}], [{@A-}, Ds-, {@M+},
#    #    Ss+, R-], [{@A-}, Ds-, {@M+}, SIs-], [{@A-}, Ds-, {R+}, {Bs+}, J-], [{@A-}, Ds-,
#    #    {R+}, {Bs+}, Os-], [{@A-}, Ds-, {R+}, {Bs+}, Ss+, {@CO-}, {C-}], [{@A-}, Ds-,
#    #    {R+}, {Bs+}, Ss+, R-], [{@A-}, Ds-, {R+}, {Bs+}, SIs-]], @right=[], @suffix="",
#    #    @left=[#<LinkParser::Connection:0x403da028 @rword=#<LinkParser::Word:0x403da0a0
#    #    ...>, @lword=#<LinkParser::Word:0x403da0b4 @definition=[[Ss-, O+, {@MV+}], [Ss-,
#    #    B-, {@MV+}], [Ss-, P+], [Ss-, AF-], [RS-, Bs-, O+, {@MV+}], [RS-, Bs-, B-,
#    #    {@MV+}], [RS-, Bs-, P+], [RS-, Bs-, AF-], [{Q-}, SIs+, O+, {@MV+}], [{Q-}, SIs+,
#    #    B-, {@MV+}], [{Q-}, SIs+, P+], [{Q-}, SIs+, AF-]],
#    #    @right=[#<LinkParser::Connection:0x403da028 ...>], @suffix="", @left=[],
#    #    @name="is", @position=1>, @subName="*", @name="O", @length=3>], @name="dog",
#    #    @position=4>
#    
#    # Combine WordNet + LinkParser to find the definition of the direct object of
#    # the sentence
#    "he is a big dog".en.sentence.object.gloss
#    # => "a member of the genus Canis (probably descended from the common wolf) that
#    #    has been domesticated by man since prehistoric times; occurs in many breeds;
#    #    \"the dog barked all night\""
# 
# 
module Linguistics::EN

	# Add 'english' to the list of default languages
	Linguistics.register_language( :en, self )

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
		Linguistics.log.debug "Registered English extension %p" % [ mod ]
		include( mod )
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


	### Add an lprintf formatter that will use the specified +callback+ method.
	### @param [#to_s] name         the name of the formatter, i.e., the 
	###                             placeholder that will be used in the
	###                             format string.
	### @param [#to_proc] callback  the method to call on the english-language
	###                             inflector for the lprintf argument
	### @example Using a Symbol
	###    def plural( count=2 )
	###      # return the plural of the inflected object
	###    end
	###    Linguistics::EN.register_lprintf_formatter :PL, :plural
	###
	### @example Using a Method
	###    Linguistics::EN.register_lprintf_formatter :PL, method( :plural )
	###
	### @example Using a block
	###    Linguistics::EN.register_lprintf_formatter :PL do |obj|
	###      obj.en.plural
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
		return self.obj.to_s.gsub( /%([A-Z_]+)/ ) do |match|
			op = $1.to_s.upcase.to_sym
			if (( callback = Linguistics::EN.lprintf_formatters[op] ))
				arg = args.shift
				callback.call( arg.en )
			else
				raise "no such formatter %p" % [ op ]
			end
		end
	end

end # module Linguistics::EN


# Load in the secondary modules and add them to Linguistics::EN.
$LOAD_PATH.each do |prefix|
	pat = Pathname( prefix ) + 'linguistics/en/**/*.rb'
	Dir.glob( pat.to_s ).each do |extension|

		next if extension =~ /_spec.rb/

		Linguistics.log.debug "  trying to load English extension %p" % [ extension ]
		begin
			require extension
		rescue LoadError => err
			Linguistics.log.debug "    failed (%s): %s %s" %
				[ err.class.name, err.message, err.backtrace.first ]
		else
			Linguistics.log.debug "    success."
		end
	end
end




