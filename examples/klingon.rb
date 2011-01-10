#!/usr/bin/env ruby -w

require 'linguistics'

# An example language module that provides Klingon-language inflecton.
module Linguistics::TLH

	Linguistics.register_language( :tlh, self )

end


