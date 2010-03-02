#!/usr/bin/ruby

require 'pathname'
require 'linguistics'

# This module is a container for various English-language linguistic
# functions for the Linguistics library. It can be either loaded
# directly, or by passing some variant of 'en' or 'eng' to the
# Linguistics.use method.
# 
# == Indefinite Articles
#
# Pronunciation-based "a"/"an" selection is provided for all English words, and
# most initialisms.
#
# See: #a, #an, and #no.
#
# == Numbers to Words
#
# Conversion from Numeric values to words are supported using the American
# "thousands" system. E.g., 2561 => "two thousand, five hundred and sixty-one".
#
# See the #numwords method.
#
# == Ordinals
#
# It is also possible to inflect numerals (1,2,3) and number words ("one",
# "two", "three") to ordinals (1st, 2nd, 3rd) and ordinates ("first", "second",
# "third").
#
# == Conjunctions
#
# This module also supports the creation of English conjunctions from Arrays of
# Strings or objects which respond to the #to_s message. Eg.,
#
#   %w{cow pig chicken cow dog cow duck duck moose}.en.conjunction
#     ==> "three cows, two ducks, a pig, a chicken, a dog, and a moose"
#
# == Infinitives
#
# Returns the infinitive form of English verbs:
#
#  "dodging".en.infinitive
#    ==> "dodge"
#
# == Version
#
#  $Id: en.rb 99 2008-09-06 05:20:07Z deveiant $
# 
# == Authors
# 
# * Michael Granger <ged@FaerieMUD.org>
# 
# :include: LICENSE
#
#--
#
# Please see the file LICENSE in the base directory for licensing details.
#
module Linguistics::EN

	# Add 'english' to the list of default languages
	Linguistics::register_language( :en, self )

	# The list of loaded modules
	MODULES = []


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


	# Load in the secondary modules and add them to Linguistics::EN.
	$LOAD_PATH.each do |prefix|
		pat = Pathname( prefix ) + 'linguistics/en/**/*.rb'
		Dir.glob( pat.to_s ).each do |extension|
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

	include( *MODULES )


	#################################################################
	###	C O N S T A N T S
	#################################################################

	# :stopdoc:


	#
	# Numerals, ordinals, and numbers-to-words
	#

	# Numerical inflections
	Nth = {
		0 => 'th',
		1 => 'st',
		2 => 'nd',
		3 => 'rd',
		4 => 'th',
		5 => 'th',
		6 => 'th',
		7 => 'th',
		8 => 'th',
		9 => 'th',
		11 => 'th',
		12 => 'th',
		13 => 'th',
	}

	# Ordinal word parts
	Ordinals = {
		'ty' => 'tieth',
		'one' => 'first',
		'two' => 'second',
		'three' => 'third',
		'five' => 'fifth',
		'eight' => 'eighth',
		'nine' => 'ninth',
		'twelve' => 'twelfth',
	}
	OrdinalSuffixes = Ordinals.keys.join("|") + "|"
	Ordinals[""] = 'th'

	# Numeral names
	Units = [''] + %w[one two three four five six seven eight nine]
	Teens = %w[ten eleven twelve thirteen fourteen
			  fifteen sixteen seventeen eighteen nineteen]
	Tens  = ['',''] + %w[twenty thirty forty fifty sixty seventy eighty ninety]
	Thousands = [' ', ' thousand'] + %w[
		m b tr quadr quint sext sept oct non dec undec duodec tredec
		quattuordec quindec sexdec septemdec octodec novemdec vigint
	].collect {|prefix| ' ' + prefix + 'illion'}

	# A collection of functions for transforming digits into word
	# phrases. Indexed by the number of digits being transformed; e.g.,
	# <tt>NumberToWordsFunctions[2]</tt> is the function for transforming
	# double-digit numbers.
	NumberToWordsFunctions = [
		proc {|*args| raise "No digits (#{args.inspect})"},

		# Single-digits
		proc {|zero,x|
			(x.nonzero? ? to_units(x) : "#{zero} ")
		},

		# Double-digits
		proc {|zero,x,y|
			if x.nonzero?
				to_tens( x, y )
			elsif y.nonzero?
				"#{zero} " + NumberToWordsFunctions[1].call( zero, y )
			else
				([zero] * 2).join(" ")
			end
		},

		# Triple-digits
		proc {|zero,x,y,z|
			NumberToWordsFunctions[1].call(zero,x) + 
			NumberToWordsFunctions[2].call(zero,y,z)
		}
	]


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
	A_explicit_an = Regexp.union( "euler", "hour(?!i)", "heir", "honest", "hono" )


	#
	# Configuration defaults
	#

	# Default configuration arguments for the #numwords function
	NumwordDefaults = {
		:group		=> 0,
		:comma		=> ', ',
		:and		=> ' and ',
		:zero		=> 'zero',
		:decimal	=> 'point',
		:asArray	=> false,
	}

	# Default ranges for #quantify
	SeveralRange = 2..5
	NumberRange = 6..19
	NumerousRange = 20..45
	ManyRange = 46..99

	# Default configuration arguments for the #quantify function
	QuantifyDefaults = {
		:joinword	=> " of ",
	}

	# Default configuration arguments for the #conjunction (junction, what's
	# your) function.
	ConjunctionDefaults = {
		:separator		=> ', ',
		:altsep			=> '; ',
		:penultimate	=> true,
		:conjunctive	=> 'and',
		:combine		=> true,
		:casefold		=> true,
		:generalize		=> false,
		:quantsort		=> true,
	}


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

	#################################################################
	###	" B A C K E N D "   F U N C T I O N S
	#################################################################


	###############
	module_function
	###############

	### Returns the given word with a prepended indefinite article, unless
	### +count+ is non-nil and not singular.
	def indef_article( word, count )
		count ||= Linguistics::num
		return "#{count} #{word}" if
			count && /^(#{PL_count_one})$/i !~ count.to_s

		# Handle user-defined variants
		# return value if value = ud_match( word, A_a_user_defined )

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


	### Transform the specified number of units-place numerals into a
	### word-phrase at the given number of +thousands+ places.
	def to_units( units, thousands=0 )
		return Units[ units ] + to_thousands( thousands )
	end


	### Transform the specified number of tens- and units-place numerals into a
	### word-phrase at the given number of +thousands+ places.
	def to_tens( tens, units, thousands=0 )
		unless tens == 1
			return Tens[ tens ] + ( tens.nonzero? && units.nonzero? ? '-' : '' ) +
				to_units( units, thousands )
		else
			return Teens[ units ] + to_thousands( thousands )
		end
	end


	### Transform the specified number of hundreds-, tens-, and units-place
	### numerals into a word phrase. If the number of thousands (+thousands+) is
	### greater than 0, it will be used to determine where the decimal point is
	### in relation to the hundreds-place number.
	def to_hundreds( hundreds, tens=0, units=0, thousands=0, joinword=" and " )
		joinword = ' ' if joinword.empty?
		if hundreds.nonzero?
			return to_units( hundreds ) + " hundred" +
				(tens.nonzero? || units.nonzero? ? joinword : '') +
				to_tens( tens, units ) +
				to_thousands( thousands )
		elsif tens.nonzero? || units.nonzero?
			return to_tens( tens, units ) + to_thousands( thousands )
		else
			return nil
		end
	end

	### Transform the specified number into one or more words like 'thousand',
	### 'million', etc. Uses the thousands (American) system.
	def to_thousands( thousands=0 )
		parts = []
		(0..thousands).step( Thousands.length - 1 ) {|i|
			if i.zero?
				parts.push Thousands[ thousands % (Thousands.length - 1) ]
			else
				parts.push Thousands.last
			end
		}

		return parts.join(" ")
	end


	### Return the specified number +num+ as an array of number phrases.
	def number_to_words( num, config )
		return [config[:zero]] if num.to_i.zero?
		chunks = []

		# Break into word-groups if groups is set
		if config[:group].nonzero?

			# Build a Regexp with <config[:group]> number of digits. Any past
			# the first are optional.
			re = Regexp::new( "(\\d)" + ("(\\d)?" * (config[:group] - 1)) )

			# Scan the string, and call the word-chunk function that deals with
			# chunks of the found number of digits.
			num.to_s.scan( re ) {|digits|
				Linguistics.log.debug "   digits = #{digits.inspect}"
				fn = NumberToWordsFunctions[ digits.nitems ]
				numerals = digits.flatten.compact.collect {|i| i.to_i}
				Linguistics.log.debug "   numerals = #{numerals.inspect}"
				chunks.push fn.call( config[:zero], *numerals ).strip
			}
		else
			phrase = num.to_s
			phrase.sub!( /\A\s*0+/, '' )
			mill = 0

			# Match backward from the end of the digits in the string, turning
			# chunks of three, of two, and of one into words.
			mill += 1 while
				phrase.sub!( /(\d)(\d)(\d)(?=\D*\Z)/ ) {
					words = to_hundreds( $1.to_i, $2.to_i, $3.to_i, mill, 
										 config[:and] )
					chunks.unshift words.strip.squeeze(' ') unless words.nil?
					''
				}

			phrase.sub!( /(\d)(\d)(?=\D*\Z)/ ) {
				chunks.unshift to_tens( $1.to_i, $2.to_i, mill ).strip.squeeze(' ')
				''
			}
			phrase.sub!( /(\d)(?=\D*\Z)/ ) {
				chunks.unshift to_units( $1.to_i, mill ).strip.squeeze(' ')
				''
			}
		end

		return chunks
	end


	#################################################################
	###	P U B L I C   F U N C T I O N S
	#################################################################

	### Return the name of the language this module is for.
	def language( unused=nil )
		"English"
	end


	### Return the given phrase with the appropriate indefinite article ("a" or
	### "an") prepended. 
	def a( phrase, count=nil )
		md = /\A(\s*)(.+?)(\s*)\Z/.match( phrase.to_s )
		pre, word, post = md.to_a[1,3]
		return phrase if word.nil? or word.empty?

		result = indef_article( word, count )
		return pre + result + post
	end
	alias_method :an, :a
	Linguistics::EN.register_lprintf_formatter :A, self.method( :a )
	Linguistics::EN.register_lprintf_formatter :AN, self.method( :a )


	### Translate zero-quantified +phrase+ to "no +phrase.plural+"
	def no( phrase, count=nil )
		md = /\A(\s*)(.+?)(\s*)\Z/.match( phrase.to_s )
		pre, word, post = md.to_a[1,3]
		count ||= Linguistics::num || 0

		unless /^#{PL_count_zero}$/ =~ count.to_s
			return "#{pre}#{count} " + plural( word, count ) + post
		else
			return "#{pre}no " + plural( word, 0 ) + post
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



	### Return the specified number as english words. One or more configuration
	### values may be passed to control the returned String:
	### 
	### [<b>:group</b>]
	###   Controls how many numbers at a time are grouped together. Valid values
	###   are <code>0</code> (normal grouping), <code>1</code> (single-digit 
	###   grouping, e.g., "one, two, three, four"), <code>2</code> 
	###   (double-digit grouping, e.g., "twelve, thirty-four", or <code>3</code>
	###   (triple-digit grouping, e.g., "one twenty-three, four").
	### [<b>:comma</b>]
	###   Set the character/s used to separate word groups. Defaults to 
	###   <code>", "</code>.
	### [<b>:and</b>]
	###   Set the word and/or characters used where <code>' and ' </code>(the 
	###   default) is normally used. Setting <code>:and</code> to 
	###   <code>' '</code>, for example, will cause <code>2556</code> to be 
	###   returned as "two-thousand, five hundred fifty-six" instead of 
	###   "two-thousand, five hundred and fifty-six".
	### [<b>:zero</b>]
	###   Set the word used to represent the numeral <code>0</code> in the 
	###   result. <code>'zero'</code> is the default.
	### [<b>:decimal</b>]
	###   Set the translation of any decimal points in the number; the default
	###   is <code>'point'</code>.
	### [<b>:asArray</b>]
	###   If set to a true value, the number will be returned as an array of
	###   word groups instead of a String.
	def numwords( number, hashargs={} )
		num = number.to_s
		config = NumwordDefaults.merge( hashargs )
		raise "Bad chunking option: #{config[:group]}" unless
			config[:group].between?( 0, 3 )

		# Array of number parts: first is everything to the left of the first
		# decimal, followed by any groups of decimal-delimted numbers after that
		parts = []

		# Wordify any sign prefix
		sign = (/\A\s*\+/ =~ num) ? 'plus' : (/\A\s*\-/ =~ num) ? 'minus' : ''

		# Strip any ordinal suffixes
		ord = true if num.sub!( /(st|nd|rd|th)\Z/, '' )

		# Split the number into chunks delimited by '.'
		chunks = if !config[:decimal].empty? then
					 if config[:group].nonzero?
						 num.split(/\./)
					 else
						 num.split(/\./, 2)
					 end
				 else
					 [ num ]
				 end

		# Wordify each chunk, pushing arrays into the parts array
		chunks.each_with_index {|chunk,section|
			chunk.gsub!( /\D+/, '' )

			# If there's nothing in this chunk of the number, set it to zero
			# unless it's the whole-number part, in which case just push an
			# empty array.
			if chunk.empty?
				if section.zero?
					parts.push []
					next
				end
			end

			# Split the number section into wordified parts unless this is the
			# second or succeeding part of a non-group number
			unless config[:group].zero? && section.nonzero?
				parts.push number_to_words( chunk, config )
			else
				parts.push number_to_words( chunk, config.merge(:group => 1) )
			end
		}

		Linguistics.log.debug "Parts => #{parts.inspect}"

		# Turn the last word of the whole-number part back into an ordinal if
		# the original number came in that way.
		if ord && !parts[0].empty?
			parts[0][-1] = ordinal( parts[0].last )
		end

		# If the caller's expecting an Array return, just flatten and return the
		# parts array.
		if config[:asArray]
			unless sign.empty?
				parts[0].unshift( sign )
			end
			return parts.flatten
		end

		# Catenate each sub-parts array into a whole number part and one or more
		# post-decimal parts. If grouping is turned on, all sub-parts get joined
		# with commas, otherwise just the whole-number part is.
		if config[:group].zero?
			if parts[0].length > 1

				# Join all but the last part together with commas
				wholenum = parts[0][0...-1].join( config[:comma] )

				# If the last part is just a single word, append it to the
				# wholenum part with an 'and'. This is to get things like 'three
				# thousand and three' instead of 'three thousand, three'.
				if /^\s*(\S+)\s*$/ =~ parts[0].last
					wholenum += config[:and] + parts[0].last
				else
					wholenum += config[:comma] + parts[0].last
				end
			else
				wholenum = parts[0][0]
			end
			decimals = parts[1..-1].collect {|part| part.join(" ")}

			Linguistics.log.debug "Wholenum: #{wholenum.inspect}; decimals: #{decimals.inspect}"

			# Join with the configured decimal; if it's empty, just join with
			# spaces.
			unless config[:decimal].empty?
				return sign + ([ wholenum ] + decimals).
					join( " #{config[:decimal]} " ).strip
			else
				return sign + ([ wholenum ] + decimals).
					join( " " ).strip
			end
		else
			return parts.compact.
				separate( config[:decimal] ).
				delete_if {|el| el.empty?}.
				join( config[:comma] ).
				strip
		end
	end
	Linguistics::EN.register_lprintf_formatter :NUMWORDS, :numwords


	### Transform the given +number+ into an ordinal word. The +number+ object
	### can be either an Integer or a String.
	def ordinal( number )
		case number
		when Integer
			return number.to_s + (Nth[ number % 100 ] || Nth[ number % 10 ])

		else
			return number.to_s.sub( /(#{OrdinalSuffixes})\Z/ ) { Ordinals[$1] }
		end
	end
	Linguistics::EN.register_lprintf_formatter :ORD, :ordinal


	### Transform the given +number+ into an ordinate word.
	def ordinate( number )
		numwords( number ).ordinal
	end


	### Return a phrase describing the specified +number+ of objects in the
	### given +phrase+ in general terms. The following options can be used to 
	### control the makeup of the returned quantity String:
	### 
    ### [<b>:joinword</b>]
    ###   Sets the word (and any surrounding spaces) used as the word separating the
    ###   quantity from the noun in the resulting string. Defaults to <tt>' of
    ###   '</tt>.
	def quantify( phrase, number=0, args={} )
		num = number.to_i
		config = QuantifyDefaults.merge( args )

		case num
		when 0
			no( phrase )
		when 1
			a( phrase )
		when SeveralRange
			"several " + plural( phrase, num )
		when NumberRange
			"a number of " + plural( phrase, num )
		when NumerousRange
			"numerous " + plural( phrase, num )
		when ManyRange
			"many " + plural( phrase, num )
		else

			# Anything bigger than the ManyRange gets described like
			# "hundreds of thousands of..." or "millions of..."
			# depending, of course, on how many there are.
			thousands, subthousands = Math::log10( num ).to_i.divmod( 3 )
			stword =
				case subthousands
				when 2
					"hundreds"
				when 1
					"tens"
				else
					nil
				end
			thword = plural( to_thousands(thousands).strip )
			thword = nil if thword.empty?

			[	# Hundreds (of)...
				stword,

				# thousands (of)
				thword,

				# stars.
				plural(phrase, number)
			].compact.join( config[:joinword] )
		end
	end
	Linguistics::EN.register_lprintf_formatter :QUANT, :quantify


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

