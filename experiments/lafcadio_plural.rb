#!/usr/bin/ruby
#
# Experimenting with Lafcadio's pluralization algorithm
# 
# Time-stamp: <13-Jul-2005 08:37:00 ged>
#

BEGIN {
	base = File::dirname( File::dirname(File::expand_path(__FILE__)) )
	$LOAD_PATH.unshift "#{base}/lib"

	require "#{base}/utils.rb"
	include UtilityFunctions

	require 'linguistics'
}

$yaml = false
Linguistics::use( :en )

def plural(singular)
	consonantYPattern = Regexp.new("([^aeiou])y$", Regexp::IGNORECASE)
	if singular =~ consonantYPattern
		singular.gsub consonantYPattern, '\1ies'
	elsif singular =~ /[xs]$/
		singular + "es"
	else
		singular + "s"
	end
end

Words = %w[tree fairy address opus mythos child persona datum nucleus
           phenomenon commando radix seraph nexus series dais trellis ]

Words.each do |word|
	puts "%s vs. %s" % [plural(word), word.en.plural]
end




