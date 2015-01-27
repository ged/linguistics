#!/usr/bin/ruby

require 'linguistics/en' unless defined?( Linguistics::EN )

# LinkParser support for the English-language Linguistics module.
# LinkParser enables grammatic queries of English language sentences.
#
#   # Test to see whether or not the link parser is loaded.
#   Linguistics::EN.has_link_parser?
#   # => true
#
#   # Diagram the first linkage for a test sentence
#   puts "he is a big dog".en.sentence.linkages.first.to_s
#     +---O*---+
#     | +--Ds--+
#    +Ss+ |  +-A-+
#    |  | |  |   |
#   he is a big dog
#
#   # Find the verb in the sentence
#   "he is a big dog".en.sentence.verb.to_s
#   # => "is"
#
#   # Combined infinitive + LinkParser: Find the infinitive form of the verb of the
#   given sentence.
#   "he is a big dog".en.sentence.verb.infinitive
#   # => "be"
#
#   # Find the direct object of the sentence
#   "he is a big dog".en.sentence.object.to_s
#   # => "dog"
#
#   # Combine WordNet + LinkParser to find the definition of the direct object of
#   # the sentence
#   "he is a big dog".en.sentence.object.gloss
#   # => "a member of the genus Canis (probably descended from the common wolf) that
#   has been domesticated by man since prehistoric times; occurs in many breeds;
#   \"the dog barked all night\""
#
module Linguistics::EN::LinkParser

	@has_linkparser = false
	@lp_dict        = nil
	@lp_error       = nil

	begin
		require "linkparser"
		@has_linkparser = true
	rescue LoadError => err
		@lp_error = err
	end


	# Container for methods intended to extend the EN module as singleton methods.
	module SingletonMethods

		### Returns +true+ if WordNet was loaded okay
		def has_linkparser? ; @has_linkparser; end

		### If #has_linkparser? returns +false+, this can be called to fetch the
		### exception which was raised when WordNet was loaded.
		def linkparser_error ; @lp_error; end

	end # module SingletonMethods
	extend SingletonMethods


	# Register this module to the list of modules to include
	Linguistics::EN.register_extension( self )

	#################################################################
	###	M O D U L E   M E T H O D S
	#################################################################

	### The instance of LinkParser used for all Linguistics LinkParser
	### functions.
	def self::lp_dict
		if !self.has_linkparser?
			raise NotImplementedError,
				"LinkParser functions are not loaded: %s" %
				self.linkparser_error.message
		end

		return @lp_dict ||= LinkParser::Dictionary.new( :verbosity => 0 )
	end


	#################################################################
	###	L I N K P A R S E R   I N T E R F A C E
	#################################################################

	######
	public
	######

	### Return a LinkParser::Sentence for the stringified +obj+.
	def sentence
		return Linguistics::EN::LinkParser.lp_dict.parse( self.to_s )
	end

end # class Linguistics::EN::LinkParser
