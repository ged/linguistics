#!/usr/bin/ruby

require 'linguistics/en' unless defined?( Linguistics::EN )

# Numeric methods for the English-language Linguistics module.
module Linguistics::EN::Numbers

	# Register this module to the list of modules to include
	Linguistics::EN.register_extension( self )

	#
	# Numerals, ordinals, and numbers-to-words
	#

	# Default configuration arguments for the #numwords function
	NUMWORD_DEFAULTS = {
		:group		=> 0,
		:comma		=> ', ',
		:and		=> ' and ',
		:zero		=> 'zero',
		:decimal	=> 'point',
		:asArray	=> false,
	}

	# Default configuration arguments for the #quantify function
	QUANTIFY_DEFAULTS = {
		:joinword	=> " of ",
	}

	# Default ranges for #quantify
	SEVERAL_RANGE = 2..5
	NUMBER_RANGE = 6..19
	NUMEROUS_RANGE = 20..45
	MANY_RANGE = 46..99

	# Numerical inflections
	NTH = {
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
	ORDINALS = {
		'ty'     => 'tieth',
		'one'    => 'first',
		'two'    => 'second',
		'three'  => 'third',
		'five'   => 'fifth',
		'eight'  => 'eighth',
		'nine'   => 'ninth',
		'twelve' => 'twelfth',
	}
	ORDINAL_SUFFIXES = ORDINALS.keys.join("|") + "|"
	ORDINALS[""] = 'th'

	# Numeral names
	UNITS = [''] + %w[one two three four five six seven eight nine]
	TEENS = %w[ten eleven twelve thirteen fourteen
			  fifteen sixteen seventeen eighteen nineteen]
	TENS  = ['',''] + %w[twenty thirty forty fifty sixty seventy eighty ninety]
	THOUSANDS = [' ', ' thousand'] + %w[
		m b tr quadr quint sext sept oct non dec undec duodec tredec
		quattuordec quindec sexdec septemdec octodec novemdec vigint
	].collect {|prefix| ' ' + prefix + 'illion'}


	# A collection of functions for transforming digits into word
	# phrases. Indexed by the number of digits being transformed; e.g.,
	# <tt>NUMBER_TO_WORDS_FUNCTIONS[2]</tt> is the function for transforming
	# double-digit numbers.
	NUMBER_TO_WORDS_FUNCTIONS = [
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
				"#{zero} " + NUMBER_TO_WORDS_FUNCTIONS[1].call( zero, y )
			else
				([zero] * 2).join(" ")
			end
		},

		# Triple-digits
		proc {|zero,x,y,z|
			NUMBER_TO_WORDS_FUNCTIONS[1].call(zero,x) +
			NUMBER_TO_WORDS_FUNCTIONS[2].call(zero,y,z)
		}
	]


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
	### [<b>:as_array</b>]
	###   If set to a true value, the number will be returned as an array of
	###   word groups instead of a String.
	def numwords( hashargs={} )
		num = self.to_s
		self.log.debug "Turning %p into number words..." % [ num ]
		config = NUMWORD_DEFAULTS.merge( hashargs )
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
		chunks.each_with_index do |chunk,section|
			chunk.gsub!( /\D+/, '' )
			self.log.debug "  working on chunk %p (section %d)" % [ chunk, section ]

			# If there's nothing in this chunk of the number, set it to zero
			# unless it's the whole-number part, in which case just push an
			# empty array.
			if chunk.empty?
				self.log.debug "  chunk is empty..."
				if section.zero?
					self.log.debug "  skipping the empty whole-number part"
					parts.push []
					next
				end
			end

			# Split the number section into wordified parts unless this is the
			# second or succeeding part of a non-group number
			unless config[:group].zero? && section.nonzero?
				parts.push number_to_words( chunk, config )
				self.log.debug "  added %p" % [ parts.last ]
			else
				parts.push number_to_words( chunk, config.merge(:group => 1) )
				self.log.debug "  added %p" % [ parts.last ]
			end
		end

		self.log.debug "Parts => %p" % [ parts ]

		# Turn the last word of the whole-number part back into an ordinal if
		# the original number came in that way.
		if ord && !parts[0].empty?
			self.log.debug "  turning the last whole-number part back into an ordinal, since it " +
				"came in that way"
			parts[0][-1] = ordinal( parts[0].last )
		end

		# If the caller's expecting an Array return, just flatten and return the
		# parts array.
		if config[:as_array]
			self.log.debug "  returning the number parts as an Array"
			unless sign.empty?
				parts[0].unshift( sign )
			end
			return parts.flatten
		end

		# Catenate each sub-parts array into a whole number part and one or more
		# post-decimal parts. If grouping is turned on, all sub-parts get joined
		# with commas, otherwise just the whole-number part is.
		if config[:group].zero?
			self.log.debug "  no custom grouping"
			if parts[0].length > 1
				self.log.debug "  whole and decimal part; working on the whole number first"

				# Join all but the last part together with commas
				wholenum = parts[0][0...-1].join( config[:comma] )

				# If the last part is just a single word, append it to the
				# wholenum part with an 'and'. This is to get things like 'three
				# thousand and three' instead of 'three thousand, three'.
				if /^\s*(\S+)\s*$/ =~ parts[0].last
					self.log.debug "last word is a single word; using the 'and' separator: %p" %
						[ config[:and] ]
					wholenum += config[:and] + parts[0].last
				else
					self.log.debug "last word has multiple words; using the comma separator: %p" %
						[ config[:comma] ]
					wholenum += config[:comma] + parts[0].last
				end
			else
				self.log.debug "  non-decimal."
				wholenum = parts[0][0]
			end

			decimals = parts[1..-1].collect {|part| part.join(" ")}
			self.log.debug "  wholenum: %p; decimals: %p" % [ wholenum, decimals ]

			# Join with the configured decimal; if it's empty, just join with
			# spaces.
			unless config[:decimal].empty?
				self.log.debug "  joining with the configured decimal: %p" % [ config[:decimal] ]
				return sign + ([ wholenum ] + decimals).
					join( " #{config[:decimal]} " ).strip
			else
				self.log.debug "  joining with the spaces since no decimal is configured"
				return sign + ([ wholenum ] + decimals).
					join( " " ).strip
			end

		else
			self.log.debug "  grouping with decimal %p and comma %p" %
				config.values_at( :decimal, :comma )
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
	def ordinal
		if self.respond_to?( :to_int )
			number = self.to_int
			return "%d%s" % [ number, (NTH[ number % 100 ] || NTH[ number % 10 ]) ]

		else
			number = self.to_s
			self.log.debug "Making an ordinal out of a non-Integer (%p)" % [ number ]
			return number.sub( /(#{ORDINAL_SUFFIXES})\Z/ ) { ORDINALS[$1] }
		end
	end
	Linguistics::EN.register_lprintf_formatter :ORD, :ordinal


	### Transform the given +number+ into an ordinate word.
	def ordinate
		return self.numwords.en.ordinal
	end


	### Return a phrase describing the specified +number+ of objects in the
	### inflected object in general terms. The following options can be used to
	### control the makeup of the returned quantity String:
	###
    ### [<b>:joinword</b>]
    ###   Sets the word (and any surrounding spaces) used as the word separating the
    ###   quantity from the noun in the resulting string. Defaults to <tt>' of
    ###   '</tt>.
	def quantify( number=0, args={} )
		phrase = self.to_s
		self.log.debug "Quantifying %d instances of %p" % [ number, phrase ]

		num = number.to_i
		config = QUANTIFY_DEFAULTS.merge( args )

		case num
		when 0
			phrase.en.no
		when 1
			phrase.en.a
		when SEVERAL_RANGE
			"several " + phrase.en.plural( num )
		when NUMBER_RANGE
			"a number of " + phrase.en.plural( num )
		when NUMEROUS_RANGE
			"numerous " + phrase.en.plural( num )
		when MANY_RANGE
			"many " + phrase.en.plural( num )
		else

			# Anything bigger than the MANY_RANGE gets described like
			# "hundreds of thousands of..." or "millions of..."
			# depending, of course, on how many there are.
			thousands, subthousands = Math::log10( num ).to_i.divmod( 3 )
			self.log.debug "thousands = %p, subthousands = %p" % [ thousands, subthousands ]

			stword =
				case subthousands
				when 2
					"hundreds"
				when 1
					"tens"
				else
					nil
				end

			unless thousands.zero?
				thword = to_thousands( thousands ).strip.en.plural
			end

			[	# Hundreds (of)...
				stword,

				# thousands (of)
				thword,

				# stars.
				phrase.en.plural(number)
			].compact.join( config[:joinword] )
		end
	end
	Linguistics::EN.register_lprintf_formatter :QUANT, :quantify


	###############
	module_function
	###############

	### Transform the specified number of units-place numerals into a
	### word-phrase at the given number of +thousands+ places.
	def to_units( units, thousands=0 )
		return UNITS[ units ] + to_thousands( thousands )
	end


	### Transform the specified number of tens- and units-place numerals into a
	### word-phrase at the given number of +thousands+ places.
	def to_tens( tens, units, thousands=0 )
		raise ArgumentError, "tens: no implicit conversion from nil" unless tens
		raise ArgumentError, "units: no implicit conversion from nil" unless units

		unless tens == 1
			return TENS[ tens ] + ( tens.nonzero? && units.nonzero? ? '-' : '' ) +
				to_units( units, thousands )
		else
			return TEENS[ units ] + to_thousands( thousands )
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
		(0..thousands).step( THOUSANDS.length - 1 ) {|i|
			if i.zero?
				parts.push THOUSANDS[ thousands % (THOUSANDS.length - 1) ]
			else
				parts.push THOUSANDS.last
			end
		}

		return parts.join(" ")
	end


	### Return the specified number +number+ as an array of number phrases.
	def number_to_words( number, config )
		return [config[:zero]] if number.to_i.zero?

		if config[:group].nonzero? then
			return number_to_custom_word_groups( number, config[:group], config[:zero] )
		else
			return number_to_standard_word_groups( number, config[:and] )
		end
	end


	### Split the given +number+ up into groups of +groupsize+ and return
	### them as an Array of words. Use +zeroword+ for any occurences of '0'.
	def number_to_custom_word_groups( number, groupsize, zeroword="zero" )
		self.log.debug "Making custom word groups of %d digits out of %p" % [ groupsize, number ]

		# Build a Regexp with <config[:group]> number of digits. Any past
		# the first are optional.
		re = Regexp.new( "(\\d)" + ("(\\d)?" * (groupsize - 1)) )
		self.log.debug "  regex for matching groups of %d digits is %p" % [ groupsize, re ]

		# Scan the string, and call the word-chunk function that deals with
		# chunks of the found number of digits.
		return number.to_s.scan( re ).collect do |digits|
			self.log.debug "   digits = %p" % [ digits ]
			numerals = digits.flatten.compact.collect {|i| i.to_i}
			self.log.debug "   numerals = %p" % [ numerals ]

			fn = NUMBER_TO_WORDS_FUNCTIONS[ numerals.length ]
			self.log.debug "  number to word function is #%d: %p" % [ numerals.length, fn ]
			fn.call( zeroword, *numerals ).strip
		end
	end


	### Split the given +number+ up into groups of three and return
	### the Array of words describing each group in the standard style.
	def number_to_standard_word_groups( number, andword="and" )
		phrase = number.to_s
		phrase.sub!( /\A\s*0+/, '' )
		chunks = []
		mill = 0
		self.log.debug "Making standard word groups out of %p" % [ phrase ]

		# Match backward from the end of the digits in the string, turning
		# chunks of three, of two, and of one into words.
		mill += 1 while
			phrase.sub!( /(\d)(\d)(\d)(?=\D*\Z)/ ) do
				words = to_hundreds( $1.to_i, $2.to_i, $3.to_i, mill, andword )
				chunks.unshift words.strip.squeeze(' ') unless words.nil?
				''
			end

		phrase.sub!( /(\d)(\d)(?=\D*\Z)/ ) do
			chunks.unshift to_tens( $1.to_i, $2.to_i, mill ).strip.squeeze(' ')
			''
		end

		phrase.sub!( /(\d)(?=\D*\Z)/ ) do
			chunks.unshift to_units( $1.to_i, mill ).strip.squeeze(' ')
			''
		end

		return chunks
	end


end # module Linguistics::EN::Numbers

