#!/usr/bin/ruby

require 'linguistics'
require 'linguistics/en'

# This file contains functions for constructing words out of numbers.
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

