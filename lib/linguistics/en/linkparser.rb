#!/usr/bin/ruby

require 'linguistics/en' unless defined?( Linguistics::EN )

# This file contains the extensions to the Linguistics::EN module which provide
# support for the Ruby LinkParser module. LinkParser enables grammatic queries
# of English language sentences.
#
# == Synopsis
#
#   # Test to see whether or not the link parser is loaded.
#   Linguistics::EN.has_link_parser?
#   # => true
# 
#   # Diagram the first linkage for a test sentence
#   puts "he is a big dog".sentence.linkages.first.to_s
# 	  +---O*---+ 
# 	  | +--Ds--+ 
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
# == Version
#
#  $Id$
# 
# == Authors
# 
# * Martin Chase <stillflame@FaerieMUD.org>
# * Michael Granger <ged@FaerieMUD.org>
# 
# :include: LICENSE
#
#--
#
# Please see the file LICENSE in the base directory for licensing details.
#
module Linguistics::EN

	@has_link_parser	= false
	@lp_dict			= nil
	@lp_error			= nil

	begin
		require "linkparser"
		@has_link_parser = true
	rescue LoadError => err
		@lp_error = err
	end


	#################################################################
	###	M O D U L E   M E T H O D S
	#################################################################
	class << self

		### Returns +true+ if LinkParser was loaded okay
		def has_link_parser? ; @has_link_parser ; end

		### If #has_link_parser? returns +false+, this can be called to fetch the
		### exception which was raised when trying to load LinkParser.
		def lp_error ; @lp_error ; end

		### The instance of LinkParser used for all Linguistics LinkParser
		### functions.
		def lp_dict
			if @lp_error
				raise NotImplementedError, 
					"LinkParser functions are not loaded: %s" %
					@lp_error.message
			end

			return @lp_dict ||= LinkParser::Dictionary.new( :verbosity => 0 )
		end
	end


	#################################################################
	###	L I N K P A R S E R   I N T E R F A C E
	#################################################################

	###############
	module_function
	###############

	### Return a LinkParser::Sentence for the stringified +obj+.
	def sentence( obj )
		return Linguistics::EN::lp_dict.parse( obj.to_s )
	end
	module_function :sentence

end
