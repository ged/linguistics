#!/usr/bin/ruby

require 'linguistics'
require 'linguistics/en'

# This file contains functions for constructing words out of numbers.
# 
# == Version
#
#  $Id: numbers.rb,v 485369a7d3ac 2010/03/02 06:33:58 ged $
# 
# == Authors
# 
# * Michael Granger <ged@FaerieMUD.org>
#    
# :include: LICENSE
# 
#---
#
# Please see the file LICENSE in the base directory for licensing details for the 
# Ruby port.
#
module Linguistics::EN::Numbers

	# Register this module to the list of modules to include
	Linguistics::EN.register_extension( self )

	# :stopdoc:

end # module Linguistics::EN::Numbers

