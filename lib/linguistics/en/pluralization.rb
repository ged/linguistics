#!/usr/bin/env ruby

require 'linguistics'
require 'linguistics/en'

# This module contains plural inflections for the English-language
# module of the Linguistics library.
# 
# It provides conversion of plural forms of all nouns, most verbs,
# and some adjectives. It also provides "classical" variants (for
# example: "brother" -> "brethren", "dogma" -> "dogmata", etc.) where
# appropriate.
# 
# These can be accessed via the #plural, #plural_noun, #plural_verb,
# and #plural_adjective methods.
# 
# == Version
#
#  $Id: linkparser.rb 99 2008-09-06 05:20:07Z deveiant $
# 
# == Authors
# 
# * Martin Chase <stillflame@FaerieMUD.org>
# * Michael Granger <ged@FaerieMUD.org>
# 
# :include: LICENSE
#
#--
#
# Please see the file LICENSE in the base directory for licensing details.
#
module Linguistics::EN::Pluralization

	# Register this module to the list of modules to include
	Linguistics::EN.register_extension( self )

	### Utility function for creating Regexp unions
	def self::matchgroup( *parts )
		return Regexp.union( *(parts.flatten) )
	end
	private_class_method :matchgroup

	#
	# Plurals
	#

	PL_sb_irregular_s = {
		"ephemeris"	=> "ephemerides",
		"iris"		=> "irises|irides",
		"clitoris"	=> "clitorises|clitorides",
		"corpus"	=> "corpuses|corpora",
		"opus"		=> "opuses|opera",
		"genus"		=> "genera",
		"mythos"	=> "mythoi",
		"penis"		=> "penises|penes",
		"testis"	=> "testes",
	}

	PL_sb_irregular_h = {
		"child"		=> "children",
		"brother"	=> "brothers|brethren",
		"loaf"		=> "loaves",
		"hoof"		=> "hoofs|hooves",
		"beef"		=> "beefs|beeves",
		"money"		=> "monies",
		"mongoose"	=> "mongooses",
		"ox"		=> "oxen",
		"cow"		=> "cows|kine",
		"soliloquy"	=> "soliloquies",
		"graffito"	=> "graffiti",
		"prima donna"	=> "prima donnas|prime donne",
		"octopus"	=> "octopuses|octopodes",
		"genie"		=> "genies|genii",
		"ganglion"	=> "ganglions|ganglia",
		"trilby"	=> "trilbys",
		"turf"		=> "turfs|turves",
	}.update( PL_sb_irregular_s )
	PL_sb_irregular = matchgroup PL_sb_irregular_h.keys


	# Classical "..a" -> "..ata"
	PL_sb_C_a_ata = matchgroup %w[
		anathema bema carcinoma charisma diploma
		dogma drama edema enema enigma lemma
		lymphoma magma melisma miasma oedema
		sarcoma schema soma stigma stoma trauma
		gumma pragma
	].collect {|word| word[0...-1]}

	# Unconditional "..a" -> "..ae"
	PL_sb_U_a_ae = matchgroup %w[
		alumna alga vertebra persona
	]

	# Classical "..a" -> "..ae"
	PL_sb_C_a_ae = matchgroup %w[
		amoeba antenna formula hyperbola
		medusa nebula parabola abscissa
		hydra nova lacuna aurora .*umbra
		flora fauna
	]

	# Classical "..en" -> "..ina"
	PL_sb_C_en_ina = matchgroup %w[
		stamen	foramen	lumen
	].collect {|word| word[0...-2] }

	# Unconditional "..um" -> "..a"
	PL_sb_U_um_a = matchgroup %w[
		bacterium	agendum	desideratum	erratum
		stratum	datum	ovum		extremum
		candelabrum
	].collect {|word| word[0...-2] }

	# Classical "..um" -> "..a"
	PL_sb_C_um_a = matchgroup %w[
		maximum	minimum	momentum	optimum
		quantum	cranium	curriculum	dictum
		phylum	aquarium	compendium	emporium
		enconium	gymnasium	honorarium	interregnum
		lustrum 	memorandum	millenium 	rostrum 
		spectrum	speculum	stadium	trapezium
		ultimatum	medium	vacuum	velum 
		consortium
	].collect {|word| word[0...-2]}

	# Unconditional "..us" -> "i"
	PL_sb_U_us_i = matchgroup %w[
		alumnus	alveolus	bacillus	bronchus
		locus	nucleus	stimulus	meniscus
	].collect {|word| word[0...-2]}

	# Classical "..us" -> "..i"
	PL_sb_C_us_i = matchgroup %w[
		focus	radius	genius
		incubus	succubus	nimbus
		fungus	nucleolus	stylus
		torus	umbilicus	uterus
		hippopotamus
	].collect {|word| word[0...-2]}

	# Classical "..us" -> "..us"  (assimilated 4th declension latin nouns)
	PL_sb_C_us_us = matchgroup %w[
		status apparatus prospectus sinus
		hiatus impetus plexus
	]

	# Unconditional "..on" -> "a"
	PL_sb_U_on_a = matchgroup %w[
		criterion	perihelion	aphelion
		phenomenon	prolegomenon	noumenon
		organon	asyndeton	hyperbaton
	].collect {|word| word[0...-2]}

	# Classical "..on" -> "..a"
	PL_sb_C_on_a = matchgroup %w[
		oxymoron
	].collect {|word| word[0...-2]}

	# Classical "..o" -> "..i"  (but normally -> "..os")
	PL_sb_C_o_i_a = %w[
		solo		soprano	basso	alto
		contralto	tempo	piano
	]
	PL_sb_C_o_i = matchgroup PL_sb_C_o_i_a.collect{|word| word[0...-1]}

	# Always "..o" -> "..os"
	PL_sb_U_o_os = matchgroup( %w[
		albino	archipelago	armadillo
		commando	crescendo	fiasco
		ditto	dynamo	embryo
		ghetto	guano	inferno
		jumbo	lumbago	magneto
		manifesto	medico	octavo
		photo	pro		quarto	
		canto	lingo	generalissimo
		stylo	rhino
	] | PL_sb_C_o_i_a )


	# Unconditional "..[ei]x" -> "..ices"
	PL_sb_U_ex_ices = matchgroup %w[
		codex	murex	silex
	].collect {|word| word[0...-2]}
	PL_sb_U_ix_ices = matchgroup %w[
		radix	helix
	].collect {|word| word[0...-2]}

	# Classical "..[ei]x" -> "..ices"
	PL_sb_C_ex_ices = matchgroup %w[
		vortex	vertex	cortex	latex
		pontifex	apex		index	simplex
	].collect {|word| word[0...-2]}
	PL_sb_C_ix_ices = matchgroup %w[
		appendix
	].collect {|word| word[0...-2]}


	# Arabic: ".." -> "..i"
	PL_sb_C_i = matchgroup %w[
		afrit	afreet	efreet
	]


	# Hebrew: ".." -> "..im"
	PL_sb_C_im = matchgroup %w[
		goy		seraph	cherub
	]

	# Unconditional "..man" -> "..mans"
	PL_sb_U_man_mans = matchgroup %w[
		human
		Alabaman Bahaman Burman German
		Hiroshiman Liman Nakayaman Oklahoman
		Panaman Selman Sonaman Tacoman Yakiman
		Yokohaman Yuman
	]


	PL_sb_uninflected_s = [
		# Pairs or groups subsumed to a singular...
		"breeches", "britches", "clippers", "gallows", "hijinks",
		"headquarters", "pliers", "scissors", "testes", "herpes",
		"pincers", "shears", "proceedings", "trousers",

		# Unassimilated Latin 4th declension
		"cantus", "coitus", "nexus",

		# Recent imports...
		"contretemps", "corps", "debris",
		".*ois",

		# Diseases
		".*measles", "mumps",

		# Miscellaneous others...
		"diabetes", "jackanapes", "series", "species", "rabies",
		"chassis", "innings", "news", "mews",
	]


	# Don't inflect in classical mode, otherwise normal inflection
	PL_sb_uninflected_herd = matchgroup %w[
		wildebeest swine eland bison buffalo
		elk moose rhinoceros
	]

	PL_sb_uninflected = matchgroup [

		# Some fish and herd animals
		".*fish", "tuna", "salmon", "mackerel", "trout",
		"bream", "sea[- ]bass", "carp", "cod", "flounder", "whiting", 

		".*deer", ".*sheep", 

		# All nationals ending in -ese
		"Portuguese", "Amoyese", "Borghese", "Congoese", "Faroese",
		"Foochowese", "Genevese", "Genoese", "Gilbertese", "Hottentotese",
		"Kiplingese", "Kongoese", "Lucchese", "Maltese", "Nankingese",
		"Niasese", "Pekingese", "Piedmontese", "Pistoiese", "Sarawakese",
		"Shavese", "Vermontese", "Wenchowese", "Yengeese",
		".*[nrlm]ese",

		# Some words ending in ...s (often pairs taken as a whole)
		PL_sb_uninflected_s,

		# Diseases
		".*pox",

		# Other oddities
		"graffiti", "djinn"
	]


	# Singular words ending in ...s (all inflect with ...es)
	PL_sb_singular_s = matchgroup %w[
		.*ss
		acropolis aegis alias arthritis asbestos atlas
		bathos bias bronchitis bursitis caddis cannabis
		canvas chaos cosmos dais digitalis encephalitis
		epidermis ethos eyas gas glottis hepatitis
		hubris ibis lens mantis marquis metropolis
		neuritis pathos pelvis polis rhinoceros
		sassafras tonsillitis trellis .*us
	]

	PL_v_special_s = matchgroup [
		PL_sb_singular_s,
		PL_sb_uninflected_s,
		PL_sb_irregular_s.keys,
		'(.*[csx])is',
		'(.*)ceps',
		'[A-Z].*s',
	]

	PL_sb_postfix_adj = '(' + {

		'general' => '(?!major|lieutenant|brigadier|adjutant)\S+',
		'martial' => "court",

	}.collect {|key,val|
		"(?:#{val})(?=(?:-|\\s+)#{key})"
	}.join("|") + ")(.*)"


	PL_sb_military = %r'major|lieutenant|brigadier|adjutant|quartermaster'
	PL_sb_general = %r'((?!#{PL_sb_military.source}).*?)((-|\s+)general)'

	PL_prep = matchgroup %w[
		about above across after among around at athwart before behind
		below beneath beside besides between betwixt beyond but by
		during except for from in into near of off on onto out over
		since till to under until unto upon with
	]

	PL_sb_prep_dual_compound = %r'(.*?)((?:-|\s+)(?:#{PL_prep}|d[eu])(?:-|\s+))a(?:-|\s+)(.*)'
	PL_sb_prep_compound = %r'(.*?)((-|\s+)(#{PL_prep}|d[eu])((-|\s+)(.*))?)'


	PL_pron_nom_h = {
		#	Nominative		Reflexive
		"i"		=> "we",	"myself"   =>	"ourselves",
		"you"	=> "you",	"yourself" =>	"yourselves",
		"she"	=> "they",	"herself"  =>	"themselves",
		"he"	=> "they",	"himself"  =>	"themselves",
		"it"	=> "they",	"itself"   =>	"themselves",
		"they"	=> "they",	"themself" =>	"themselves",

		#	Possessive
		"mine"	 => "ours",
		"yours"	 => "yours",
		"hers"	 => "theirs",
		"his"	 => "theirs",
		"its"	 => "theirs",
		"theirs" => "theirs",
	}
	PL_pron_nom = matchgroup PL_pron_nom_h.keys

	PL_pron_acc_h = {
		#	Accusative		Reflexive
		"me"	=> "us",	"myself"   =>	"ourselves",
		"you"	=> "you",	"yourself" =>	"yourselves",
		"her"	=> "them",	"herself"  =>	"themselves",
		"him"	=> "them",	"himself"  =>	"themselves",
		"it"	=> "them",	"itself"   =>	"themselves",
		"them"	=> "them",	"themself" =>	"themselves",
	}
	PL_pron_acc = matchgroup PL_pron_acc_h.keys

	PL_v_irregular_pres_h = {
		#	1St pers. sing.		2nd pers. sing.		3rd pers. singular
		#				3rd pers. (indet.)	
		"am"	=> "are",	"are"	=> "are",	"is"	 => "are",
		"was"	=> "were",	"were"	=> "were",	"was"	 => "were",
		"have"  => "have",	"have"  => "have",	"has"	 => "have",
	}
	PL_v_irregular_pres = matchgroup PL_v_irregular_pres_h.keys

	PL_v_ambiguous_pres_h = {
		#	1st pers. sing.		2nd pers. sing.		3rd pers. singular
		#				3rd pers. (indet.)	
		"act"	=> "act",	"act"	=> "act",	"acts"	  => "act",
		"blame"	=> "blame",	"blame"	=> "blame",	"blames"  => "blame",
		"can"	=> "can",	"can"	=> "can",	"can"	  => "can",
		"must"	=> "must",	"must"	=> "must",	"must"	  => "must",
		"fly"	=> "fly",	"fly"	=> "fly",	"flies"	  => "fly",
		"copy"	=> "copy",	"copy"	=> "copy",	"copies"  => "copy",
		"drink"	=> "drink",	"drink"	=> "drink",	"drinks"  => "drink",
		"fight"	=> "fight",	"fight"	=> "fight",	"fights"  => "fight",
		"fire"	=> "fire",	"fire"	=> "fire",	"fires"   => "fire",
		"like"	=> "like",	"like"	=> "like",	"likes"   => "like",
		"look"	=> "look",	"look"	=> "look",	"looks"   => "look",
		"make"	=> "make",	"make"	=> "make",	"makes"   => "make",
		"reach"	=> "reach",	"reach"	=> "reach",	"reaches" => "reach",
		"run"	=> "run",	"run"	=> "run",	"runs"    => "run",
		"sink"	=> "sink",	"sink"	=> "sink",	"sinks"   => "sink",
		"sleep"	=> "sleep",	"sleep"	=> "sleep",	"sleeps"  => "sleep",
		"view"	=> "view",	"view"	=> "view",	"views"   => "view",
	}
	PL_v_ambiguous_pres = matchgroup PL_v_ambiguous_pres_h.keys

	PL_v_irregular_non_pres = matchgroup %w[
		did had ate made put 
		spent fought sank gave sought
		shall could ought should
	]

	PL_v_ambiguous_non_pres = matchgroup %w[
		thought saw bent will might cut
	]

	PL_count_zero = matchgroup %w[
		0 no zero nil
	]

	PL_count_one = matchgroup %w[
		1 a an one each every this that
	]

	PL_adj_special_h = {
		"a"    => "some",	"an"   =>  "some",
		"this" => "these",	"that" => "those",
	}
	PL_adj_special = matchgroup PL_adj_special_h.keys

	PL_adj_poss_h = {
		"my"    => "our",
		"your"	=> "your",
		"its"	=> "their",
		"her"	=> "their",
		"his"	=> "their",
		"their"	=> "their",
	}
	PL_adj_poss = matchgroup PL_adj_poss_h.keys


	#################################################################
	###	P U B L I C   F U N C T I O N S
	#################################################################

	### Return the plural of the given +phrase+ if +count+ indicates it should
	### be plural.
	def plural( count=nil )
		phrase = if self.is_a?( Numeric )
			numwords( self )
		else
			self.to_s
		end

		md = /\A(\s*)(.+?)(\s*)\Z/.match( phrase.to_s )
		pre, word, post = md.to_a[1,3]
		return phrase if word.nil? or word.empty?

		plural = postprocess( word,
			pluralize_special_adjective(word, count) ||
			pluralize_special_verb(word, count) ||
			pluralize_noun(word, count) )

		return pre + plural + post
	end


	### Return the plural of the given noun +phrase+ if +count+ indicates it
	### should be plural.
	def plural_noun( phrase, count=nil )
		md = /\A(\s*)(.+?)(\s*)\Z/.match( phrase.to_s )
		pre, word, post = md.to_a[1,3]
		return phrase if word.nil? or word.empty?

		plural = postprocess( word, pluralize_noun(word, count) )
		return pre + plural + post
	end


	### Return the plural of the given verb +phrase+ if +count+ indicates it
	### should be plural.
	def plural_verb( phrase, count=nil )
		md = /\A(\s*)(.+?)(\s*)\Z/.match( phrase.to_s )
		pre, word, post = md.to_a[1,3]
		return phrase if word.nil? or word.empty?

		plural = postprocess( word,
			pluralize_special_verb(word, count) ||
			pluralize_general_verb(word, count) )
		return pre + plural + post
	end


	### Return the plural of the given adjectival +phrase+ if +count+ indicates
	### it should be plural.
	def plural_adjective( phrase, count=nil )
		md = /\A(\s*)(.+?)(\s*)\Z/.match( phrase.to_s )
		pre, word, post = md.to_a[1,3]
		return phrase if word.nil? or word.empty?

		plural = postprocess( word,
			pluralize_special_adjective(word, count) || word )
		return pre + plural + post
	end
	alias_method :plural_adj, :plural_adjective


	#################################################################
	###	P R I V A T E   F U N C T I O N S
	#################################################################

	#######
	private
	#######

	### Do normal/classical switching and match capitalization in <tt>inflected</tt> by
	### examining the <tt>original</tt> input.
	def postprocess( original, inflected )
		inflected.sub!( /([^|]+)\|(.+)/ ) do
			Linguistics.classical? ? $2 : $1
		end

		case original
		when "I"
			return inflected
		when /^[A-Z]+$/
			return inflected.upcase
		when /^[A-Z]/
			# Can't use #capitalize, as it will downcase the rest of the string,
			# too.
			inflected[0,1] = inflected[0,1].upcase
			return inflected
		else
			return inflected
		end
	end


	### Normalize a count to either 1 or 2 (singular or plural)
	def normalize_count( count, default=2 )
		return default if count.nil? # Default to plural
		if /^(#{PL_count_one})$/i =~ count.to_s ||
		   ( Linguistics.classical? && /^(#{PL_count_zero})$/ =~ count.to_s )
			return 1
		else
			return default
		end
	end


	### Pluralize nouns
	def pluralize_noun( word, count=nil )
		value = nil
		count ||= Linguistics.num
		count = normalize_count( count )

		return word if count == 1

		# Handle user-defined nouns
		#if value = ud_match( word, PL_sb_user_defined )
		#	return value
		#end

		# Handle empty word, singular count and uninflected plurals
		case word
		when ''
			return word
		when /^(#{PL_sb_uninflected})$/i
			return word
		else
			if Linguistics.classical? &&
			   /^(#{PL_sb_uninflected_herd})$/i =~ word
				return word
			end
		end

		# Handle compounds ("Governor General", "mother-in-law", "aide-de-camp", etc.)
		case word
		when /^(?:#{PL_sb_postfix_adj})$/i
			value = $2
			return pluralize_noun( $1, 2 ) + value

		when /^(?:#{PL_sb_prep_dual_compound})$/i
			value = [ $2, $3 ] 
			return pluralize_noun( $1, 2 ) + value[0] + pluralize_noun( value[1] )

		when /^(?:#{PL_sb_prep_compound})$/i
			value = $2 
			return pluralize_noun( $1, 2 ) + value

		# Handle pronouns
		when /^((?:#{PL_prep})\s+)(#{PL_pron_acc})$/i
			return $1 + PL_pron_acc_h[ $2.downcase ]

		when /^(#{PL_pron_nom})$/i
			return PL_pron_nom_h[ word.downcase ]

		when /^(#{PL_pron_acc})$/i
			return PL_pron_acc_h[ $1.downcase ]

		# Handle isolated irregular plurals 
		when /(.*)\b(#{PL_sb_irregular})$/i
			return $1 + PL_sb_irregular_h[ $2.downcase ]

		when /(#{PL_sb_U_man_mans})$/i
			return "#{$1}s"

		# Handle families of irregular plurals
		when /(.*)man$/i then                  return "#{$1}men"
		when /(.*[ml])ouse$/i then             return "#{$1}ice"
		when /(.*)goose$/i then                return "#{$1}geese"
		when /(.*)tooth$/i then                return "#{$1}teeth"
		when /(.*)foot$/i then                 return "#{$1}feet"

		# Handle unassimilated imports
		when /(.*)ceps$/i then                 return word
		when /(.*)zoon$/i then                 return "#{$1}zoa"
		when /(.*[csx])is$/i then              return "#{$1}es"
		when /(#{PL_sb_U_ex_ices})ex$/i then   return "#{$1}ices"
		when /(#{PL_sb_U_ix_ices})ix$/i then   return "#{$1}ices"
		when /(#{PL_sb_U_um_a})um$/i then      return "#{$1}a"
		when /(#{PL_sb_U_us_i})us$/i then      return "#{$1}i"
		when /(#{PL_sb_U_on_a})on$/i then      return "#{$1}a"
		when /(#{PL_sb_U_a_ae})$/i then        return "#{$1}e"
		end

		# Handle incompletely assimilated imports
		if Linguistics.classical?
			case word
			when /(.*)trix$/i then               return "#{$1}trices"
			when /(.*)eau$/i then                return "#{$1}eaux"
			when /(.*)ieu$/i then                return "#{$1}ieux"
			when /(.{2,}[yia])nx$/i then         return "#{$1}nges"
			when /(#{PL_sb_C_en_ina})en$/i then  return "#{$1}ina"
			when /(#{PL_sb_C_ex_ices})ex$/i then return "#{$1}ices"
			when /(#{PL_sb_C_ix_ices})ix$/i then return "#{$1}ices"
			when /(#{PL_sb_C_um_a})um$/i then    return "#{$1}a"
			when /(#{PL_sb_C_us_i})us$/i then    return "#{$1}i"
			when /(#{PL_sb_C_us_us})$/i then     return "#{$1}"
			when /(#{PL_sb_C_a_ae})$/i then      return "#{$1}e"
			when /(#{PL_sb_C_a_ata})a$/i then    return "#{$1}ata"
			when /(#{PL_sb_C_o_i})o$/i then      return "#{$1}i"
			when /(#{PL_sb_C_on_a})on$/i then    return "#{$1}a"
			when /#{PL_sb_C_im}$/i then          return "#{word}im"
			when /#{PL_sb_C_i}$/i then           return "#{word}i"
			end
		end


		# Handle singular nouns ending in ...s or other silibants
		case word
		when /^(#{PL_sb_singular_s})$/i then    return "#{$1}es"
		when /^([A-Z].*s)$/ then                return "#{$1}es"
		when /(.*)([cs]h|[zx])$/i then          return "#{$1}#{$2}es"
		# when /(.*)(us)$/i then                return "#{$1}#{$2}es"

		# Handle ...f -> ...ves
		when /(.*[eao])lf$/i then              return "#{$1}lves"; 
		when /(.*[^d])eaf$/i then              return "#{$1}eaves"
		when /(.*[nlw])ife$/i then             return "#{$1}ives"
		when /(.*)arf$/i then                  return "#{$1}arves"

		# Handle ...y
		when /(.*[aeiou])y$/i then             return "#{$1}ys"
		when /([A-Z].*y)$/ then                return "#{$1}s"
		when /(.*)y$/i then                    return "#{$1}ies"

		# Handle ...o
		when /#{PL_sb_U_o_os}$/i then          return "#{word}s"
		when /[aeiou]o$/i then                 return "#{word}s"
		when /o$/i then                        return "#{word}es"

		# Otherwise just add ...s
		else
			return "#{word}s"
		end
	end # def pluralize_noun



	### Pluralize special verbs
	def pluralize_special_verb( word, count )
		count ||= Linguistics.num
		count = normalize_count( count )

		return nil if /^(#{PL_count_one})$/i =~ count.to_s

		# Handle user-defined verbs
		#if value = ud_match( word, PL_v_user_defined )
		#	return value
		#end

		case word

		# Handle irregular present tense (simple and compound)
		when /^(#{PL_v_irregular_pres})((\s.*)?)$/i
			return PL_v_irregular_pres_h[ $1.downcase ] + $2

		# Handle irregular future, preterite and perfect tenses 
		when /^(#{PL_v_irregular_non_pres})((\s.*)?)$/i
			return word

		# Handle special cases
		when /^(#{PL_v_special_s})$/, /\s/
			return nil

		# Handle standard 3rd person (chop the ...(e)s off single words)
		when /^(.*)([cs]h|[x]|zz|ss)es$/i
			return $1 + $2
		when /^(..+)ies$/i
			return "#{$1}y"
		when /^(.+)oes$/i
			return "#{$1}o"
		when /^(.*[^s])s$/i
			return $1

		# Otherwise, a regular verb (handle elsewhere)
		else
			return nil
		end
	end


	### Pluralize regular verbs
	def pluralize_general_verb( word, count )
		count ||= Linguistics.num
		count = normalize_count( count )

		return word if /^(#{PL_count_one})$/i =~ count.to_s

		case word

		# Handle ambiguous present tenses  (simple and compound)
		when /^(#{PL_v_ambiguous_pres})((\s.*)?)$/i
			return PL_v_ambiguous_pres_h[ $1.downcase ] + $2

		# Handle ambiguous preterite and perfect tenses
		when /^(#{PL_v_ambiguous_non_pres})((\s.*)?)$/i
			return word

		# Otherwise, 1st or 2nd person is uninflected
		else
			return word
		end
	end


	### Handle special adjectives
	def pluralize_special_adjective( word, count )
		count ||= 1
		count = normalize_count( count )

		return word if /^(#{PL_count_one})$/i =~ count.to_s

		# Handle user-defined verbs
		#if value = ud_match( word, PL_adj_user_defined )
		#	return value
		#end

		case word

		# Handle known cases
		when /^(#{PL_adj_special})$/i
			return PL_adj_special_h[ $1.downcase ]

		# Handle possessives
		when /^(#{PL_adj_poss})$/i
			return PL_adj_poss_h[ $1.downcase ]

		when /^(.*)'s?$/
			pl = plural_noun( $1 )
			if /s$/ =~ pl
				return "#{pl}'"
			else
				return "#{pl}'s"
			end

		# Otherwise, no idea
		else
			return nil
		end
	end


end # module Linguistics::EN::Pluralization

