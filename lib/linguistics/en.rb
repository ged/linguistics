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
# New in version 0.02:
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
# == WordNet® Integration
# 
# Also new in version 0.02, if you have the Ruby-WordNet module installed, you can
# look up WordNet synsets using the Linguistics interface:
# 
#    # Test to be sure the WordNet module loaded okay.
#    Linguistics::EN.has_wordnet?
#    # => true
#    
#    # Fetch the default synset for the word "balance"
#    "balance".synset
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


	### Debugging output
	def self::debug_msg( *msgs ) # :nodoc:
		$stderr.puts msgs.join(" ") if $DEBUG
	end


	### Add the specified method (which can be either a Method object or a
	### Symbol for looking up a method)
	def self::register_lprintf_formatter( name, meth )
		@@lprintf_formatters[ name ] = meth
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
	###	C O N S T A N T S
	#################################################################

	# :stopdoc:


	#
	# Indefinite Articles
	#

	# This pattern matches strings of capitals starting with a "vowel-sound"
	# consonant followed by another consonant, and which are not likely
	# to be real words (oh, all right then, it's just magic!)
	A_abbrev = %{
		(?! FJO | [HLMNS]Y.  | RY[EO] | SQU
		  | ( F[LR]? | [HL] | MN? | N | RH? | S[CHKLMNPTVW]? | X(YL)?) [AEIOU])
		[FHLMNRSX][A-Z]
	}

	# This pattern codes the beginnings of all english words begining with a
	# 'y' followed by a consonant. Any other y-consonant prefix therefore
	# implies an abbreviation.
	A_y_cons = 'y(b[lor]|cl[ea]|fere|gg|p[ios]|rou|tt)'

	# Exceptions to exceptions
	A_explicit_an = Regexp.union( "euler", /hour(?!i)/, "heir", "honest", "hono" )


	#
	# Configuration defaults
	#


	#
	# Title case
	#

	# "In titles, capitalize the first word, the last word, and all words in
	# between except articles (a, an, and the), prepositions under five letters
	# (in, of, to), and coordinating conjunctions (and, but). These rules apply
	# to titles of long, short, and partial works as well as your own papers"
	# (Anson, Schwegler, and Muth. The Longman Writer's Companion 240).

	# Build the list of exceptions to title-capitalization
	Articles = %w[a and the]
	ShortPrepositions = ["amid", "at", "but", "by", "down", "from", "in",
		"into", "like", "near", "of", "off", "on", "onto", "out", "over",
		"past", "save", "with", "till", "to", "unto", "up", "upon", "with"]
	CoordConjunctions = %w[and but as]
	TitleCaseExceptions = Articles | ShortPrepositions | CoordConjunctions


	# :startdoc:

	### Returns the given word with a prepended indefinite article, unless
	### +count+ is non-nil and not singular.
	def indef_article( count=nil )
		word = self.obj.to_s

		self.log.debug "Fetching the indefinite article for %p (count = %p)" % [ word, count ]
		return "#{count} #{word}" if
			count && /^(#{PL_count_one})$/i !~ count.to_s

		# Handle user-defined variants
		# return value if value = ud_match( word, A_a_user_defined )

		self.log.debug "  count wasn't a definite singular countword"
		case word

		# Handle special cases
		when /^(#{A_explicit_an})/i
			return "an #{word}"

		# Handle abbreviations
		when /^(#{A_abbrev})/x
			return "an #{word}"
		when /^[aefhilmnorsx][.-]/i
			return "an #{word}"
		when /^[a-z][.-]/i
			return "a #{word}"

		# Handle consonants
		when /^[^aeiouy]/i
			return "a #{word}"

		# Handle special vowel-forms
		when /^e[uw]/i
			return "a #{word}"
		when /^onc?e\b/i
			return "a #{word}"
		when /^uni([^nmd]|mo)/i
			return "a #{word}"
		when /^u[bcfhjkqrst][aeiou]/i
			return "a #{word}"

		# Handle vowels
		when /^[aeiou]/i
			return "an #{word}"

		# Handle y... (before certain consonants implies (unnaturalized) "i.." sound)
		when /^(#{A_y_cons})/i
			return "an #{word}"

		# Otherwise, guess "a"
		else
			return "a #{word}"
		end
	end


	#################################################################
	###	P U B L I C   F U N C T I O N S
	#################################################################

	### Return the name of the language this module is for.
	def language( unused=nil )
		"English"
	end


	### Return the inflected phrase with the appropriate indefinite article ("a" or
	### "an") prepended. 
	def a( count=nil )
		count ||= 1
		phrase = self.obj.to_s

		md = /\A(\s*)(.+?)(\s*)\Z/.match( phrase )
		pre, word, post = md.to_a[1,3]
		return phrase if word.nil? or word.empty?

		result = word.en.indef_article
		return pre + result + post
	end
	alias_method :an, :a
	Linguistics::EN.register_lprintf_formatter :A, self.instance_method( :a )
	Linguistics::EN.register_lprintf_formatter :AN, self.instance_method( :a )


	### Translate zero-quantified +phrase+ to "no +phrase.plural+"
	def no( count=nil )
		phrase = self.obj.to_s
		md = /\A(\s*)(.+?)(\s*)\Z/.match( phrase )
		pre, word, post = md.to_a[1,3]
		count ||= 0

		unless /^#{PL_count_zero}$/ =~ count.to_s
			return "#{pre}#{count} " + plural( word, count ) + post
		else
			return "#{pre}no " + word.en.plural( 0 ) + post
		end
	end
	Linguistics::EN.register_lprintf_formatter :NO, :no


	### Participles
	def present_participle( word )
        plural = plural_verb( word.to_s, 2 )

		plural.sub!( /ie$/, 'y' ) or
			plural.sub!( /ue$/, 'u' ) or
			plural.sub!( /([auy])e$/, '$1' ) or
			plural.sub!( /i$/, '' ) or
			plural.sub!( /([^e])e$/, "\\1" ) or
			/er$/.match( plural ) or
			plural.sub!( /([^aeiou][aeiouy]([bdgmnprst]))$/, "\\1\\2" )

        return "#{plural}ing"
	end
	alias_method :part_pres, :present_participle
	Linguistics::EN.register_lprintf_formatter :PART_PRES, :present_participle



### Split out stuff below here

	### Turns a camel-case +string+ ("camelCaseToEnglish") to plain English
	### ("camel case to english"). Each word is decapitalized.
	def camel_case_to_english( string )
		string.to_s.
			gsub( /([A-Z])([A-Z])/ ) { "#$1 #$2" }.
			gsub( /([a-z])([A-Z])/ ) { "#$1 #$2" }.downcase
	end


	### Turns an English language +string+ into a CamelCase word.
	def english_to_camel_case( string )
		string.to_s.gsub( /\s+([a-z])/ ) { $1.upcase }
	end


	### This method doesn't work quite right yet. It does okay for simple cases,
	### but it misses more complex ones, e.g. 'as' used as a coordinating
	### conjunction in "A Portrait of the Artist as a Young Man". Perhaps after
	### there's a working (non-leaking) LinkParser for Ruby, this can be fixed
	### up. Until then it'll just be undocumented.

	### Returns the given +string+ as a title-cased phrase.
	def titlecase( string ) # :nodoc:

		# Split on word-boundaries
		words = string.split( /\b/ )

		# Always capitalize the first and last words
		words.first.capitalize!
		words.last.capitalize!

		# Now scan the rest of the tokens, skipping non-words and capitalization
		# exceptions.
		words.each_with_index do |word, i|

			# Non-words
			next unless /^\w+$/.match( word )

			# Skip exception-words
			next if TitleCaseExceptions.include?( word )

			# Skip second parts of contractions
			next if words[i - 1] == "'" && /\w/.match( words[i - 2] )

			# Have to do it this way instead of capitalize! because that method
			# also downcases all other letters.
			word.gsub!( /^(\w)(.*)/ ) { $1.upcase + $2 }
		end

		return words.join
	end


	### Returns the proper noun form of a string by capitalizing most of the
	### words.
	###
	### Examples:
	###   English.proper_noun("bosnia and herzegovina") ->
	###     "Bosnia and Herzegovina"
	###   English.proper_noun("macedonia, the former yugoslav republic of") ->
	###     "Macedonia, the Former Yugoslav Republic of"
	###   English.proper_noun("virgin islands, u.s.") ->
	###     "Virgin Islands, U.S."
	def proper_noun( string )
		return string.split(/([ .]+)/).collect {|word|
			next word unless /^[a-z]/.match( word ) &&
				! (%w{and the of}.include?( word ))
			word.capitalize
		}.join
	end


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
	def lprintf( fmt, *args )
		fmt.to_s.gsub( /%([A-Z_]+)/ ) do |match|
			op = $1.to_s.upcase.to_sym
			if self.lprintf_formatters.key?( op )
				arg = args.shift
				self.lprintf_formatters[ op ].call( arg )
			else
				raise "no such formatter %p" % op
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




