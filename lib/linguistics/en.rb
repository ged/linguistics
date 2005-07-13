#!/usr/bin/ruby
# 
# = Linguistics::EN
#
# This module contains English-language linguistic functions for the Linguistics
# module. It can be either loaded directly, or by passing some variant of 'en'
# or 'eng' to the Linguistics::use method.
#
# The functions contained by the module provide:
#
# == Plural Inflections
# 
# Plural forms of all nouns, most verbs, and some adjectives are provided. Where
# appropriate, "classical" variants (for example: "brother" -> "brethren",
# "dogma" -> "dogmata", etc.) are also provided.
#
# These can be accessed via the #plural, #plural_noun, #plural_verb, and
# #plural_adjective methods.
#
# == Indefinite Articles
#
# Pronunciation-based "a"/"an" selection is provided for all English words, and
# most initialisms.
#
# See: #a, #an, and #no.
#
# == Numbers to Words
#
# Conversion from Numeric values to words are supported using the American
# "thousands" system. E.g., 2561 => "two thousand, five hundred and sixty-one".
#
# See the #numwords method.
#
# == Ordinals
#
# It is also possible to inflect numerals (1,2,3) and number words ("one",
# "two", "three") to ordinals (1st, 2nd, 3rd) and ordinates ("first", "second",
# "third").
#
# == Conjunctions
#
# This module also supports the creation of English conjunctions from Arrays of
# Strings or objects which respond to the #to_s message. Eg.,
#
#   %w{cow pig chicken cow dog cow duck duck moose}.en.conjunction
#     ==> "three cows, two ducks, a pig, a chicken, a dog, and a moose"
#
# == Infinitives
#
# Returns the infinitive form of English verbs:
#
#  "dodging".en.infinitive
#    ==> "dodge"
#
#
# == Authors
# 
# * Michael Granger <ged@FaerieMUD.org>
# 
# == Copyright
#
# This module is copyright (c) 2003-2005 The FaerieMUD Consortium. All rights
# reserved.
# 
# This module is free software. You may use, modify, and/or redistribute this
# software under the terms of the Perl Artistic License. (See
# http://language.perl.com/misc/Artistic.html)
# 
# The inflection functions of this module were adapted from Damien Conway's
# Lingua::EN::Inflect Perl module:
#
#   Copyright (c) 1997-2000, Damian Conway. All Rights Reserved.
#   This module is free software. It may be used, redistributed
#     and/or modified under the same terms as Perl itself.
#
# The conjunctions code was adapted from the Lingua::Conjunction Perl module
# written by Robert Rothenberg and Damian Conway, which has no copyright
# statement included.
#
# == Version
#
#  $Id: en.rb,v 1.8 2003/09/14 10:47:12 deveiant Exp $
# 


