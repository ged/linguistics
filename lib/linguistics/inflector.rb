#!/usr/bin/ruby
# coding: utf-8

require 'linguistics' unless defined?( Linguistics )

# A facade object that acts as the extension point for linguistic modules
# for a single language. A single instance of an inflector is generated
# for an object that has been extended with a Linguistics language
# the first time the language is used.
class Linguistics::Inflector
	include ::Linguistics::Loggable


	### Create a new inflector for +obj+.
	def initialize( language_code, obj )
		@language_code = language_code
		@obj = obj
		super()
	end


	######
	public
	######

	# The object the inflector is delegating for
	attr_reader :obj

	# The inflector's language code
	attr_reader :language_code


	### Return the english-language name of the language the inflector is delegating
	### for.
	def language
		::Linguistics::ISO639::LANGUAGE_CODES[ self.language_code.to_sym ][:eng_name]
	end


	### Output a programmer-readable representation of the object suitable for debugging.
	def inspect
		return "#<(%s-language inflector) for <%s:0x%0x> >" % [
			self.language,
			@obj.class,
			@obj.object_id / 2
		]
	end


	### Output a human-readable representation of the object.
	def to_s
		return "%s-language inflector for %s" % [ self.language, @obj ]
	end

end # class Linguistics::Inflector

