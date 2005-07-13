#!/usr/bin/ruby
# 
# CrossCase - a mixin for making methods look the way you like 'em. Or for
# making them look the way other people like 'em. Or something.
# 
# == Synopsis
# 
#   class MyClass
#		include CrossCase
#
#		def underbarred_method; ...; end
#		def camelCasedMethod; ...; end
#	end
#
#	obj = MyClass::new
#	obj.underbarredMethod
#	obj.camel_cased_method
#
#	# -or-
#
#	class MyClass
#		def underbarred_method; ...; end
#		def camelCasedMethod; ...; end
#	end
#
#	MyClass.extend( CrossCase )
#	obj = MyClass::new
#	obj.underbarredMethod
#	obj.camel_cased_method
#
# == Description
#
# This module, when mixed into a Class or another Module, will provide
# under_barred aliases for class or instance methods with names which follow the
# camelCased naming conventions, and vice-versa. E.g., in a class which mixes in
# CrossCase, defining a method which is called +foo_bar+ will also create an
# alias for that method called +fooBar+.
#
# I wrote this module because I prefer camelCased method names, but also wish to
# respect the preferences of my fellow Rubyists for whom such practices are an
# abomination. And I'm too lazy to type
#   alias :twinkle_twinkle :twinkleTwinkle
# for every method. It's all about laziness. Or perhaps I'm catering to my
# hubris. Or both; I'll shut up now.
# 
# == Caveats
#
# This module uses the +method_added+ and +singleton_method_added+ hooks to
# generate aliases for new methods. If either or both of these methods are
# already defined, they will be preserved as aliases when the Class or Module is
# extended. It's up to you to return the favor should you create your own hook
# after this module is mixed in to your class.
#
# == Authors
# 
# * Michael Granger <ged@FaerieMUD.org>
# 
# === Thanks To
#
# * The denizens of irc://irc.freenode.net/#ruby-lang, and especially dblack,
#   oGMo, and rubyhacker1 for name suggestions.
#
# == Copyright
#
# Copyright (c) 2003 The FaerieMUD Consortium. All rights reserved.
# 
# This module is free software. You may use, modify, and/or redistribute this
# software under the same terms as Ruby
# 
# This program is distributed in the hope that it will be useful, but WITHOUT
# ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
# FOR A PARTICULAR PURPOSE.
#
# == Version
#
#  $Id: crosscase.rb,v a63acb00f644 2005/07/13 19:58:43 ged $
# 