### This module contains English-language linguistics functions accessible from
### the Linguistics module, or as a standalone function library.
module Linguistics::EN

	begin
		require 'crosscase'
	rescue LoadError
	else
		include CrossCase
	end

	# Load in the secondary modules and add them to Linguistics::EN.
	require 'linguistics/en/infinitive'
	require 'linguistics/en/wordnet'
	require 'linguistics/en/linkparser'

	# Subversion revision
	SVNRev = %q$Rev$

	# Subversion revision tag
	SVNId = %q$Id: en.rb,v 1.8 2003/09/14 10:47:12 deveiant Exp $

	# Add 'english' to the list of default languages
	Linguistics::DefaultLanguages.push( :en )


	#################################################################
	###	U T I L I T Y   F U N C T I O N S
	#################################################################

	### Wrap one or more parts in a non-capturing alteration Regexp
	def self::matchgroup( *parts )
		re = parts.flatten.join("|")
		"(?:#{re})"
	end


	#################################################################
	###	C O N S T A N T S
	#################################################################

	# :stopdoc:

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

		'general' => ['(?!major|lieutenant|brigadier|adjutant)\S+'],
		'martial' => ["court"],

	}.collect {|key,val|
		matchgroup( matchgroup(val) + "(?=(?:-|\\s+)#{key})" )
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


	#
	# Numerals, ordinals, and numbers-to-words
	#

	# Numerical inflections
	Nth = {
		0 => 'th',
		1 => 'st',
		2 => 'nd',
		3 => 'rd',
		4 => 'th',
		5 => 'th',
		6 => 'th',
		7 => 'th',
		8 => 'th',
		9 => 'th',
		11 => 'th',
		12 => 'th',
		13 => 'th',
	}

	# Ordinal word parts
	Ordinals = {
		'ty' => 'tieth',
		'one' => 'first',
		'two' => 'second',
		'three' => 'third',
		'five' => 'fifth',
		'eight' => 'eighth',
		'nine' => 'ninth',
		'twelve' => 'twelfth',
	}
	OrdinalSuffixes = Ordinals.keys.join("|") + "|"
	Ordinals[""] = 'th'

	# Numeral names
	Units = [''] + %w[one two three four five six seven eight nine]
	Teens = %w[ten eleven twelve thirteen fourteen
			  fifteen sixteen seventeen eighteen nineteen]
	Tens  = ['',''] + %w[twenty thirty forty fifty sixty seventy eighty ninety]
	Thousands = [' ', ' thousand'] + %w[
		m b tr quadr quint sext sept oct non dec undec duodec tredec
		quattuordec quindec sexdec septemdec octodec novemdec vigint
	].collect {|prefix| ' ' + prefix + 'illion'}

	# A collection of functions for transforming digits into word
	# phrases. Indexed by the number of digits being transformed; e.g.,
	# <tt>NumberToWordsFunctions[2]</tt> is the function for transforming
	# double-digit numbers.
	NumberToWordsFunctions = [
		proc {|*args| raise "No digits (#{args.inspect})"},

		# Single-digits
		proc {|zero,x|
			(x.nonzero? ? to_units(x) : "#{zero} ")
		},

		# Double-digits
		proc {|zero,x,y|
			if x.nonzero?
				to_tens( x, y )
			elsif y.nonzero?
				"#{zero} " + NumberToWordsFunctions[1].call( zero, y )
			else
				([zero] * 2).join(" ")
			end
		},

		# Triple-digits
		proc {|zero,x,y,z|
			NumberToWordsFunctions[1].call(zero,x) + 
			NumberToWordsFunctions[2].call(zero,y,z)
		}
	]


	#
	# Indefinite Articles
	#

	# This pattern matches strings of capitals starting with a "vowel-sound"
	# consonant followed by another consonant, and which are not likely
	# to be real words (oh, all right then, it's just magic!)
	A_abbrev = %{
		(?! FJO | [HLMNS]Y.  | RY[EO] | SQU
		  | ( F[LR]? | [HL] | MN? | N | RH? | S[CHKLMNPTVW]? | X(YL)?) [AEIOU])
		[FHLMNRSX][A-Z]
	}

	# This pattern codes the beginnings of all english words begining with a
	# 'y' followed by a consonant. Any other y-consonant prefix therefore
	# implies an abbreviation.
	A_y_cons = 'y(b[lor]|cl[ea]|fere|gg|p[ios]|rou|tt)'

	# Exceptions to exceptions
	A_explicit_an = matchgroup(	"euler", "hour(?!i)", "heir", "honest", "hono" )


	#
	# Configuration defaults
	#

	# Default configuration arguments for the #numwords function
	NumwordDefaults = {
		:group		=> 0,
		:comma		=> ', ',
		:and		=> ' and ',
		:zero		=> 'zero',
		:decimal	=> 'point',
		:asArray	=> false,
	}

	# Default ranges for #quantify
	SeveralRange = 2..5
	NumberRange = 6..19
	NumerousRange = 20..45
	ManyRange = 46..99

	# Default configuration arguments for the #quantify function
	QuantifyDefaults = {
		:joinword	=> " of ",
	}

	# Default configuration arguments for the #conjunction (junction, what's
	# your) function.
	ConjunctionDefaults = {
		:separator		=> ', ',
		:altsep			=> '; ',
		:penultimate	=> true,
		:conjunctive	=> 'and',
		:combine		=> true,
		:casefold		=> true,
		:generalize		=> false,
		:quantsort		=> true,
	}


	#
	# Title case
	#

	# "In titles, capitalize the first word, the last word, and all words in
	# between except articles (a, an, and the), prepositions under five letters
	# (in, of, to), and coordinating conjunctions (and, but). These rules apply
	# to titles of long, short, and partial works as well as your own papers"
	# (Anson, Schwegler, and Muth. The Longman Writer's Companion 240).
	
	# Build the list of exceptions to title-capitalization
	Articles = %w[a and the]
	ShortPrepositions = ["amid", "at", "but", "by", "down", "from", "in",
		"into", "like", "near", "of", "off", "on", "onto", "out", "over",
		"past", "save", "with", "till", "to", "unto", "up", "upon", "with"]
	CoordConjunctions = %w[and but as]
	TitleCaseExceptions = Articles | ShortPrepositions | CoordConjunctions


	# :startdoc:

	#################################################################
	###	" B A C K E N D "   F U N C T I O N S
	#################################################################


	###############
	module_function
	###############

	### Debugging output
	def debugMsg( *msgs ) # :nodoc:
		$stderr.puts msgs.join(" ") if $DEBUG
	end


	### Normalize a count to either 1 or 2 (singular or plural)
	def normalizeCount( count, default=2 )
		return default if count.nil? # Default to plural
		if /^(#{PL_count_one})$/i =~ count.to_s ||
				Linguistics::classical? &&
				/^(#{PL_count_zero})$/ =~ count.to_s
			return 1
		else
			return default
		end
	end


	### Do normal/classical switching and match capitalization in <tt>inflected</tt> by
	### examining the <tt>original</tt> input.
	def postprocess( original, inflected )
		inflected.sub!( /([^|]+)\|(.+)/ ) {
			Linguistics::classical? ? $2 : $1
		}

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


	### Pluralize nouns
	def pluralize_noun( word, count=nil )
		value = nil
		count ||= Linguistics::num
		count = normalizeCount( count )

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
			if Linguistics::classical? &&
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
		when /(.*)man$/i ;					return "#{$1}men"
		when /(.*[ml])ouse$/i ;				return "#{$1}ice"
		when /(.*)goose$/i ;				return "#{$1}geese"
		when /(.*)tooth$/i ;				return "#{$1}teeth"
		when /(.*)foot$/i ;					return "#{$1}feet"

		# Handle unassimilated imports
		when /(.*)ceps$/i ;					return word
		when /(.*)zoon$/i ;					return "#{$1}zoa"
		when /(.*[csx])is$/i ;				return "#{$1}es"
		when /(#{PL_sb_U_ex_ices})ex$/i;	return "#{$1}ices"
		when /(#{PL_sb_U_ix_ices})ix$/i;	return "#{$1}ices"
		when /(#{PL_sb_U_um_a})um$/i ;		return "#{$1}a"
		when /(#{PL_sb_U_us_i})us$/i ;		return "#{$1}i"
		when /(#{PL_sb_U_on_a})on$/i ;		return "#{$1}a"
		when /(#{PL_sb_U_a_ae})$/i ;		return "#{$1}e"
		end

		# Handle incompletely assimilated imports
		if Linguistics::classical?
			case word
			when /(.*)trix$/i ;				return "#{$1}trices"
			when /(.*)eau$/i ;				return "#{$1}eaux"
			when /(.*)ieu$/i ;				return "#{$1}ieux"
			when /(.{2,}[yia])nx$/i ;		return "#{$1}nges"
			when /(#{PL_sb_C_en_ina})en$/i; return "#{$1}ina"
			when /(#{PL_sb_C_ex_ices})ex$/i;	return "#{$1}ices"
			when /(#{PL_sb_C_ix_ices})ix$/i;	return "#{$1}ices"
			when /(#{PL_sb_C_um_a})um$/i ;	return "#{$1}a"
			when /(#{PL_sb_C_us_i})us$/i ;	return "#{$1}i"
			when /(#{PL_sb_C_us_us})$/i ;	return "#{$1}"
			when /(#{PL_sb_C_a_ae})$/i ;	return "#{$1}e"
			when /(#{PL_sb_C_a_ata})a$/i ;	return "#{$1}ata"
			when /(#{PL_sb_C_o_i})o$/i ;	return "#{$1}i"
			when /(#{PL_sb_C_on_a})on$/i ;	return "#{$1}a"
			when /#{PL_sb_C_im}$/i ;		return "#{word}im"
			when /#{PL_sb_C_i}$/i ;			return "#{word}i"
			end
		end


		# Handle singular nouns ending in ...s or other silibants
		case word
		when /^(#{PL_sb_singular_s})$/i;	return "#{$1}es"
		when /^([A-Z].*s)$/;				return "#{$1}es"
		when /(.*)([cs]h|[zx])$/i ;			return "#{$1}#{$2}es"
		# when /(.*)(us)$/i ;				return "#{$1}#{$2}es"

		# Handle ...f -> ...ves
		when /(.*[eao])lf$/i ;				return "#{$1}lves"; 
		when /(.*[^d])eaf$/i ;				return "#{$1}eaves"
		when /(.*[nlw])ife$/i ;				return "#{$1}ives"
		when /(.*)arf$/i ;					return "#{$1}arves"

		# Handle ...y
		when /(.*[aeiou])y$/i ;				return "#{$1}ys"
		when /([A-Z].*y)$/ ;				return "#{$1}s"
		when /(.*)y$/i ;					return "#{$1}ies"

		# Handle ...o
		when /#{PL_sb_U_o_os}$/i ;			return "#{word}s"
		when /[aeiou]o$/i ;					return "#{word}s"
		when /o$/i ;						return "#{word}es"

		# Otherwise just add ...s
		else
			return "#{word}s"
		end
	end # def pluralize_noun



	### Pluralize special verbs
	def pluralize_special_verb( word, count )
		count ||= Linguistics::num
		count = normalizeCount( count )
		
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
		count ||= Linguistics::num
		count = normalizeCount( count )
		
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
		count ||= Linguistics::num
		count = normalizeCount( count )

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


	### Returns the given word with a prepended indefinite article, unless
	### +count+ is non-nil and not singular.
	def indef_article( word, count )
		count ||= Linguistics::num
		return "#{count} #{word}" if
			count && /^(#{PL_count_one})$/i !~ count.to_s

		# Handle user-defined variants
		# return value if value = ud_match( word, A_a_user_defined )

		case word

		# Handle special cases
		when /^(#{A_explicit_an})/i
			return "an #{word}"

		# Handle abbreviations
		when /^(#{A_abbrev})/x
			return "an #{word}"
		when /^[aefhilmnorsx][.-]/i
			return "an #{word}"
		when /^[a-z][.-]/i	
			return "a #{word}"

		# Handle consonants
		when /^[^aeiouy]/i
			return "a #{word}"

		# Handle special vowel-forms
		when /^e[uw]/i	
			return "a #{word}"
		when /^onc?e\b/i	
			return "a #{word}"
		when /^uni([^nmd]|mo)/i
			return "a #{word}"
		when /^u[bcfhjkqrst][aeiou]/i
			return "a #{word}"

		# Handle vowels
		when /^[aeiou]/i
			return "an #{word}"

		# Handle y... (before certain consonants implies (unnaturalized) "i.." sound)
		when /^(#{A_y_cons})/i
			return "an #{word}"

		# Otherwise, guess "a"
		else
			return "a #{word}"
		end
	end


	### Transform the specified number of units-place numerals into a
	### word-phrase at the given number of +thousands+ places.
	def to_units( units, thousands=0 )
		return Units[ units ] + to_thousands( thousands )
	end


	### Transform the specified number of tens- and units-place numerals into a
	### word-phrase at the given number of +thousands+ places.
	def to_tens( tens, units, thousands=0 )
		unless tens == 1
			return Tens[ tens ] + ( tens.nonzero? && units.nonzero? ? '-' : '' ) +
				to_units( units, thousands )
		else
			return Teens[ units ] + to_thousands( thousands )
		end
	end


	### Transform the specified number of hundreds-, tens-, and units-place
	### numerals into a word phrase. If the number of thousands (+thousands+) is
	### greater than 0, it will be used to determine where the decimal point is
	### in relation to the hundreds-place number.
	def to_hundreds( hundreds, tens=0, units=0, thousands=0, joinword=" and " )
		joinword = ' ' if joinword.empty?
		if hundreds.nonzero?
			return to_units( hundreds ) + " hundred" +
				(tens.nonzero? || units.nonzero? ? joinword : '') +
				to_tens( tens, units ) +
				to_thousands( thousands )
		elsif tens.nonzero? || units.nonzero?
			return to_tens( tens, units ) + to_thousands( thousands )
		else
			return nil
		end
	end

	### Transform the specified number into one or more words like 'thousand',
	### 'million', etc. Uses the thousands (American) system.
	def to_thousands( thousands=0 )
		parts = []
		(0..thousands).step( Thousands.length - 1 ) {|i|
			if i.zero?
				parts.push Thousands[ thousands % (Thousands.length - 1) ]
			else
				parts.push Thousands.last
			end
		}

		return parts.join(" ")
	end


	### Return the specified number +num+ as an array of number phrases.
	def number_to_words( num, config )
		return [config[:zero]] if num.to_i.zero?
		chunks = []

		# Break into word-groups if groups is set
		if config[:group].nonzero?

			# Build a Regexp with <config[:group]> number of digits. Any past
			# the first are optional.
			re = Regexp::new( "(\\d)" + ("(\\d)?" * (config[:group] - 1)) )

			# Scan the string, and call the word-chunk function that deals with
			# chunks of the found number of digits.
			num.to_s.scan( re ) {|digits|
				debugMsg "   digits = #{digits.inspect}"
				fn = NumberToWordsFunctions[ digits.nitems ]
				numerals = digits.flatten.compact.collect {|i| i.to_i}
				debugMsg "   numerals = #{numerals.inspect}"
				chunks.push fn.call( config[:zero], *numerals ).strip
			}
		else
			phrase = num.to_s
			phrase.sub!( /\A\s*0+/, '' )
			mill = 0

			# Match backward from the end of the digits in the string, turning
			# chunks of three, of two, and of one into words.
			mill += 1 while
				phrase.sub!( /(\d)(\d)(\d)(?=\D*\Z)/ ) {
					words = to_hundreds( $1.to_i, $2.to_i, $3.to_i, mill, 
										 config[:and] )
					chunks.unshift words.strip.squeeze(' ') unless words.nil?
					''
				}				

			phrase.sub!( /(\d)(\d)(?=\D*\Z)/ ) {
				chunks.unshift to_tens( $1.to_i, $2.to_i, mill ).strip.squeeze(' ')
				''
			}
			phrase.sub!( /(\d)(?=\D*\Z)/ ) {
				chunks.unshift to_units( $1.to_i, mill ).strip.squeeze(' ')
				''
			}
		end

		return chunks
	end


	#################################################################
	###	P U B L I C   F U N C T I O N S
	#################################################################

	### Return the name of the language this module is for.
	def language
		"English"
	end


	### Return the plural of the given +phrase+ if +count+ indicates it should
	### be plural.
	def plural( phrase, count=nil )
		md = /\A(\s*)(.+?)(\s*)\Z/.match( phrase.to_s )
		pre, word, post = md.to_a[1,3]
		return phrase if word.nil? or word.empty?

		plural = postprocess( word,
			pluralize_special_adjective(word, count) ||
			pluralize_special_verb(word, count) ||
			pluralize_noun(word, count) )

		return pre + plural + post
	end
	alias_method :PL, :plural


	### Return the plural of the given noun +phrase+ if +count+ indicates it
	### should be plural.
	def plural_noun( phrase, count=nil )
		md = /\A(\s*)(.+?)(\s*)\Z/.match( phrase.to_s )
		pre, word, post = md.to_a[1,3]
		return phrase if word.nil? or word.empty?

		plural = postprocess( word, pluralize_noun(word, count) )
		return pre + plural + post
	end
	alias_method :PL_N, :plural_noun


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
	alias_method :PL_V, :plural_verb


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
	alias_method :PL_ADJ, :plural_adjective


	### Return the given phrase with the appropriate indefinite article ("a" or
	### "an") prepended. 
	def a( phrase, count=nil )
		md = /\A(\s*)(.+?)(\s*)\Z/.match( phrase.to_s )
		pre, word, post = md.to_a[1,3]
		return phrase if word.nil? or word.empty?

		result = indef_article( word, count )
		return pre + result + post
	end
	alias_method :an, :a
	alias_method :A, :a
	alias_method :AN, :a


	### Translate zero-quantified +phrase+ to "no +phrase.plural+"
	def no( phrase, count=nil )
		md = /\A(\s*)(.+?)(\s*)\Z/.match( phrase.to_s )
		pre, word, post = md.to_a[1,3]
		count ||= Linguistics::num || 0

		unless /^#{PL_count_zero}$/ =~ count.to_s
			return "#{pre}#{count} " + plural( word, count ) + post
		else
			return "#{pre}no " + plural( word, 0 ) + post
		end
	end
	alias_method :NO, :no


	### Participles
	def present_participle( word )
        plural = plural_verb( word.to_s, 2 )
		
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
	alias_method :PART_PRES, :present_participle



	### Return the specified number as english words. One or more configuration
	### values may be passed to control the returned String:
	### 
	### [<b>:group</b>]
	###   Controls how many numbers at a time are grouped together. Valid values
	###   are +0+ (normal grouping), +1+ (single-digit grouping, e.g., "one,
	###   two, three, four"), +2+ (double-digit grouping, e.g., "twelve,
	###   thirty-four", or +3+ (triple-digit grouping, e.g., "one twenty-three,
	###   four").
	### [<b>:comma</b>]
	###   Set the character/s used to separate word groups. Defaults to +", "+.
	### [<b>:and</b>]
	###   Set the word and/or characters used where ' and ' (the default) is
	###   normally used. Setting <tt>:and</tt> to +' '+, for example, will cause
	###   +2556+ to be returned as "two-thousand, five hundred fifty-six"
	###   instead of ""two-thousand, five hundred and fifty-six".
	### [<b>:zero</b>]
	###   Set the word used to represent the numeral +0+ in the result. +'zero'+
	###   is the default.
	### [<b>:decimal</b>]
	###   Set the translation of any decimal points in the number; the default
	###   is +'point'+.
	### [<b>:asArray</b>]
	###   If set to a true value, the number will be returned as an array of
	###   word groups instead of a String.
	def numwords( number, hashargs={} )
		num = number.to_s
		config = NumwordDefaults.dup.update( hashargs )
		raise "Bad chunking option: #{config[:group]}" unless
			config[:group].between?( 0, 3 )

		# Array of number parts: first is everything to the left of the first
		# decimal, followed by any groups of decimal-delimted numbers after that
		parts = []

		# Wordify any sign prefix
		sign = (/\A\s*\+/ =~ num) ? 'plus' : (/\A\s*\-/ =~ num) ? 'minus' : ''

		# Strip any ordinal suffixes
		ord = true if num.sub!( /(st|nd|rd|th)\Z/, '' )

		# Split the number into chunks delimited by '.'
		chunks = if !config[:decimal].empty? then
					 if config[:group].nonzero?
						 num.split(/\./)
					 else
						 num.split(/\./, 2)
					 end
				 else
					 [ num ]
				 end

		# Wordify each chunk, pushing arrays into the parts array
		chunks.each_with_index {|chunk,section|
			chunk.gsub!( /\D+/, '' )

			# If there's nothing in this chunk of the number, set it to zero
			# unless it's the whole-number part, in which case just push an
			# empty array.
			if chunk.empty?
				if section.zero?
					parts.push []
					next 
				end
			end

			# Split the number section into wordified parts unless this is the
			# second or succeeding part of a non-group number
			unless config[:group].zero? && section.nonzero?
				parts.push number_to_words( chunk, config )
			else
				parts.push number_to_words( chunk, config.dup.update(:group => 1) )
			end					
		}

		debugMsg "Parts => #{parts.inspect}"
		
		# Turn the last word of the whole-number part back into an ordinal if
		# the original number came in that way.
		if ord && !parts[0].empty?
			parts[0][-1] = ordinal( parts[0].last )
		end

		# If the caller's expecting an Array return, just flatten and return the
		# parts array.
		if config[:asArray]
			unless sign.empty?
				parts[0].unshift( sign )
			end
			return parts.flatten
		end

		# Catenate each sub-parts array into a whole number part and one or more
		# post-decimal parts. If grouping is turned on, all sub-parts get joined
		# with commas, otherwise just the whole-number part is.
		if config[:group].zero?
			if parts[0].nitems > 1

				# Join all but the last part together with commas
				wholenum = parts[0][0...-1].join( config[:comma] )

				# If the last part is just a single word, append it to the
				# wholenum part with an 'and'. This is to get things like 'three
				# thousand and three' instead of 'three thousand, three'.
				if /^\s*(\S+)\s*$/ =~ parts[0].last
					wholenum += " and #{parts[0].last}"
				else
					wholenum += config[:comma] + parts[0].last
				end
			else
				wholenum = parts[0][0]
			end
			decimals = parts[1..-1].collect {|part| part.join(" ")}

			debugMsg "Wholenum: #{wholenum.inspect}; decimals: #{decimals.inspect}"

			# Join with the configured decimal; if it's empty, just join with
			# spaces.
			unless config[:decimal].empty?
				return sign + ([ wholenum ] + decimals).
					join( " #{config[:decimal]} " ).strip
			else
				return sign + ([ wholenum ] + decimals).
					join( " " ).strip
			end
		else
			return parts.compact.
				separate( config[:decimal] ).
				delete_if {|el| el.empty?}.
				join( config[:comma] ).
				strip
		end
	end
	alias_method :NUMWORDS, :numwords


	### Transform the given +number+ into an ordinal word. The +number+ object
	### can be either an Integer or a String.
	def ordinal( number )
		case number
		when Integer
			return number.to_s + (Nth[ number % 100 ] || Nth[ number % 10 ])

		else
			return number.to_s.sub( /(#{OrdinalSuffixes})\Z/ ) { Ordinals[$1] }
		end
	end
	alias_method :ORD, :ordinal


	### Return a phrase describing the specified +number+ of objects in the
	### given +phrase+. The following options can be used to control the makeup
	### of the returned quantity String:
	### 
    ### [<b>:joinword</b>]
    ###   Sets the word (and any surrounding spaces) used as the word separating the
    ###   quantity from the noun in the resulting string. Defaults to <tt>' of
    ###   '</tt>.
	def quantify( phrase, number=0, args={} )
		num = number.to_i
		config = QuantifyDefaults.dup.update( args )
		
		case num
		when 0
			no( phrase )
		when 1
			a( phrase )
		when SeveralRange
			"several " + plural( phrase, num )
		when NumberRange
			"a number of " + plural( phrase, num )
		when NumerousRange
			"numerous " + plural( phrase, num )
		when ManyRange
			"many " + plural( phrase, num )
		else

			# Anything bigger than the ManyRange gets described like
			# "hundreds of thousands of..." or "millions of..."
			# depending, of course, on how many there are.
			thousands, subthousands = Math::log10( num ).to_i.divmod( 3 )
			stword =
				case subthousands
				when 2
					"hundreds"
				when 1
					"tens"
				else
					nil
				end
			thword = plural( to_thousands(thousands).strip )
			thword = nil if thword.empty?

			[	# Hundreds (of)...
				stword,

				# thousands (of)
				thword,

				# stars.
				plural(phrase, number)
			].compact.join( config[:joinword] )
		end
	end


    ### Return the specified +obj+ (which must support the <tt>#collect</tt>
    ### method) as a conjunction. Each item is converted to a String if it is
    ### not already (using #to_s) unless a block is given, in which case it is
    ### called once for each object in the array, and the stringified return
    ### value from the block is used instead. Returning +nil+ causes that
    ### particular element to be omitted from the resulting conjunction. The
    ### following options can be used to control the makeup of the returned
    ### conjunction String:
    ### 
    ### [<b>:separator</b>]
    ###   Specify one or more characters to separate items in the resulting
    ###   list. Defaults to <tt>', '</tt>.
    ### [<b>:altsep</b>]
    ###   An alternate separator to use if any of the resulting conjunction's
    ###   clauses contain the <tt>:separator</tt> character/s. Defaults to <tt>'; '</tt>.
    ### [<b>:penultimate</b>]
    ###   Flag that indicates whether or not to join the last clause onto the
    ###   rest of the conjunction using a penultimate <tt>:separator</tt>. E.g.,
    ###     %w{duck, cow, dog}.en.conjunction
    ###     # => "a duck, a cow, and a dog"
    ###     %w{duck cow dog}.en.conjunction( :penultimate => false )
    ###     "a duck, a cow and a dog"
    ###   Default to <tt>true</tt>.
    ### [<b>:conjunctive</b>]
    ###   Sets the word used as the conjunctive (separating word) of the
    ###   resulting string. Default to <tt>'and'</tt>.
    ### [<b>:combine</b>]
    ###   If set to <tt>true</tt> (the default), items which are indentical (after
    ###   surrounding spaces are stripped) will be combined in the resulting
    ###   conjunction. E.g.,
    ###     %w{goose cow goose dog}.en.conjunction
    ###     # => "two geese, a cow, and a dog"
    ###     %w{goose cow goose dog}.en.conjunction( :combine => false )
    ###     # => "a goose, a cow, a goose, and a dog"
    ### [<b>:casefold</b>]
    ###   If set to <tt>true</tt> (the default), then items are compared
    ###   case-insensitively when combining them. This has no effect if
    ###   <tt>:combine</tt> is <tt>false</tt>.
    ### [<b>:generalize</b>]
    ###   If set to <tt>true</tt>, then quantities of combined items are turned into
    ###   general descriptions instead of exact amounts.
    ###     ary = %w{goose pig dog horse goose reindeer goose dog horse}
    ###     ary.en.conjunction
    ###     # => "three geese, two dogs, two horses, a pig, and a reindeer"
    ###     ary.en.conjunction( :generalize => true )
    ###     # => "several geese, several dogs, several horses, a pig, and a reindeer"
    ###   See the #quantify method for specifics on how quantities are
    ###   generalized. Generalization defaults to <tt>false</tt>, and has no effect if
    ###   :combine is <tt>false</tt>.
    ### [<b>:quantsort</b>]
    ###   If set to <tt>true</tt> (the default), items which are combined in the
    ###   resulting conjunction will be listed in order of amount, with greater
    ###   quantities sorted first. If <tt>:quantsort</tt> is <tt>false</tt>, combined items
    ###   will appear where the first instance of them occurred in the
    ###   list. This sort is also the fallback for indentical quantities (ie.,
    ###   items of the same quantity will be listed in the order they appeared
    ###   in the source list).
    ###
	def conjunction( obj, args={} )
		config = ConjunctionDefaults.dup.update( args )
		phrases = []

		# Transform items in the obj to phrases
		if block_given?
			phrases = obj.collect {|item| yield(item) }.compact
		else
			phrases = obj.collect {|item| item.to_s }
		end

		# No need for a conjunction if there's only one thing
		return a(phrases[0]) if phrases.length < 2

		# Set up a Proc to derive a collector key from a phrase depending on the
		# configuration
		keyfunc =
			if config[:casefold]
				proc {|key| key.downcase.strip}
			else
				proc {|key| key.strip}
			end
		
		# Count and delete phrases that hash the same when the keyfunc munges
		# them into the same thing if we're combining (:combine => true).
		collector = {}
		if config[:combine]
		
			phrases.each_index do |i|
				# Stop when reaching the end of a truncated list
				break if phrases[i].nil?

				# Make the key using the configured key function
				phrase = keyfunc[ phrases[i] ]

				# If the collector already has this key, increment its count,
				# eliminate the duplicate from the phrase list, and redo the loop.
				if collector.key?( phrase )
					collector[ phrase ] += 1
					phrases.delete_at( i )
					redo
				end

				collector[ phrase ] = 1
			end
		else
			# If we're not combining, just make everything have a count of 1.
			phrases.uniq.each {|key| collector[ keyfunc[key] ] = 1}
		end

		# If sort-by-quantity is turned on, sort the phrases first by how many
		# there are (most-first), and then by the order they were specified in.
		if config[:quantsort] && config[:combine]
			origorder = {}
			phrases.each_with_index {|phrase,i| origorder[ keyfunc[phrase] ] ||= i }
			phrases.sort! {|a,b|
				(collector[ keyfunc[b] ] <=> collector[ keyfunc[a] ]).nonzero? ||
				(origorder[ keyfunc[a] ] <=> origorder[ keyfunc[b] ])
			}
		end

		# Set up a filtering function that adds either an indefinite article, an
		# indefinite quantifier, or a definite quantifier to each phrase
		# depending on the configuration and the count of phrases in the
		# collector.
		filter =
			if config[:generalize]
				proc {|phrase, count| quantify(phrase, count) }
			else
				proc {|phrase, count|
				if count > 1
					"%s %s" % [
						# :TODO: Make this threshold settable
						count < 10 ? count.en.numwords : count.to_s,
						plural(phrase, count)
					]
				else
					a( phrase )
				end
			}
			end

		# Now use the configured filter to turn each phrase into its final
		# form. Hmmm... square-bracket Lisp?
		phrases.collect! {|phrase| filter[phrase, collector[ keyfunc[phrase] ]] }

		# Prepend the conjunctive to the last element unless it's empty or
		# there's only one element
		phrases[-1].insert( 0, config[:conjunctive] + " " ) unless
			config[:conjunctive].strip.empty? or
			phrases.length < 2

		# Catenate the last two elements if there's no penultimate separator,
		# and pick a separator based on how many phrases there are and whether
		# or not there's already an instance of it in the phrases.
		phrases[-2] << " " << phrases.pop unless config[:penultimate]
		sep = if phrases.length <= 2
				  ' '
			  elsif phrases.grep( /#{config[:separator]}/ ).empty?
				  config[:separator]
			  else
				  config[:altsep]
			  end

		return phrases.join( sep )
	end


	### Turns a camel-case +string+ ("camelCaseToEnglish") to plain English
	### ("camel case to english"). Each word is decapitalized.
	def camel_case_to_english( string )
		string.to_s.gsub( /([a-z])([A-Z])/ ) { "#$1 #$2" }.downcase
	end


	### Turns an English language +string+ into a CamelCase word.
	def english_to_camel_case( string )
		string.to_s.gsub( /\s+([a-z])/ ) { $1.upcase }
	end


	### This method doesn't work quite right yet. It does okay for simple cases,
	### but it misses more complex ones, e.g. 'as' used as a coordinating
	### conjunction in "A Portrait of the Artist as a Young Man". Perhaps after
	### there's a working (non-leaking) LinkParser for Ruby, this can be fixed
	### up. Until then it'll just be undocumented.

	### Returns the given +string+ as a title-cased phrase.
	def titlecase( string ) # :nodoc:

		# Split on word-boundaries
		words = string.split( /\b/ )
 		
		# Always capitalize the first and last words
		words.first.capitalize!
		words.last.capitalize!

		# Now scan the rest of the tokens, skipping non-words and capitalization
		# exceptions.
		words.each_with_index do |word, i|

			# Non-words
			next unless /^\w+$/.match( word )

			# Skip exception-words
			next if TitleCaseExceptions.include?( word )

			# Skip second parts of contractions
			next if words[i - 1] == "'" && /\w/.match( words[i - 2] )

			# Have to do it this way instead of capitalize! because that method
			# also downcases all other letters.
			word.gsub!( /^(\w)(.*)/ ) { $1.upcase + $2 }
		end

		return words.join
	end


	### Returns the proper noun form of a string by capitalizing most of the
	### words.
	###
	### Examples:
	###   English.proper_noun("bosnia and herzegovina") ->
	###     "Bosnia and Herzegovina"
	###   English.proper_noun("macedonia, the former yugoslav republic of") ->
	###     "Macedonia, the Former Yugoslav Republic of"
	###   English.proper_noun("virgin islands, u.s.") ->
	###     "Virgin Islands, U.S."
	def proper_noun( string )
		return string.split(/([ .]+)/).collect {|word|
			next word unless /^[a-z]/.match( word ) &&
				! (%w{and the of}.include?( word ))
			word.capitalize
		}.join
	end

end # module Linguistics::EN


### Add the #separate and #separate! methods to Array.
class Array # :nodoc:

	### Returns a new Array that has had a new member inserted between all of
	### the current ones. The value used is the given +value+ argument unless a
	### block is given, in which case the block is called once for each pair of
	### the Array, and the return value is used as the separator.
	def separate( value=:__no_arg__, &block )
		ary = self.dup
		ary.separate!( value, &block )
		return ary
	end

	### The same as #separate, but modifies the Array in place.
	def separate!( value=:__no_arg__ )
		raise ArgumentError, "wrong number of arguments: (0 for 1)" if
			value == :__no_arg__ && !block_given?

		(1..( (self.length * 2) - 2 )).step(2) do |i|
			if block_given?
				self.insert( i, yield(self[i-1,2]) )
			else
				self.insert( i, value )
			end
		end
		self
	end
		
end

