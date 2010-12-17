#!/usr/bin/ruby
# coding: utf-8

# An interface for extending core Ruby classes with linguistic methods.
# 
# @version 2.0.0
#
# 
# @author Michael Granger <ged@FaerieMUD.org>
# 
module Linguistics

	# Release version
	VERSION = '2.0.0'

	# VCS version
	REVISION = %q$Revision: 29f18e9ec72b $

	# The list of Classes to add linguistic behaviours to.
	DEFAULT_EXT_CLASSES = [ String, Numeric, Array ]


	vvec = lambda {|version| version.split('.').collect {|v| v.to_i }.pack('N*') }
	abort "This version of Linguistics requires Ruby 1.9.2 or greater." unless
		vvec[RUBY_VERSION] >= vvec['1.9.2']


	require 'linguistics/utils'
	require 'linguistics/mixins'
	require 'linguistics/iso639'
	require 'linguistics/inflector'

	include Linguistics::ISO639


	### Language modules and the inflector classes that act as their interfaces
	@languages        = {}
	@inflector_mixins = {}

	class << self
		# The Hash of loaded languages keyed by 3-letter bibliographic ISO639-2 code
		attr_reader :languages

		# The Hash of anonymous inflector modules that act as the mixin interface to
		# a language module's inflector, keyed by the language module they belong to
		attr_reader :inflector_mixins
	end


	### Logging
	@default_logger = Logger.new( $stderr )
	@default_logger.level = $DEBUG ? Logger::DEBUG : Logger::WARN

	@default_log_formatter = Linguistics::LogFormatter.new( @default_logger )
	@default_logger.formatter = @default_log_formatter

	@logger = @default_logger

	class << self
		# The log formatter that will be used when the logging subsystem is reset
		attr_accessor :default_log_formatter

		# The logger that will be used when the logging subsystem is reset
		attr_accessor :default_logger

		# The logger that's currently in effect
		attr_accessor :logger
		alias_method :log, :logger
		alias_method :log=, :logger=
	end


	### Reset the global logger object to the default
	def self::reset_logger
		self.logger = self.default_logger
		self.logger.level = Logger::WARN
		self.logger.formatter = self.default_log_formatter
	end


	### Returns +true+ if the global logger has not been set to something other than
	### the default one.
	def self::using_default_logger?
		return self.logger == self.default_logger
	end


	### Return the library's version string
	def self::version_string( include_buildnum=false )
		vstring = "%s %s" % [ self.name, VERSION ]
		vstring << " (build %s)" % [ REVISION[/: ([[:xdigit:]]+)/, 1] || '0' ] if include_buildnum
		return vstring
	end


	###############
	module_function
	###############

	### Add linguistics functions for the specified languages to Ruby's core
	### classes. The interface to all linguistic functions for a given language
	### is through a method which is the same the language's international 2- or
	### 3-letter code (ISO 639). You can also specify a Hash of configuration
	### options which control which classes are extended:
	###
	### [<b>:classes</b>]
	###   Specify the classes which are to be extended. If this is not specified,
	###   the Class objects in Linguistics::DEFAULT_EXT_CLASSES (an Array) are
	###   extended.
	### [<b>:proxy</b>]
	###   
	def use( *languages )
		config = {}
		config = languages.pop if languages.last.is_a?( Hash )

		classes = Array(config[:classes]) if config[:classes] 
		classes ||= DEFAULT_EXT_CLASSES

		Linguistics.log.debug "Extending %d classes with %d language modules." %
			[ classes.length, languages.length ]

		# Mix the language module for each requested language into each
		# specified class
		classes.each do |klass|
			Linguistics.log.debug "  extending %p" % [ klass ]
			languages.each do |lang|
				mod = load_language( lang ) or
					raise LoadError, "failed to load a language extension for %p" % [ lang ]
				Linguistics.log.debug "    using %s language module: %p" % [ lang, mod ]

				inflector = make_inflector_mixin( lang, mod )
				Linguistics.log.debug "    made an inflector mixin: %p" % [ inflector ]
				klass.send( :include, inflector )
			end
		end

		return classes
	end


	### Try to load the module that implements the given language, returning
	### the Module object if successful.
	def load_language( lang )
		unless mod = self.languages[ lang.to_sym ]

			Linguistics.log.debug "Trying to load language %p" % [ lang ]
			language = LANGUAGE_CODES[ lang.to_sym ] or
				raise "Unknown ISO639-2 language code '#{lang}'"
			Linguistics.log.debug "  got language code %p" % [ language ]

			# Sort all the codes for the specified language, trying the 2-letter
			# versions first in alphabetical order, then the 3-letter ones
			msgs = []
			mod = nil

			language[:codes].sort.each do |code|
				next if code == ''

				begin
					require "linguistics/#{code}"
					Linguistics.log.debug "  loaded linguistics/#{code}!"
					mod = self.languages[ lang.to_sym ]
					Linguistics.log.debug "  set mod to %p" % [ mod ]
					break
				rescue LoadError => err
					Linguistics.log.error "  require of linguistics/#{code} failed: #{err.message}"
					msgs << "Tried 'linguistics/#{code}': #{err.message}\n"
				end
			end

			if mod.is_a?( Array )
				raise LoadError,
					"Failed to load language extension %s:\n%s" %
					[ lang, msgs.join ]
			end

		end

		return mod
	end


	### Create a mixin module/class pair that act as the per-object interface to
	### the given language +mod+'s inflector.
	def make_inflector_mixin( lang, mod )
		language = LANGUAGE_CODES[ lang.to_sym ] or
			raise "Unknown ISO639-2 language code '#{lang}'"

		unless mixin = self.inflector_mixins[ mod ]
			Linguistics.log.debug "Making an inflector mixin for %p" % [ mod ]

			alpha2code, bibcode, termcode = *language[:codes]
			inflector = Class.new( Linguistics::Inflector ) { include(mod) }
			Linguistics.log.debug "  created inflector class %p for [%p, %p, %p]" %
				[ inflector, bibcode, termcode, alpha2code ]

			mixin = Module.new do
				define_method( bibcode ) do
					@__inflector ||= inflector.new( self )
				end
				alias_method termcode, bibcode unless termcode.nil? || termcode.empty?
				alias_method alpha2code, bibcode unless alpha2code.nil? || alpha2code.empty?
			end
			self.inflector_mixins[ mod ] = mixin
		end

		return mixin
	end


	### Register a module as providing linguistic functions for the specified +language+ (a two- 
	### or three-letter ISO639-2 language codes as a Symbol)
	def register_language( language, mod )
		language_entry = LANGUAGE_CODES[ language.to_sym ] or
			raise "Unknown ISO639-2 language code '#{language}'"
		Linguistics.log.info "Registering %s for language %p" % [ mod, language_entry ]

		language_entry[:codes].each do |lang|
			self.languages[ lang.to_sym ] = mod
		end
	end


	### A collection of extensions that get added to Array.
	module ArrayExtensions

		### Returns a new Array that has had a new member inserted between all of
		### the current ones. The value used is the given +value+ argument unless a
		### block is given, in which case the block is called once for each pair of
		### the Array, and the return value is used as the separator.
		def separate( *args, &block )
			ary = self.dup
			ary.separate!( *args, &block )
			return ary
		end

		### The same as #separate, but modifies the Array in place.
		def separate!( *args )
			raise LocalJumpError, "no block given for no-arg #separate!" if
				args.empty? && !block_given?
			value = args.first

			(1..( (self.length * 2) - 2 )).step(2) do |i|
				if block_given?
					self.insert( i, yield(self[i-1,2]) )
				else
					self.insert( i, value )
				end
			end
			self
		end

	end # module ArrayExtensions

end # class Linguistics


### Extend Array
class Array
	include Linguistics::ArrayExtensions
end

