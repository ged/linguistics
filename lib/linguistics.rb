#!/usr/bin/ruby
# 
# linguistics.rb -- provides an interface for extending core Ruby classes with
# linguistic methods.
# 
# == Synopsis
# 
#   require 'linguistics'
#	Linguistics::use( :en )
# 
# == Authors
# 
# * Michael Granger <ged@FaerieMUD.org>
# 
# == Copyright
#
# Copyright (c) 2003 The FaerieMUD Consortium. All rights reserved.
# 
# This module is free software. You may use, modify, and/or redistribute this
# software under the terms of the Perl Artistic License. (See
# http://language.perl.com/misc/Artistic.html)
# 
# == Version
#
#  $Id: linguistics.rb,v 1.2 2003/07/09 19:30:42 deveiant Exp $
# 

require 'linguistics/iso639'

### Linguistics 
module Linguistics 

	### Class constants
	Version = /([\d\.]+)/.match( %q{$Revision: 1.2 $} )[1]
	Rcsid = %q$Id: linguistics.rb,v 1.2 2003/07/09 19:30:42 deveiant Exp $

	# Language module implementors should do something like:
	#   Linguistics::DefaultLanguages.push( :ja ) # or whatever
	# so that direct requiring of a language module sets the default.
	DefaultLanguages = []

	# The list of Classes to add linguistic behaviours to.
	DefaultExtClasses = [String, Numeric, Array]


	#################################################################
	###	I N F L E C T O R   C L A S S   F A C T O R Y
	#################################################################

	### Template class -- is cloned and 
	class InflectorClass

		### Class instance variable + accessor. Contains the module which knows
		### the specifics of the language the inflector class is providing
		### methods for.
		@langmod = nil
		class << self
			attr_accessor :langmod
		end


		### Create a new inflector for the given +receiver+.
		def initialize( receiver )
			@receiver = receiver
		end


		######
		public
		######

		### Autoload linguistic methods defined in the module this object's
		### class uses for inflection.
		def method_missing( sym, *args )
			super unless self.class.langmod.respond_to?( sym )

			self.class.module_eval %{
				def #{sym}( *args, &block )
					self.class.langmod.#{sym}( @receiver, *args, &block )
				end
			}, "{Autoloaded: " + __FILE__ + "}", __LINE__

			self.method( sym ).call( *args )
		end


		### Returns a human-readable representation of the inflector for
		### debugging, logging, etc.
		def inspect
			"<%s inflector for %s object %s>" % [
				self.class.langmod.language,
				@receiver.class.name,
				@receiver.inspect,
			]
		end

	end


	### Make an inflector class that encapsulates all of the inflect operations
	### using the given language module.
	def self::makeInflector( mod )
		Class::new( InflectorClass ) {
			@langmod = mod
		}
	end



	#################################################################
	###	L A N G U A G E - I N D E P E N D E N T   F U N C T I O N S
	#################################################################

	###############
	module_function
	###############

	### Add linguistics functions for the specified languages to Ruby's core
	### classes. The interface to all linguistic functions for a given language
	### is through a method which is the same the language's international 2- or
	### 3-letter code (ISO 639).
	def use( *languages )
		config = {}
		config = languages.pop if languages.last.is_a?( Hash )
		languages.replace( DefaultLanguages ) if languages.empty?

		classes = config.key?( :classes ) ? config[:classes] : DefaultExtClasses
		classes = [ classes ] unless classes.is_a?( Array )

		# Create an inflector class for each installed language
		languages.each {|lang|

			# Load the language module (skipping to the next if it's already
			# loaded), make an inflector class that delegates to it, and figure
			# out what the inflector method will be called.
			mod = loadLanguage( lang.to_s.downcase )
			ifaceMeth = mod.name.downcase.sub( /.*:/, '' )
			inflectorClass = makeInflector( mod )
			inflector = { ifaceMeth => inflectorClass }

			# Install the inflector in each class.
			classes.each {|klass|

				# Either install a hash for inflector classes and an accessor
				# for the hash, or merge the current inflector into the hash if
				# it's not already present.
				if !klass.class_variables.include?( "@@__inflector_class" )
					klass.module_eval %{
						@@__inflector_class = {}
						def self::__inflector_class; @@__inflector_class; end
					}, __FILE__, __LINE__
				end

				klass.__inflector_class.merge!( inflector )

				# Set the language-code method for the class unless it has one
				# already
				unless klass.instance_methods(true).include?( ifaceMeth )
					klass.module_eval %{
						def #{ifaceMeth}
							@__#{ifaceMeth}_inflector ||=
								self.class.__inflector_class["#{ifaceMeth}"].
								new( self )
						end
					}, __FILE__, __LINE__
				end
			}
		}
	end


	### Support Lingua::EN::Inflect-style globals in a threadsafe way by using
	### Thread-local variables.

	### Set the default count for all unspecified plurals to +val+. Setting is
	### local to calling thread.
	def num=( val )
		Thread.current[:persistent_count] = val
	end
	alias_method :NUM=, :num=

	### Get the default count for all unspecified plurals. Setting is local to
	### calling thread.
	def num
		Thread.current[:persistent_count]
	end
	alias_method :NUM, :num

	
	### Set the 'classical pluralizations' flag to +val+. Setting is local to
	### calling thread.
	def classical=( val )
		Thread.current[:classical_plurals] = val
	end

	### Return the value of the 'classical pluralizations' flag. Setting is
	### local to calling thread.
	def classical?
		Thread.current[:classical_plurals] ? true : false
	end


	#######
	private
	#######

	### Try to load the modules that implements the given language, returning
	### the Module object if successful.
	def self::loadLanguage( lang )
		raise "Unknown language code '#{lang}'" unless
			LanguageCodes.key?( lang )

		# Sort all the codes for the specified language, trying the 2-letter
		# versions first in alphabetical order, then the 3-letter ones
		mod = nil
		LanguageCodes[ lang ][:codes].sort {|a,b|
			(a.length <=> b.length).nonzero? ||
			(a <=> b)
		}.each {|code|
			begin
				require "linguistics/#{code}"
				modname = code.upcase
				mod = Linguistics::const_get( modname )
				break
			rescue LoadError
				next
			end
		}

		raise LoadError, "Failed to load language extension #{lang}" if mod.nil?
		return mod
	end

end # class linguistics

