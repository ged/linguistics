#!/usr/bin/ruby

require 'linguistics/en' unless defined?( Linguistics::EN )

# This file contains functions for finding relations for English words. It
# requires the Ruby-WordNet module to be installed; if it is not installed,
# calling the functions defined by this file will raise NotImplemented
# exceptions if called. Requiring this file adds functions and constants to the
# Linguistics::EN module.
#
# == Synopsis
#
#   # Test to be sure the WordNet module loaded okay.
#   Linguistics::EN.has_wordnet?
#   # => true
#  
#   # Fetch the default synset for the word "balance"
#   "balance".synset
#   # => #<WordNet::Synset:0x40376844 balance (noun): "a state of equilibrium"
#    (derivations: 3, antonyms: 1, hypernyms: 1, hyponyms: 3)>
#  
#   # Fetch the synset for the first verb sense of "balance"
#   "balance".en.synset( :verb )
#   # => #<WordNet::Synset:0x4033f448 balance, equilibrate, equilibrize, equilibrise
#   (verb): "bring into balance or equilibrium; "She has to balance work and her
#   domestic duties"; "balance the two weights"" (derivations: 7, antonyms: 1,
#   verbGroups: 2, hypernyms: 1, hyponyms: 5)>
#  
#   # Fetch the second noun sense
#   "balance".en.synset( 2, :noun )
#   # => #<WordNet::Synset:0x404ebb24 balance (noun): "a scale for weighing; depends
#   on pull of gravity" (hypernyms: 1, hyponyms: 5)>
#  
#   # Fetch the second noun sense's hypernyms (more-general words, like a superclass)
#   "balance".en.synset( 2, :noun ).hypernyms
#   # => [#<WordNet::Synset:0x404e5620 scale, weighing machine (noun): "a measuring
#   instrument for weighing; shows amount of mass" (derivations: 2, hypernyms: 1,
#   hyponyms: 2)>]
#  
#   # A simpler way of doing the same thing:
#   "balance".en.hypernyms( 2, :noun )
#   # => [#<WordNet::Synset:0x404e5620 scale, weighing machine (noun): "a measuring
#   instrument for weighing; shows amount of mass" (derivations: 2, hypernyms: 1,
#   hyponyms: 2)>]
#  
#   # Fetch the first hypernym's hypernyms
#   "balance".en.synset( 2, :noun ).hypernyms.first.hypernyms
#   # => [#<WordNet::Synset:0x404c60b8 measuring instrument, measuring system,
#   measuring device (noun): "instrument that shows the extent or amount or quantity
#   or degree of something" (hypernyms: 1, hyponyms: 83)>]
#  
#   # Find the synset to which both the second noun sense of "balance" and the
#   # default sense of "shovel" belong.
#   ("balance".en.synset( 2, :noun ) | "shovel".en.synset)
#   # => #<WordNet::Synset:0x40473da4 instrumentality, instrumentation (noun): "an
#   artifact (or system of artifacts) that is instrumental in accomplishing some
#   end" (derivations: 1, hypernyms: 1, hyponyms: 13)>
#  
#   # Fetch just the words for the other kinds of "instruments"
#   "instrument".en.hyponyms.collect {|synset| synset.words}.flatten
#   # => ["analyzer", "analyser", "cautery", "cauterant", "drafting instrument",
#   "extractor", "instrument of execution", "instrument of punishment", "measuring
#   instrument", "measuring system", "measuring device", "medical instrument",
#   "navigational instrument", "optical instrument", "plotter", "scientific
#   instrument", "sonograph", "surveying instrument", "surveyor's instrument",
#   "tracer", "weapon", "arm", "weapon system", "whip"]
# 
# 
# == Authors
# 
# * Michael Granger <ged@FaerieMUD.org>
# 
# == Copyright
# 
# :include: LICENSE
# 
# == Version
#
#  $Id: wordnet.rb,v a5c25f0f1458 2010/12/15 16:04:02 ged $
# 
module Linguistics::EN::WordNet

	# Register this module to the list of modules to include
	Linguistics::EN.register_extension( self )

	@has_wordnet	= false
	@wn_error		= nil
	@wn_lexicon		= nil

	# Load WordNet if possible, saving the error that occurs if anything goes wrong.
	begin
		require 'wordnet'
		@has_wordnet = true
	rescue LoadError => err
		@wn_error = err
	end


	#################################################################
	###	M O D U L E   M E T H O D S
	#################################################################

	### Returns +true+ if WordNet was loaded okay
	def self::has_wordnet? ; @has_wordnet; end

	### If #has_wordnet? returns +false+, this can be called to fetch the
	### exception which was raised when WordNet was loaded.
	def self::wn_error ; @wn_error; end

	### The instance of the WordNet::Lexicon used for all Linguistics WordNet
	### functions.
	def self::wn_lexicon
		if @wn_error
			raise NotImplementedError,
				"WordNet functions are not loaded: %s" %
				@wn_error.message
		end

		@wn_lexicon ||= WordNet::Lexicon::new
	end

	### Make a function that calls the method +meth+ on the synset of an input
	### word.
	def self::def_synset_function( name )
		define_method( name ) do |word, pos=nil, sense=nil|
			sense ||= 1

			syn = self.en.synset( word.to_s, pos, sense )
			return syn.nil? ? nil : syn.send( name )
		end
	end



	#################################################################
	###	W O R D N E T   I N T E R F A C E
	#################################################################

	######
	public
	######

	### Look up the synset associated with the given word or collocation in the
	### WordNet lexicon and return a WordNet::Synset object.
	def synset( pos=nil, sense=1 )
		word = self.obj.to_s

		lex = Linguistics::EN::WordNet.wn_lexicon

		if pos.is_a?( Fixnum )
			sense = pos
			pos = nil
		end
		postries = pos ? [pos] : [:noun, :verb, :adjective, :adverb, :other]
		syn = nil

		postries.each do |pos|
			break if syn = lex.lookup_synsets( word.to_s, pos, sense )
		end

		return syn
	end


	### Look up all the synsets associated with the given word or collocation in
	### the WordNet lexicon and return an Array of WordNet::Synset objects. If
	### +pos+ is +nil+, return synsets for all parts of speech.
	def synsets( word, pos=nil )
		lex = Linguistics::EN::wn_lexicon
		postries = pos ? [pos] : [:noun, :verb, :adjective, :adverb, :other]
		syns = []

		postries.each do |pos|
			syns << lex.lookup_synsets( word.to_s, pos )
		end

		return syns.flatten.compact
	end


	# Returns definitions and/or example sentences as a String.
	def_synset_function :gloss

	# Returns definitions and/or example sentences as an Array.
	def_synset_function :glosses

	# Return nouns or verbs that have the same hypernym as the receiver.
	def_synset_function :coordinates

	# Returns the Array of synonyms contained in the synset for the receiver.
	def_synset_function :words
	def_synset_function :synonyms

	# Returns the name of the lexicographer file that contains the raw data for
	# the receiver.
	def_synset_function :lex_info

	# :TODO: Finish these comments, and figure out how the hell to get the
	# methods to show up in RDoc.
	def_synset_function :frames


	# Returns the synsets for the receiver's antonyms, if any. Ex:
	# 'opaque'.en.synset.antonyms
	#   ==> [#<WordNet::Synset:0x010ca614/454927 clear (adjective): "free
	#        from cloudiness; allowing light to pass through; "clear water";
	#        "clear plastic bags"; "clear glass"; "the air is clear and clean""
	#        (similarTos: 6, attributes: 1, derivations: 2, antonyms: 1,
	#        seeAlsos: 1)>]
	def_synset_function :antonyms

	def_synset_function :hypernyms
    def_synset_function :instance_hypernyms
	def_synset_function :entailment
	def_synset_function :hyponyms
    def_synset_function :instance_hyponyms
	def_synset_function :causes
	def_synset_function :verbgroups
	def_synset_function :similar_to
	def_synset_function :participles
	def_synset_function :pertainyms
	def_synset_function :attributes
	def_synset_function :derived_from
	def_synset_function :see_also
	def_synset_function :functions

	def_synset_function :meronyms
	def_synset_function :member_meronyms
	def_synset_function :stuff_meronyms
	def_synset_function :portion_meronyms
	def_synset_function :component_meronyms
	def_synset_function :feature_meronyms
	def_synset_function :phase_meronyms
	def_synset_function :place_meronyms

	def_synset_function :holonyms
	def_synset_function :member_holonyms
	def_synset_function :stuff_holonyms
	def_synset_function :portion_holonyms
	def_synset_function :component_holonyms
	def_synset_function :feature_holonyms
	def_synset_function :phase_holonyms
	def_synset_function :place_holonyms

	def_synset_function :domains
	def_synset_function :category_domains
	def_synset_function :region_domains
	def_synset_function :usage_domains

	def_synset_function :members
	def_synset_function :category_members
	def_synset_function :region_members
	def_synset_function :usage_members


end # module Linguistics::EN

