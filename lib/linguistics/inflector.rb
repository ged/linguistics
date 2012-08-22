#!/usr/bin/ruby
# coding: utf-8

require 'loggability'
require 'linguistics' unless defined?( Linguistics )

# A facade object that acts as the extension point for linguistic modules
# for a single language. A single instance of an inflector is generated
# for an object that has been extended with a Linguistics language
# the first time the language is used.
class Linguistics::Inflector
	extend Loggability


	# Loggability API -- log to the linguistics logger
	log_to :linguistics


	### Create a new inflector for +obj+.
	def initialize( language_code, obj )
		raise TypeError, "can't inflect for another inflector!" if
			obj.is_a?( Linguistics::Inflector )
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


	### Returns +true+ if either the inflector or the object it's wrapping respond to
	### the specified +message+.
	def respond_to_missing?( message, include_priv=false )
		return self.obj.respond_to?( message, include_priv )
	end


	### Return the target object as a String.
	def to_s
		return self.obj.to_s
	end


	### Return the target object as an Integer
	def to_i
		return self.obj.to_i
	end


	### Output a programmer-readable representation of the object suitable for debugging.
	def inspect
		return "#<(%s-language inflector) for <%s:0x%0x> >" % [
			self.language,
			@obj.class,
			@obj.object_id / 2
		]
	end


	#########
	protected
	#########

	### Delegate missing methods to the target object.
	def method_missing( sym, *args, &block )
		return super unless self.obj.respond_to?( sym )
		meth = self.obj.method( sym )
		self.singleton_class.send( :define_method, sym, &meth )
		return self.method( sym ).call( *args, &block )
	end

end # class Linguistics::Inflector

