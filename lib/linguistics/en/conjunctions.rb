#!/usr/bin/ruby

require 'linguistics/en' unless defined?( Linguistics::EN )

# Conjunction methods for the English-language Linguistics module.
module Linguistics::EN::Conjunctions

	# Register this module to the list of modules to include
	Linguistics::EN.register_extension( self )

	# :stopdoc:

	# Default configuration arguments for the #conjunction (junction, what's
	# your) function.
	CONJUNCTION_DEFAULTS = {
		:separator		=> ', ',
		:altsep			=> '; ',
		:penultimate	=> true,
		:conjunctive	=> 'and',
		:combine		=> true,
		:casefold		=> true,
		:generalize		=> false,
		:quantsort		=> true,
		:article        => true,
	}


	# :TODO: Needs refactoring

	### Return the specified +obj+ (which must support the <tt>#collect</tt>
	### method) as a conjunction. Each item is converted to a String if it is
	### not already (using #to_s) unless a block is given, in which case it is
	### called once for each object in the array, and the stringified return
	### value from the block is used instead. Returning +nil+ causes that
	### particular element to be omitted from the resulting conjunction. The
	### following options can be used to control the makeup of the returned
	### conjunction String:
	###
	### [<b>:separator</b>]
	###   Specify one or more characters to separate items in the resulting
	###   list. Defaults to <tt>', '</tt>.
	### [<b>:altsep</b>]
	###   An alternate separator to use if any of the resulting conjunction's
	###   clauses contain the <tt>:separator</tt> character/s. Defaults to <tt>'; '</tt>.
	### [<b>:penultimate</b>]
	###   Flag that indicates whether or not to join the last clause onto the
	###   rest of the conjunction using a penultimate <tt>:separator</tt>. E.g.,
	###     %w{duck, cow, dog}.en.conjunction
	###     # => "a duck, a cow, and a dog"
	###     %w{duck cow dog}.en.conjunction( :penultimate => false )
	###     "a duck, a cow and a dog"
	###   Default to <tt>true</tt>.
	### [<b>:conjunctive</b>]
	###   Sets the word used as the conjunctive (separating word) of the
	###   resulting string. Default to <tt>'and'</tt>.
	### [<b>:combine</b>]
	###   If set to <tt>true</tt> (the default), items which are indentical (after
	###   surrounding spaces are stripped) will be combined in the resulting
	###   conjunction. E.g.,
	###     %w{goose cow goose dog}.en.conjunction
	###     # => "two geese, a cow, and a dog"
	###     %w{goose cow goose dog}.en.conjunction( :combine => false )
	###     # => "a goose, a cow, a goose, and a dog"
	### [<b>:casefold</b>]
	###   If set to <tt>true</tt> (the default), then items are compared
	###   case-insensitively when combining them. This has no effect if
	###   <tt>:combine</tt> is <tt>false</tt>.
	### [<b>:generalize</b>]
	###   If set to <tt>true</tt>, then quantities of combined items are turned into
	###   general descriptions instead of exact amounts.
	###     ary = %w{goose pig dog horse goose reindeer goose dog horse}
	###     ary.en.conjunction
	###     # => "three geese, two dogs, two horses, a pig, and a reindeer"
	###     ary.en.conjunction( :generalize => true )
	###     # => "several geese, several dogs, several horses, a pig, and a reindeer"
	###   See the #quantify method for specifics on how quantities are
	###   generalized. Generalization defaults to <tt>false</tt>, and has no effect if
	###   :combine is <tt>false</tt>.
	### [<b>:quantsort</b>]
	###   If set to <tt>true</tt> (the default), items which are combined in the
	###   resulting conjunction will be listed in order of amount, with greater
	###   quantities sorted first. If <tt>:quantsort</tt> is <tt>false</tt>, combined items
	###   will appear where the first instance of them occurred in the
	###   list. This sort is also the fallback for indentical quantities (ie.,
	###   items of the same quantity will be listed in the order they appeared
	###   in the source list).
	### [<b>:article</b>]
	###   If set to <tt>true</tt> (the default), singular items in the list will be
	###   prefixed with the appropriate indefinite article ("box" -> "a box"). Setting
	###   it to +false+ will omit this.
	###
	def conjunction( args={} )
		config = CONJUNCTION_DEFAULTS.merge( args )

		# Transform items in the obj to phrases
		phrases = if block_given?
				self.log.debug "  collecting with a block"
				self.collect {|item| yield(item) }.compact
			else
				self.log.debug "  collecting without a block"
				rval = self.collect( &:to_s )
				self.log.debug "  collected: %p" % [ rval ]
				rval
			end

		self.log.debug "  phrases is: %p" % [ phrases ]

		# No need for a conjunction if there's only one thing
		if phrases.length < 2
			return phrases[0] unless config[:article]
			return phrases[0].en.a
		end

		# Set up a Proc to derive a collector key from a phrase depending on the
		# configuration
		keyfunc =
			if config[:casefold]
				proc {|key| key.downcase.strip}
			else
				proc {|key| key.strip}
			end

		# Count and delete phrases that hash the same when the keyfunc munges
		# them into the same thing if we're combining (:combine => true).
		collector = {}
		if config[:combine]

			phrases.each_index do |i|
				# Stop when reaching the end of a truncated list
				break if phrases[i].nil?

				# Make the key using the configured key function
				phrase = keyfunc[ phrases[i] ]

				# If the collector already has this key, increment its count,
				# eliminate the duplicate from the phrase list, and redo the loop.
				if collector.key?( phrase )
					collector[ phrase ] += 1
					phrases.delete_at( i )
					redo
				end

				collector[ phrase ] = 1
			end
		else
			# If we're not combining, just make everything have a count of 1.
			phrases.uniq.each {|key| collector[ keyfunc[key] ] = 1}
		end

		# If sort-by-quantity is turned on, sort the phrases first by how many
		# there are (most-first), and then by the order they were specified in.
		if config[:quantsort] && config[:combine]
			origorder = {}
			phrases.each_with_index {|phrase,i| origorder[ keyfunc[phrase] ] ||= i }
			phrases.sort! {|a,b|
				(collector[ keyfunc[b] ] <=> collector[ keyfunc[a] ]).nonzero? ||
				(origorder[ keyfunc[a] ] <=> origorder[ keyfunc[b] ])
			}
		end

		# Set up a filtering function that adds either an indefinite article, an
		# indefinite quantifier, or a definite quantifier to each phrase
		# depending on the configuration and the count of phrases in the
		# collector.
		filter =
			if config[:generalize]
				proc {|phrase, count| phrase.en.quantify(count) }
			else
				proc do |phrase, count|
					if count > 1
						"%s %s" % [
							# :TODO: Make this threshold settable
							count < 10 ? count.en.numwords : count.to_s,
							phrase.en.plural( count )
						]
					elsif config[:article]
						phrase.en.a
					else
						self.log.debug "No article!"
						phrase
					end
				end
			end

		# Now use the configured filter to turn each phrase into its final
		# form. Hmmm... square-bracket Lisp?
		phrases.collect! {|phrase| filter[phrase, collector[ keyfunc[phrase] ]] }

		# Prepend the conjunctive to the last element unless it's empty or
		# there's only one element
		phrases[-1].insert( 0, config[:conjunctive] + " " ) unless
			config[:conjunctive].strip.empty? or
			phrases.length < 2

		# Concatenate the last two elements if there's no penultimate separator,
		# and pick a separator based on how many phrases there are and whether
		# or not there's already an instance of it in the phrases.
		phrase_count = phrases.length
		phrases[-2] << " " << phrases.pop unless config[:penultimate]
		sep = config[:separator]
		if phrase_count <= 2
			sep = ' '
		elsif phrases.find {|str| str.include?(config[:separator]) }
			sep = config[:altsep]
		end

		return phrases.join( sep )
	end
	Linguistics::EN.register_lprintf_formatter :CONJUNCT, :conjunction


end # module Linguistics::EN::Conjunctions

