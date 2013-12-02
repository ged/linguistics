#!/usr/bin/ruby
#
# Experiment to work out the implementation of sprintf-like formatting.
#
# Conclusion: re-opening the module doesn't work well, but I've added it to
# en.rb, and it seems to work quite well for most cases. Still having trouble
# with 'CONJUNCT'.
#
# Time-stamp: <31-Oct-2005 06:11:43 ged>
#

BEGIN {
	base = File::dirname( File::dirname(File::expand_path(__FILE__)) )
	$LOAD_PATH.unshift "#{base}/lib"

	require "#{base}/utils.rb"
	include UtilityFunctions
}

require 'linguistics'

Linguistics::use( :en, :classes => [String,Array] )

module Linguistics::EN

	module_function
	def lprintf( fmt, *args )
		fmt.to_s.gsub( /%([A-Z_]+)/ ) do |match|
			op = $1
			case op
			when 'PL'
				args.shift.en.plural
			when 'A', 'AN'
				args.shift.en.a
			when 'NO'
				args.shift.en.no
			when 'CONJUNCT'
				args.shift.en.conjunction
			else
				raise "no such formatter %p" % op
			end
		end
	end

end

try( '"How many %PL do you want?".en.lprintf("monkey")' )


