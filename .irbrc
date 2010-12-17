#!/usr/bin/ruby -*- ruby -*-

BEGIN {
	require 'pathname'
	basedir = Pathname.new( __FILE__ ).dirname.expand_path
	libdir = basedir + "lib"

	puts ">>> Adding #{libdir} to load path..."
	$LOAD_PATH.unshift( libdir.to_s )
}

require 'English'

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

### Create a string that contains the ANSI codes specified and return it
def ansi_code( *attributes )
	attributes.flatten!
	attributes.collect! {|at| at.to_s }
	# $stderr.puts "Returning ansicode for TERM = %p: %p" %
	# 	[ ENV['TERM'], attributes ]
	return '' unless /(?:vt10[03]|xterm(?:-color)?|linux|screen)/i =~ ENV['TERM']
	attributes = ANSI_ATTRIBUTES.values_at( *attributes ).compact.join(';')

	# $stderr.puts "  attr is: %p" % [attributes]
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


### Try to match the specified +str+ with the given +re+, printing out the result.
def try_regexp( str, re )
	if str =~ re
		puts "  #$PREMATCH",
		     "  " + colorize( 'bold', 'green' ) { $MATCH },
		     "  #$POSTMATCH"
	else
		puts colorize( "Nope.", 'red' )
	end
end

IRB.conf[:PROMPT][:manual] = {
    :PROMPT_I => "irb> ",
    :PROMPT_S => "... ",
    :PROMPT_C => "* ",
    :RETURN => "# => %s\n"      # format to return value
}
IRB.conf[:PROMPT_MODE] = :manual

# class FilteringOutputMethod < IRB::OutputMethod
# 
# 	REPLACEMENTS = {
# 		/\blaika\b/i   => 'acme',
# 		/\bljc\b/i     => 'sales',
# 		/\badtech2\b/i => 'marketing',
# 	}
# 
# 	def print( *opts )
# 		opts.each do |opt|
# 			REPLACEMENTS.each do |pat, repl|
# 				opt.gsub!( pat, repl )
# 			end
# 			$stdout.print( opt )
# 		end
# 	end
# end
# IRB.conf[:OUTPUT_MODE]


begin
	$stderr.puts "Loading Linguistics..."
	require 'linguistics'
	Linguistics.use( :en )
rescue => e
	$stderr.puts "Ack! Linguistics library failed to load: #{e.message}\n\t" +
		e.backtrace.join( "\n\t" )
end

