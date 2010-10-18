#!/usr/bin/ruby
# coding: utf-8

require 'linguistics' unless defined?( Linguistics )

# A facade object that acts as the mixin point for linguistic modules
# for a single language. A single instance of an inflector is generated
# for an object that has been extended with a Linguistics language
# the first time the language is used.
class Linguistics::Inflector #< BasicObject
	include Linguistics::Loggable


	### Create a new inflector for +obj+.
	def initialize( obj )
		@obj = obj
		super()
	end


	######
	public
	######

	# The object the inflector is delegating for
	attr_reader :obj

	### Output a programmer-readable representation of the object suitable for debugging.
	def inspect
		return "#<(%s-language inflector):0x%0x for <%s:0x%0x> >" % [
			language(),
			self.object_id / 2,
			@obj.class,
			@obj.object_id / 2
		]
	end


	### Output a human-readable representation of the object.
	def to_s
		return "%s-language inflector for %s" % [ language(), @obj ]
	end

end # class Linguistics::Inflector