### A mixin which causes aliases for methods with either under_barred or
### camelCased naming conventions to be created in the opposing
### convention. E.g., in a class which mixes in CrossCase, defining a method
### which is called +foo_bar+ will also create an alias for that method called
### +fooBar+.
module CrossCase

	### Versioning constants
	Version = /([\d\.]+)/.match( %q{$Revision: a63acb00f644 $} )[1]
	Rcsid = %q$Id: crosscase.rb,v a63acb00f644 2005/07/13 19:58:43 ged $

	### The inclusion callback -- uses the Ouroboros trick to extend including
	### classes.
	def self::included( mod )
		mod.extend( self )
	end


	### Object-extension callback -- installs aliases for any currently-extant
	### class or instance methods, and installs callbacks that will create
	### aliases for any subsequently-defined methods. Raises an error if any
	### object except a Class or Module is extended.
	def self::extend_object( mod )
		raise TypeError, "Expected a Module or a Class, got a " +
			mod.class.name unless
			mod.is_a?( Module )

		self::transformClassMethods( mod )
		self::transformInstanceMethods( mod )
		self::installMethodHooks( mod )
	end


	### Install +method_added+ and +singleton_method_added+ hooks into the given
	### Module +mod+ which auto-generate aliases for new methods.
	def self::installMethodHooks( mod )
		mod.module_eval {
			class << self
				if respond_to?( :singleton_method_added )
					alias :__cc_sma :singleton_method_added
				end
				def singleton_method_added( id )
					if aliasName = CrossCase::transform( id )
						CrossCase::installClassAlias( self, id, aliasName )
					end
					if respond_to?( :__cc_sma )
						__cc_sma( id )
					else
						super
					end
				end

				if respond_to?( :method_added )
					alias :__cc_ma :method_added
				end					
				def method_added( id )
					if instance_methods( false ).include?( id.to_s ) &&
							( aliasName = CrossCase::transform(id) )
					CrossCase::installAlias( self, id, aliasName )
					end
					if respond_to?( :__cc_ma )
						__cc_ma( id )
					else
						super
					end
				end
			end
		}
	end


	### Search for and install aliases for either underbarred or camelCased
	### class methods for +mod+ (a Class or Module).
	def self::transformClassMethods( mod )
		self::findTargetMethods( mod.singleton_methods(false) ) {|meth, aliasName|
			self::installClassAlias( mod, meth, aliasName )
		}
	end


	### Install an alias +aliasName+ for the given class method +meth+ of the
	### Class or Module +mod+.
	def self::installClassAlias( mod, meth, aliasName )
		unless mod.respond_to?( aliasName )
			code = %{
				class << self; alias_method( :#{aliasName}, :#{meth} ); end
			}
			mod.module_eval( code, __FILE__, __LINE__ )
		end
	end


	### Search for and install aliases for either underbarred or camelCased
	### instance methods for +mod+ (a Class or Module).
	def self::transformInstanceMethods( mod )
		self::findTargetMethods( mod.instance_methods(false) ) {|meth, aliasName|
			self::installAlias( mod, meth, aliasName )
		}
	end


	### Install an alias +aliasName+ for the given instance method +meth+ of the
	### Class or Module +mod+.
	def self::installAlias( mod, meth, aliasName )
		unless mod.instance_methods(true).include?( aliasName )
			mod.module_eval %{alias_method :#{aliasName}, :#{meth}}
		end
	end	


	### Find methods in the given +methodList+ which are candidates for
	### aliasing.
	def self::findTargetMethods( *methodList )
		methodList.flatten.each {|meth|
			next if /(singleton_)?method_added/ =~ meth
			transformedName = transform( meth ) or next
			yield( meth, transformedName )
		}
	end


	### Return an alternate name for the given method id +mid+. If the method id
	### is an under_barred method, returns a camelCased version, and
	### vice-versa. If no alternate is called for, returns +nil+.
	def self::transform( mid )
		methodName = mid.to_s
		transformedName = ''
	
		# camelCased methods
		if /[A-Z]/.match( methodName ) && !/_/.match( methodName )
			transformedName = methodName.gsub( /([a-z0-9])([A-Z])/ ) {|match|
				$1 + '_' + $2
			}.downcase
			
		# underbarred_methods
		elsif !/A-Z/.match( methodName ) && /[a-z0-9]_[a-z]/.match( methodName )
			transformedName = methodName.gsub( /([a-z0-9])_([a-z])/ ) {|match|
				$1 + $2.upcase
			}

		else
			transformedName = nil
		end
		
		return transformedName
	end


end


if $0 == __FILE__
	require './utils'
	include UtilityFunctions
	$yaml = false

	class Foo #:nodoc:
		def self::singleton_method_added( id )
			$stderr.puts "Original sma: Added #{id} to #{self.inspect}"
		end

		def self::method_added( id )
			$stderr.puts "Original ma: Added #{id} to #{self.inspect}"
		end

		def self::classPreCamelMethod
			"classPreCamelMethod"
		end

		def self::class_pre_underbarred_method
			"class_pre_underbarred_method"
		end

		def preCamelCasedMethod
			"preCamelCasedMethod"
		end

		def pre_underbarred_method
			"pre_underbarred_method"
		end

		extend CrossCase

		def self::classCamelMethod
			"classCamelMethod"
		end

		def self::class_underbarred_method
			"class_underbarred_method"
		end

		def camelCasedMethod
			"camelCasedMethod"
		end

		def underbarred_method
			"underbarred_method"
		end
	end

	f = nil
	try( "to instantiate Foo" ) { f = Foo::new }
	%w{classPreCamelMethod class_pre_camel_method
		class_pre_underbarred_method classPreUnderbarredMethod
		classCamelMethod class_camel_method
		class_underbarred_method classUnderbarredMethod
		}.
		sort.each {|meth|
		try( "to call #{meth} on Foo" ) {
			Foo.send( meth )
		}
	}
	Foo.instance_methods(false).sort.each {|meth|
		try( "to call #{meth} on the instance of Foo" ) {
			f.send( meth )
		}
	}
end

