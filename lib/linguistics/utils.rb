#!/usr/bin/ruby
# coding: utf-8

require 'logger'
require 'erb'
require 'bigdecimal'
require 'date'

require 'linguistics'


module Linguistics # :nodoc:

	### A collection of ANSI color utility functions
	module ANSIColorUtilities

		# Set some ANSI escape code constants (Shamelessly stolen from Perl's
		# Term::ANSIColor by Russ Allbery <rra@stanford.edu> and Zenin <zenin@best.com>
		ANSI_ATTRIBUTES = {
			'clear'      => 0,
			'reset'      => 0,
			'bold'       => 1,
			'dark'       => 2,
			'underline'  => 4,
			'underscore' => 4,
			'blink'      => 5,
			'reverse'    => 7,
			'concealed'  => 8,

			'black'      => 30,   'on_black'   => 40,
			'red'        => 31,   'on_red'     => 41,
			'green'      => 32,   'on_green'   => 42,
			'yellow'     => 33,   'on_yellow'  => 43,
			'blue'       => 34,   'on_blue'    => 44,
			'magenta'    => 35,   'on_magenta' => 45,
			'cyan'       => 36,   'on_cyan'    => 46,
			'white'      => 37,   'on_white'   => 47
		}

		###############
		module_function
		###############

		### Create a string that contains the ANSI codes specified and return it
		def ansi_code( *attributes )
			attributes.flatten!
			attributes.collect! {|at| at.to_s }
			return '' unless /(?:vt10[03]|xterm(?:-color)?|linux|screen)/i =~ ENV['TERM']
			attributes = ANSI_ATTRIBUTES.values_at( *attributes ).compact.join(';')

			if attributes.empty? 
				return ''
			else
				return "\e[%sm" % attributes
			end
		end


		### Colorize the given +string+ with the specified +attributes+ and return it, handling 
		### line-endings, color reset, etc.
		def colorize( *args )
			string = ''

			if block_given?
				string = yield
			else
				string = args.shift
			end

			ending = string[/(\s)$/] || ''
			string = string.rstrip

			return ansi_code( args.flatten ) + string + ansi_code( 'reset' ) + ending
		end

	end # module ANSIColorUtilities


	# 
	# A alternate formatter for Logger instances.
	# 
	# == Usage
	# 
	#   require 'linguistics/utils'
	#   Linguistics.logger.formatter = Linguistics::LogFormatter.new( Linguistics.logger )
	# 
	# == Version
	#
	#  $Id$
	#
	# == Authors
	#
	# * Michael Granger <ged@FaerieMUD.org>
	#
	# :include: LICENSE
	#
	#--
	#
	# Please see the file LICENSE in the 'docs' directory for licensing details.
	#
	class LogFormatter < Logger::Formatter

		# The format to output unless debugging is turned on
		DEFAULT_FORMAT = "[%1$s.%2$06d %3$d/%4$s] %5$5s -- %7$s\n"

		# The format to output if debugging is turned on
		DEFAULT_DEBUG_FORMAT = "[%1$s.%2$06d %3$d/%4$s] %5$5s {%6$s} -- %7$s\n"


		### Initialize the formatter with a reference to the logger so it can check for log level.
		def initialize( logger, format=DEFAULT_FORMAT, debug=DEFAULT_DEBUG_FORMAT ) # :notnew:
			@logger       = logger
			@format       = format
			@debug_format = debug

			super()
		end

		######
		public
		######

		# The Logger object associated with the formatter
		attr_accessor :logger

		# The logging format string
		attr_accessor :format

		# The logging format string that's used when outputting in debug mode
		attr_accessor :debug_format


		### Log using either the DEBUG_FORMAT if the associated logger is at ::DEBUG level or
		### using FORMAT if it's anything less verbose.
		def call( severity, time, progname, msg )
			args = [
				time.strftime( '%Y-%m-%d %H:%M:%S' ),                         # %1$s
				time.usec,                                                    # %2$d
				Process.pid,                                                  # %3$d
				Thread.current == Thread.main ? 'main' : Thread.object_id,    # %4$s
				severity,                                                     # %5$s
				progname,                                                     # %6$s
				msg                                                           # %7$s
			]

			if @logger.level == Logger::DEBUG
				return self.debug_format % args
			else
				return self.format % args
			end
		end
	end # class LogFormatter


	# 
	# A ANSI-colorized formatter for Logger instances.
	# 
	# == Usage
	# 
	#   require 'linguistics/utils'
	#   Linguistics.logger.formatter = Linguistics::ColorLogFormatter.new( Linguistics.logger )
	# 
	# == Version
	#
	#  $Id$
	#
	# == Authors
	#
	# * Michael Granger <ged@FaerieMUD.org>
	#
	# :include: LICENSE
	#
	#--
	#
	# Please see the file LICENSE in the 'docs' directory for licensing details.
	#
	class ColorLogFormatter < Logger::Formatter
		extend Linguistics::ANSIColorUtilities

		# Color settings
		LEVEL_FORMATS = {
			:debug => colorize( :bold, :black ) {"[%1$s.%2$06d %3$d/%4$s] %5$5s {%6$s} -- %7$s\n"},
			:info  => colorize( :normal ) {"[%1$s.%2$06d %3$d/%4$s] %5$5s -- %7$s\n"},
			:warn  => colorize( :bold, :yellow ) {"[%1$s.%2$06d %3$d/%4$s] %5$5s -- %7$s\n"},
			:error => colorize( :red ) {"[%1$s.%2$06d %3$d/%4$s] %5$5s -- %7$s\n"},
			:fatal => colorize( :bold, :red, :on_white ) {"[%1$s.%2$06d %3$d/%4$s] %5$5s -- %7$s\n"},
		}


		### Initialize the formatter with a reference to the logger so it can check for log level.
		def initialize( logger, settings={} ) # :notnew:
			settings = LEVEL_FORMATS.merge( settings )

			@logger   = logger
			@settings = settings

			super()
		end

		######
		public
		######

		# The Logger object associated with the formatter
		attr_accessor :logger

		# The formats, by level
		attr_accessor :settings


		### Log using the format associated with the severity
		def call( severity, time, progname, msg )
			args = [
				time.strftime( '%Y-%m-%d %H:%M:%S' ),                         # %1$s
				time.usec,                                                    # %2$d
				Process.pid,                                                  # %3$d
				Thread.current == Thread.main ? 'main' : Thread.object_id,    # %4$s
				severity,                                                     # %5$s
				progname,                                                     # %6$s
				msg                                                           # %7$s
			]

			return self.settings[ severity.downcase.to_sym ] % args
		end
	end # class LogFormatter


	# 
	# An alternate formatter for Logger instances that outputs +div+ HTML
	# fragments.
	# 
	# == Usage
	# 
	#   require 'linguistics/utils'
	#   Linguistics.logger.formatter = Linguistics::HtmlLogFormatter.new( Linguistics.logger )
	# 
	# == Version
	#
	#  $Id$
	#
	# == Authors
	#
	# * Michael Granger <ged@FaerieMUD.org>
	#
	# :include: LICENSE
	#
	#--
	#
	# Please see the file LICENSE in the 'docs' directory for licensing details.
	#
	class HtmlLogFormatter < Logger::Formatter
		include ERB::Util  # for html_escape()

		# The default HTML fragment that'll be used as the template for each log message.
		HTML_LOG_FORMAT = %q{
		<div class="log-message %5$s">
			<span class="log-time">%1$s.%2$06d</span>
			[
				<span class="log-pid">%3$d</span>
				/
				<span class="log-tid">%4$s</span>
			]
			<span class="log-level">%5$s</span>
			:
			<span class="log-name">%6$s</span>
			<span class="log-message-text">%7$s</span>
		</div>
		}

		### Override the logging formats with ones that generate HTML fragments
		def initialize( logger, format=HTML_LOG_FORMAT ) # :notnew:
			@logger = logger
			@format = format
			super()
		end


		######
		public
		######

		# The HTML fragment that will be used as a format() string for the log
		attr_accessor :format


		### Return a log message composed out of the arguments formatted using the
		### formatter's format string
		def call( severity, time, progname, msg )
			args = [
				time.strftime( '%Y-%m-%d %H:%M:%S' ),                         # %1$s
				time.usec,                                                    # %2$d
				Process.pid,                                                  # %3$d
				Thread.current == Thread.main ? 'main' : Thread.object_id,    # %4$s
				severity.downcase,                                                     # %5$s
				progname,                                                     # %6$s
				html_escape( msg ).gsub(/\n/, '<br />')                       # %7$s
			]

			return self.format % args
		end

	end # class HtmlLogFormatter

end # module Linguistics

# vim: set nosta noet ts=4 sw=4:

