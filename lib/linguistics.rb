#!/usr/bin/ruby
# coding: utf-8

require 'loggability'

# An interface for extending core Ruby classes with natural-language methods.
module Linguistics
	extend Loggability

	# Loggability API -- set up a logger for Linguistics objects
	log_as :linguistics


	# Release version
	VERSION = '2.1.0'

	# VCS version
	REVISION = %q$Revision$

	# The list of Classes to add linguistic behaviours to.
	DEFAULT_EXT_CLASSES = [ String, Numeric, Array ]


	vvec = lambda {|version| version.split('.').collect {|v| v.to_i }.pack('N*') }
	abort "This version of Linguistics requires Ruby 1.9.2 or greater." unless
		vvec[RUBY_VERSION] >= vvec['1.9.2']


	require 'linguistics/monkeypatches'
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


	### Return the library's version string
	def self::version_string( include_buildnum=false )
		vstring = "%s %s" % [ self.name, VERSION ]
		vstring << " (build %s)" % [ REVISION[/: ([[:xdigit:]]+)/, 1] || '0' ] if include_buildnum
		return vstring
	end


	### Register a module as providing linguistic functions for the specified +language+ (a two-
	### or three-letter ISO639-2 language codes as a Symbol)
	def self::register_language( language, mod )
		language_entry = LANGUAGE_CODES[ language.to_sym ] or
			raise "Unknown ISO639-2 language code '#{language}'"
		self.log.info "Registering %s for language %p" % [ mod, language_entry ]

		language_entry[:codes].each do |lang|
			self.languages[ lang.to_sym ] = mod
		end

		# Load in plugins for the language
		Gem.find_files( "linguistics/#{language}/*.rb" ).each do |extension|
			next if extension.include?( '/spec/' ) # Skip specs
			extension.sub!( %r{.*/linguistics/}, 'linguistics/' )
			self.log.debug "  trying to load #{language_entry[:eng_name]} extension %p" % [ extension ]
			begin
				require extension
			rescue LoadError => err
				self.log.debug "    failed (%s): %s %s" %
					[ err.class.name, err.message, err.backtrace.first ]
			else
				self.log.debug "    success."
			end
		end

	end


	### Try to load the module that implements the given language, returning
	### the Module object if successful.
	def self::load_language( lang )
		unless mod = self.languages[ lang.to_sym ]

			self.log.debug "Trying to load language %p" % [ lang ]
			language = LANGUAGE_CODES[ lang.to_sym ] or
				raise "Unknown ISO639-2 language code '#{lang}'"
			self.log.debug "  got language code %p" % [ language ]

			# Sort all the codes for the specified language, trying the 2-letter
			# versions first in alphabetical order, then the 3-letter ones
			msgs = []
			mod = nil

			language[:codes].sort.each do |code|
				next if code == ''

				begin
					require "linguistics/#{code}"
					self.log.debug "  loaded linguistics/#{code}!"
					mod = self.languages[ lang.to_sym ]
					self.log.debug "  set mod to %p" % [ mod ]
					break
				rescue LoadError => err
					self.log.error "  require of linguistics/#{code} failed: #{err.message}"
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
	### [<b>:monkeypatch</b>]
	###   Monkeypatch directly (albeit responsibly, via a mixin) the specified
	###   +classes+ instead of adding a single language-code method.
	def self::use( *languages )
		config = languages.pop if languages.last.is_a?( Hash )
		config ||= {}

		classes = Array(config[:classes]) if config[:classes]
		classes ||= DEFAULT_EXT_CLASSES

		self.log.debug "Extending %d classes with %d language modules." %
			[ classes.length, languages.length ]

		# Mix the language module for each requested language into each
		# specified class
		classes.each do |klass|
			self.log.debug "  extending %p" % [ klass ]
			languages.each do |lang|
				mod = load_language( lang ) or
					raise LoadError, "failed to load a language extension for %p" % [ lang ]
				self.log.debug "    using %s language module: %p" % [ lang, mod ]

				if config[:monkeypatch]
					klass.send( :include, mod )
				else
					inflector = make_inflector_mixin( lang, mod )
					self.log.debug "    made an inflector mixin: %p" % [ inflector ]
					klass.send( :include, inflector )
				end
			end
		end

		return classes
	end


	### Create a mixin module/class pair that act as the per-object interface to
	### the given language +mod+'s inflector.
	def self::make_inflector_mixin( lang, mod )
		language = LANGUAGE_CODES[ lang.to_sym ] or
			raise "Unknown ISO639-2 language code '#{lang}'"

		unless mixin = self.inflector_mixins[ mod ]
			self.log.debug "Making an inflector mixin for %p" % [ mod ]

			bibcode, alpha2code, termcode = *language[:codes]
			inflector = Class.new( Linguistics::Inflector ) { include(mod) }
			self.log.debug "  created inflector class %p for [%p, %p, %p]" %
				[ inflector, bibcode, termcode, alpha2code ]

			mixin = Module.new do
				define_method( bibcode ) do
					inflector.new( bibcode, self )
				end
				alias_method termcode, bibcode unless termcode.nil? || termcode.empty?
				alias_method alpha2code, bibcode unless alpha2code.nil? || alpha2code.empty?
			end
			self.inflector_mixins[ mod ] = mixin
		end

		return mixin
	end


end # module Linguistics

