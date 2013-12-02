#!/usr/bin/ruby

require 'linguistics/en' unless defined?( Linguistics::EN )

# WordNet support for the English-language Linguistics module. It
# requires the Ruby-WordNet module to be installed; if it is not
# installed, calling the functions defined by this file will raise
# NotImplementedErrors.
#
#   # Test to be sure the WordNet module loaded okay.
#   Linguistics::EN.has_wordnet?
#   # => true
#
#   # Fetch the default synset for the word "balance"
#   "balance".en.synset
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
module Linguistics::EN::WordNet

	@has_wordnet  = false
	@wn_error     = nil
	@lexicon      = nil

	# Load WordNet if possible, saving the error that occurs if anything goes wrong.
	begin
		require 'wordnet'
		@has_wordnet = true
	rescue LoadError => err
		@wn_error = err
	end


	# Container for methods intended to extend the EN module as singleton methods.
	module SingletonMethods

		### Returns +true+ if WordNet was loaded okay
		def has_wordnet? ; @has_wordnet; end

		### If #has_wordnet? returns +false+, this can be called to fetch the
		### exception which was raised when WordNet was loaded.
		def wordnet_error ; @wn_error; end

	end # module SingletonMethods
	extend SingletonMethods


	# Register this module to the list of modules to include
	Linguistics::EN.register_extension( self )


	#################################################################
	###	M O D U L E   M E T H O D S
	#################################################################

	### The instance of the WordNet::Lexicon used for all Linguistics WordNet
	### functions.
	def self::lexicon
		raise self.wordnet_error unless self.has_wordnet?
		@lexicon ||= WordNet::Lexicon::new
	end


	### Set the WordNet::Lexicon used by the linguistic functions.
	def self::lexicon=( newlex )
		@lexicon = newlex
	end


	### Make a function that calls the method +meth+ on the synset of an input
	### word.
	def self::def_synset_function( name )
		define_method( name ) do |*criteria|
			syn = self.synset( *criteria ) or return nil
			return syn.send( name )
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
	def synset( *args )
		return Linguistics::EN::WordNet.lexicon[ self.to_s, *args ]
	end


	### Look up all the synsets associated with the given word or collocation in
	### the WordNet lexicon and return an Array of WordNet::Synset objects. If
	### +pos+ is +nil+, return synsets for all parts of speech.
	def synsets( *args )
		return Linguistics::EN::WordNet.lexicon.lookup_synsets( self.to_s, *args )
	end


	# Returns definitions and/or example sentences as a String.
	def_synset_function :definition

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

