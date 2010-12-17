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
#  $Id: linkparser.rb,v 29f18e9ec72b 2010/12/17 01:14:17 ged $
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
module Linguistics::EN::LinkParser

	# Register this module to the list of modules to include
	Linguistics::EN.register_extension( self )

	@lp_dict  = nil
	@lp_error = nil

	begin
		require "linkparser"
	rescue LoadError => err
		@lp_error = err
	end


	#################################################################
	###	M O D U L E   M E T H O D S
	#################################################################

	### If #has_link_parser? returns +false+, this will be the
	### Exception which was raised when trying to load LinkParser.
	### @return [LoadError] the exception that was raised
	class << self; attr_accessor :lp_error; end


	### Returns +true+ if LinkParser was loaded okay
	def self::has_link_parser?
		return self.lp_error ? false : true
	end


	### The instance of LinkParser used for all Linguistics LinkParser
	### functions.
	def self::lp_dict
		if !self.has_link_parser?
			raise NotImplementedError,
				"LinkParser functions are not loaded: %s" %
				self.lp_error.message
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
		return Linguistics::EN::LinkParser.lp_dict.parse( self.obj.to_s )
	end

end # class Linguistics::EN::LinkParser
