#!/usr/bin/env ruby

require 'linguistics' unless defined?( Linguistics )
require 'linguistics/en' unless defined?( Linguistics::EN )

# Ruby-Stemmer support for the English-language Linguistics module. It
# requires the Ruby-Stemmer gem to be installed; if it is not
# installed, calling the functions defined by this file will raise
# NotImplementedErrors.
#
#   # Test to be sure the Stemmer gem loaded okay.
#   Linguistics::EN.has_stemmer?
#   # => true
#
module Linguistics::EN::Stemmer

	# Module instance variables -- copied over to the EN module when registered
	@has_stemmer   = false
	@stemmer_error = nil
	@stemmer       = nil

	# Load Ruby-Stemmer if possible, saving the error that occurs if anything goes wrong.
	begin
		require 'lingua/stemmer'
		@has_stemmer = true
	rescue LoadError => err
		@stemmer_error = err
	end


	# Container for methods intended to extend the EN module as singleton methods.
	module SingletonMethods

		### Returns +true+ if Ruby-Stemmer was loaded okay
		def has_stemmer? ; @has_stemmer; end

		### If #has_stemmer? returns +false+, this can be called to fetch the
		### exception which was raised when Ruby-Stemmer was loaded.
		def stemmer_error ; @stemmer_error; end

	end # module SingletonMethods
	extend SingletonMethods


	# Register this module to the list of modules to include
	Linguistics::EN.register_extension( self )

	#################################################################
	###	M O D U L E   M E T H O D S
	#################################################################

	### The instance of the Lingua::Stemmer used for all Linguistics Stemmer
	### functions.
	def self::stemmer
		raise self.stemmer_error unless self.has_stemmer?
		@stemmer ||= Lingua::Stemmer.new
	end


	#################################################################
	###	S T E M M E R   I N T E R F A C E
	#################################################################

	######
	public
	######


	### Return the stem of the receiving word.
	def stem
		return Linguistics::EN::Stemmer.stemmer.stem( self.obj.to_s )
	end

end # module Linguistics::EN::Stemmer

