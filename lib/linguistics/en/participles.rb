#!/usr/bin/ruby

require 'linguistics/en' unless defined?( Linguistics::EN )

# Methods for deriving present participles for the English-language
# Linguistics module.
module Linguistics::EN::Participles

	# Register this module to the list of modules to include
	Linguistics::EN.register_extension( self )


	### Attempt to return the inflected string in its present participle
	### form (e.g., talked -> talking).
	def present_participle
        plural = self.to_s.en.plural_verb

		plural.sub!( /ie$/, 'y' ) or
			plural.sub!( /ue$/, 'u' ) or
			plural.sub!( /([auy])e$/, '$1' ) or
			plural.sub!( /i$/, '' ) or
			plural.sub!( /([^e])e$/, "\\1" ) or
			/er$/.match( plural ) or
			plural.sub!( /([^aeiou][aeiouy]([bdgmnprst]))$/, "\\1\\2" )

        return "#{plural}ing"
	end
	alias_method :part_pres, :present_participle
	Linguistics::EN.register_lprintf_formatter :PART_PRES, :present_participle


end # module Linguistics::EN::Participles

