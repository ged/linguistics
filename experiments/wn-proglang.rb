#!/usr/bin/ruby

BEGIN {
	$LOAD_PATH.unshift File::dirname(File::dirname( __FILE__ )) + "/lib"
	require 'linguistics'
}

Linguistics::use( :en )
unless Linguistics::EN::haveWordnet?

# Demo of WordNet integration.

"programming language".en.gloss
