#!/usr/bin/ruby

require 'rbconfig'
require 'erb'
require 'etc'
require 'logger'

require 'linguistics'


#--
# A collection of mixins shared between Linguistics modules.
#
module Linguistics # :nodoc:

	### A collection of various delegation code-generators that can be used to define
	### delegation through other methods, to instance variables, etc.
	module Delegation

		#######
		private
		#######

		### Make the body of a delegator method that will delegate to the +name+ method
		### of the object returned by the +delegate+ method.
		def make_method_delegator( delegate, name )
			error_frame = caller(4)[0]
			file, line = error_frame.split( ':', 2 )

			# Ruby can't parse obj.method=(*args), so we have to special-case setters...
			if name.to_s =~ /(\w+)=$/
				name = $1
				code = <<-END_CODE
				lambda {|*args| self.#{delegate}.#{name} = *args }
				END_CODE
			else
				code = <<-END_CODE
				lambda {|*args| self.#{delegate}.#{name}(*args) }
				END_CODE
			end

			return eval( code, nil, file, line.to_i )
		end


		### Make the body of a delegator method that will delegate calls to the +name+
		### method to the given +ivar+.
		def make_ivar_delegator( ivar, name )
			error_frame = caller(4)[0]
			file, line = error_frame.split( ':', 2 )

			# Ruby can't parse obj.method=(*args), so we have to special-case setters...
			if name.to_s =~ /(\w+)=$/
				name = $1
				code = <<-END_CODE
				lambda {|*args| #{ivar}.#{name} = *args }
				END_CODE
			else
				code = <<-END_CODE
				lambda {|*args| #{ivar}.#{name}(*args) }
				END_CODE
			end

			return eval( code, nil, file, line.to_i )
		end


		###############
		module_function
		###############

		### Define the given +delegated_methods+ as delegators to the like-named method
		### of the return value of the +delegate_method+. Example:
		### 
		###    class MyClass
		###      extend Linguistics::Delegation
		###      
		###      # Delegate the #bound?, #err, and #result2error methods to the connection
		###      # object returned by the #connection method. This allows the connection
		###      # to still be loaded on demand/overridden/etc.
		###      def_method_delegators :connection, :bound?, :err, :result2error
		###      
		###      def connection
		###        @connection ||= self.connect
		###      end
		###    end
		### 
		def def_method_delegators( delegate_method, *delegated_methods )
			delegated_methods.each do |name|
				body = make_method_delegator( delegate_method, name )
				define_method( name, &body )
			end
		end


		### Define the given +delegated_methods+ as delegators to the like-named method
		### of the specified +ivar+. This is pretty much identical with how 'Forwardable'
		### from the stdlib does delegation, but it's reimplemented here for consistency.
		### 
		###    class MyClass
		###      extend Linguistics::Delegation
		###      
		###      # Delegate the #each method to the @collection ivar
		###      def_ivar_delegators :@collection, :each
		###      
		###    end
		### 
		def def_ivar_delegators( ivar, *delegated_methods )
			delegated_methods.each do |name|
				body = make_ivar_delegator( ivar, name )
				define_method( name, &body )
			end
		end


	end # module Delegation


	### Add logging to a Linguistics class. Including classes get #log and #log_debug methods.
	module Loggable

		LEVEL = {
			:debug => Logger::DEBUG,
			:info  => Logger::INFO,
			:warn  => Logger::WARN,
			:error => Logger::ERROR,
			:fatal => Logger::FATAL,
		  }

		### A logging proxy class that wraps calls to the logger into calls that include
		### the name of the calling class.
		class ClassNameProxy # :nodoc:

			### Create a new proxy for the given +klass+.
			def initialize( klass, force_debug=false )
				@classname   = klass.name
				@force_debug = force_debug
			end

			### Delegate calls the global logger with the class name as the 'progname' 
			### argument.
			def method_missing( sym, msg=nil, &block )
				return super unless LEVEL.key?( sym )
				sym = :debug if @force_debug
				Linguistics.logger.add( LEVEL[sym], msg, @classname, &block )
			end
		end # ClassNameProxy

		#########
		protected
		#########

		### Copy constructor -- clear the original's log proxy.
		def initialize_copy( original )
			@log_proxy = @log_debug_proxy = nil
			super
		end

		### Return the proxied logger.
		def log
			@log_proxy ||= ClassNameProxy.new( self.class )
		end

		### Return a proxied "debug" logger that ignores other level specification.
		def log_debug
			@log_debug_proxy ||= ClassNameProxy.new( self.class, true )
		end
	end # module Loggable

end # module Linguistics

# vim: set nosta noet ts=4 sw=4:

