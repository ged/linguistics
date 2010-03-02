#!/usr/bin/ruby
# coding: utf-8

require 'linguistics'

# A facade object that acts as the mixin point for linguistic modules
# for a single language. A single instance of an inflector is generated
# for an object that has been extended with a Linguistics language
# the first time the language is used.
class Linguistics::Inflector

	### Create a new inflector for +obj+.
	def initialize( obj )
		@obj = obj
		super()
	end

	### Output a human-readable representation of the object.
	def inspect
		return "#<(inflector):0x%0x for <%s:0x%0x> >" % [
			self.object_id / 2,
			@obj.class,
			@obj.object_id / 2
		]
	end


end # class Linguistics::Inflector

