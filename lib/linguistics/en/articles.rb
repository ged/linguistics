#!/usr/bin/ruby

require 'linguistics/en' unless defined?( Linguistics::EN )

# Indefinite article methods for the English-language Linguistics module.
module Linguistics::EN::Articles

	# Register this module to the list of modules to include
	Linguistics::EN.register_extension( self )


	# This pattern matches strings of capitals starting with a "vowel-sound"
	# consonant followed by another consonant, and which are not likely
	# to be real words (oh, all right then, it's just magic!)
	A_abbrev = %r{
		^(
			(?!
				FJO       |
				[HLMNS]Y. |
				RY[EO]    |
				SQU       |
				(
					F[LR]?         |
					[HL]           |
					MN?            |
					N              |
					RH?            |
					S[CHKLMNPTVW]? |
					X(YL)?
				) [AEIOU]
			)
		[FHLMNRSX][A-Z]
		)
	}x

	# This pattern codes the beginnings of all english words begining with a
	# 'y' followed by a consonant. Any other y-consonant prefix therefore
	# implies an abbreviation.
	A_y_cons = %r{^(y(?:b[lor]|cl[ea]|fere|gg|p[ios]|rou|tt))}i

	# Exceptions to exceptions
	A_explicit_an = Regexp.union( /euler/i, /hour(?!i)/i, /heir/i, /honest/i, /hono/i )

	# Words which always indicate zero quantity
	PL_count_zero = Regexp.union( "0", "no", "zero", "nil" )


	### Returns the given word with a prepended indefinite article, unless
	### +count+ is non-nil and not singular.
	def indef_article( count=nil )
		word = self.to_s

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
		when A_abbrev
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
		when A_y_cons
			return "an #{word}"

		# Otherwise, guess "a"
		else
			return "a #{word}"
		end
	end


	### Return the inflected phrase with the appropriate indefinite article ("a" or
	### "an") prepended.
	def a( count=nil )
		count ||= 1
		phrase = self.to_s

		md = /\A(\s*)(.+?)(\s*)\Z/.match( phrase )
		pre, word, post = md.to_a[1,3]
		return phrase if word.nil? or word.empty?

		result = word.en.indef_article
		return pre + result + post
	end
	alias_method :an, :a
	Linguistics::EN.register_lprintf_formatter :A, :a
	Linguistics::EN.register_lprintf_formatter :AN, :a


	### Translate zero-quantified +phrase+ to "no +phrase.plural+"
	def no( count=nil )
		phrase = self.to_s
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

end # module Linguistics::EN::Articles

