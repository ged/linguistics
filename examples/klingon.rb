#!/usr/bin/env ruby -w

require 'linguistics'

# An example of how you'd start writing a language module that provides
# Klingon-language inflecton.  It's obviously not really a useful
# implementation.

module Linguistics::TLH

	# Register the module with the framework
	Linguistics.register_language( :tlh, self )

end


if __FILE__ == $0
	require 'pp'
	Linguistics.use( :tlh, :classes => [Object] )
	pp Object.new.tlh
end

