#!/usr/bin/ruby

require 'linguistics/en' unless defined?( Linguistics::EN )

# This file contains functions for capitalizing a sentence as a title and nouns as
# proper nouns, as well as functions for turning a sentence into its equivalent
# CamelCaseSentence and vice-versa.
module Linguistics::EN::TitleCase

	# Register this module to the list of modules to include
	Linguistics::EN.register_extension( self )


	# Exceptions: Indefinite articles
	ARTICLES = %w[a and the]

	# Exceptions: Prepositions shorter than five letters
	SHORT_PREPOSITIONS = ["amid", "at", "but", "by", "down", "for", "from", "in",
		"into", "like", "near", "of", "off", "on", "onto", "out", "over",
		"past", "save", "with", "till", "to", "unto", "up", "upon", "with"]

	# Exceptions: Coordinating conjunctions
	COORD_CONJUNCTIONS = %w[and but as]

	# Titlecase exceptions: "In titles, capitalize the first word, the
	# last word, and all words in between except articles (a, an, and
	# the), prepositions under five letters (in, of, to), and coordinating
	# conjunctions (and, but). These rules apply to titles of long, short,
	# and partial works as well as your own papers" (Anson, Schwegler,
	# and Muth. The Longman Writer's Companion 240).
	TITLE_CASE_EXCEPTIONS = ARTICLES | SHORT_PREPOSITIONS | COORD_CONJUNCTIONS

	# The words which don't get capitalized in a compound proper noun
	PROPER_NOUN_EXCEPTIONS = %w{and the of}



	### Turns a camel-case +string+ ("camelCaseToEnglish") to plain English
	### ("camel case to english"). Each word is decapitalized.
	def un_camel_case
		self.obj.to_s.
			gsub( /([A-Z])([A-Z])/ ) { "#$1 #$2" }.
			gsub( /([a-z])([A-Z])/ ) { "#$1 #$2" }.downcase
	end


	### Turns an English language +string+ into a CamelCase word.
	def to_camel_case
		self.obj.to_s.gsub( /\s+([a-z])/i ) { $1.upcase }
	end


	### This method doesn't work quite right yet. It does okay for simple cases,
	### but it misses more complex ones, e.g. 'as' used as a coordinating
	### conjunction in "A Portrait of the Artist as a Young Man". Perhaps after
	### there's a working (non-leaking) LinkParser for Ruby, this can be fixed
	### up. Until then it'll just be undocumented.

	### Returns the inflected object as a title-cased String.
	def titlecase

		# Split on word-boundaries
		words = self.obj.to_s.split( /\b/ )

		# Always capitalize the first and last words
		words.first.capitalize!
		words.last.capitalize!

		# Now scan the rest of the tokens, skipping non-words and capitalization
		# exceptions.
		words.each_with_index do |word, i|

			# Non-words
			next unless /^\w+$/.match( word )

			# Skip exception-words
			next if TITLE_CASE_EXCEPTIONS.include?( word )

			# Skip second parts of contractions
			next if words[i - 1] == "'" && /\w/.match( words[i - 2] )

			# Have to do it this way instead of capitalize! because that method
			# also downcases all other letters.
			word.gsub!( /^(\w)(.*)/ ) { $1.upcase + $2 }
		end

		return words.join
	end


	### Returns the proper noun form of the inflected object by capitalizing most of the
	### words.
	###
	### @example
	###   English.proper_noun("bosnia and herzegovina") ->
	###     "Bosnia and Herzegovina"
	###   English.proper_noun("macedonia, the former yugoslav republic of") ->
	###     "Macedonia, the Former Yugoslav Republic of"
	###   English.proper_noun("virgin islands, u.s.") ->
	###     "Virgin Islands, U.S."
	def proper_noun
		return self.obj.to_s.split(/([ .]+)/).collect do |word|
			next word unless
				/^[a-z]/.match( word ) &&
				! (PROPER_NOUN_EXCEPTIONS.include?( word ))
			word.capitalize
		end.join
	end


end # module Linguistics::EN::TitleCase

