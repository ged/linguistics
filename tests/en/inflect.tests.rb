#!/usr/bin/ruby -w
#
# Unit test for English inflection 
# $Id: inflect.tests.rb,v 1.2 2003/09/11 05:04:04 deveiant Exp $
#
# Copyright (c) 2003, 2005 The FaerieMUD Consortium.
# 
# Much of this test was adapted from the test script for Lingua::EN::Inflect by
# Damien Conway:
#
#   Copyright (c) 1997-2000, Damian Conway. All Rights Reserved.
#   This module is free software. It may be used, redistributed
#     and/or modified under the same terms as Perl itself.
#

unless defined? Linguistics::TestCase
	testsdir = File::dirname( File::dirname(File::expand_path( __FILE__ )) )
	$LOAD_PATH.unshift testsdir unless $LOAD_PATH.include?( testsdir )

	require 'lingtestcase'
end


### This test case tests the english pluralization routines of the Linguistics
### module.
class EnglishInflectionTestCase < Linguistics::TestCase

	InflectFromItems = [ %w{foo bar}, "foo bar", 15, 18.13 ]

	NumberTests = [
		["0", "zero", "zero", "zero", "zero", "zeroth", ],
		["1", "one", "one", "one", "one", "first", ],
		["2", "two", "two", "two", "two", "second", ],
		["3", "three", "three", "three", "three", "third", ],
		["4", "four", "four", "four", "four", "fourth", ],
		["5", "five", "five", "five", "five", "fifth", ],
		["6", "six", "six", "six", "six", "sixth", ],
		["7", "seven", "seven", "seven", "seven", "seventh", ],
		["8", "eight", "eight", "eight", "eight", "eighth", ],
		["9", "nine", "nine", "nine", "nine", "ninth", ],
		["10", "ten", "one, zero", "ten", "ten", "tenth", ],
		["11", "eleven", "one, one", "eleven", "eleven", "eleventh", ],
		["12", "twelve", "one, two", "twelve", "twelve", "twelfth", ],
		["13", "thirteen", "one, three", "thirteen", "thirteen", "thirteenth", ],
		["14", "fourteen", "one, four", "fourteen", "fourteen", "fourteenth", ],
		["15", "fifteen", "one, five", "fifteen", "fifteen", "fifteenth", ],
		["16", "sixteen", "one, six", "sixteen", "sixteen", "sixteenth", ],
		["17", "seventeen", "one, seven", "seventeen", "seventeen", "seventeenth", ],
		["18", "eighteen", "one, eight", "eighteen", "eighteen", "eighteenth", ],
		["19", "nineteen", "one, nine", "nineteen", "nineteen", "nineteenth", ],
		["20", "twenty", "two, zero", "twenty", "twenty", "twentieth", ],
		["21", "twenty-one", "two, one", "twenty-one", "twenty-one", "twenty-first", ],
		["29", "twenty-nine", "two, nine", "twenty-nine", "twenty-nine", "twenty-ninth", ],
		["99", "ninety-nine", "nine, nine", "ninety-nine", "ninety-nine", "ninety-ninth", ],

		["100", "one hundred", "one, zero, zero", "ten, zero", "one zero zero",
			"one hundredth", ],
		["101", "one hundred and one", "one, zero, one", "ten, one", "one zero one",
			"one hundred and first", ],
		["110", "one hundred and ten", "one, one, zero", "eleven, zero", "one ten",
			"one hundred and tenth", ],
		["111", "one hundred and eleven", "one, one, one", "eleven, one", "one eleven",
			"one hundred and eleventh", ],
		["900", "nine hundred", "nine, zero, zero", "ninety, zero", "nine zero zero",
			"nine hundredth", ],
		["999", "nine hundred and ninety-nine", "nine, nine, nine", "ninety-nine, nine",
			"nine ninety-nine", "nine hundred and ninety-ninth", ],

		["1000", "one thousand", "one, zero, zero, zero", "ten, zero zero",
			"one zero zero, zero", "one thousandth", ],
		["1001", "one thousand and one", "one, zero, zero, one", "ten, zero one",
			"one zero zero, one", "one thousand and first", ],
		["1010", "one thousand and ten", "one, zero, one, zero", "ten, ten",
			"one zero one, zero", "one thousand and tenth", ],
		["1100", "one thousand, one hundred", "one, one, zero, zero",
			"eleven, zero zero", "one ten, zero", "one thousand, one hundredth", ],
		["2000", "two thousand", "two, zero, zero, zero", "twenty, zero zero",
			"two zero zero, zero", "two thousandth", ],
		["10000", "ten thousand", "one, zero, zero, zero, zero", "ten, zero zero, zero",
			"one zero zero, zero zero", "ten thousandth", ],

		["100000", "one hundred thousand", "one, zero, zero, zero, zero, zero",
			"ten, zero zero, zero zero", "one zero zero, zero zero zero",
			"one hundred thousandth", ],
		["100001", "one hundred thousand and one", "one, zero, zero, zero, zero, one",
			"ten, zero zero, zero one", "one zero zero, zero zero one",
			"one hundred thousand and first", ],
		["123456", "one hundred and twenty-three thousand, four hundred and fifty-six",
			"one, two, three, four, five, six", "twelve, thirty-four, fifty-six",
			"one twenty-three, four fifty-six",
			"one hundred and twenty-three thousand, four hundred and fifty-sixth", ],
		["0123456", "one hundred and twenty-three thousand, four hundred and fifty-six",
			"zero, one, two, three, four, five, six",
			"zero one, twenty-three, forty-five, six",
			"zero twelve, three forty-five, six",
			"one hundred and twenty-three thousand, four hundred and fifty-sixth", ],

		["1234567",
			"one million, two hundred and thirty-four thousand, five hundred and sixty-seven",
			"one, two, three, four, five, six, seven", "twelve, thirty-four, fifty-six, seven",
			"one twenty-three, four fifty-six, seven",
			"one million, two hundred and thirty-four thousand, five hundred and sixty-seventh", ],
		["12345678",
			"twelve million, three hundred and forty-five thousand, six hundred and seventy-eight",
			"one, two, three, four, five, six, seven, eight",
			"twelve, thirty-four, fifty-six, seventy-eight",
			"one twenty-three, four fifty-six, seventy-eight",
			"twelve million, three hundred and forty-five thousand, six hundred and seventy-eighth", ],
		["12_345_678",
			"twelve million, three hundred and forty-five thousand, six hundred and seventy-eight",
			"one, two, three, four, five, six, seven, eight",
			"twelve, thirty-four, fifty-six, seventy-eight",
			"one twenty-three, four fifty-six, seventy-eight", ],
		["1234,5678",
			"twelve million, three hundred and forty-five thousand, six hundred and seventy-eight",
			"one, two, three, four, five, six, seven, eight",
			"twelve, thirty-four, fifty-six, seventy-eight",
			"one twenty-three, four fifty-six, seventy-eight", ],
		["1234567890",
			"one billion, two hundred and thirty-four million, five hundred and sixty-seven thousand, eight hundred and ninety",
			"one, two, three, four, five, six, seven, eight, nine, zero",
			"twelve, thirty-four, fifty-six, seventy-eight, ninety",
			"one twenty-three, four fifty-six, seven eighty-nine, zero",
			"one billion, two hundred and thirty-four million, five hundred and sixty-seven thousand, eight hundred and ninetieth", ],
		["123456789012345",
			"one hundred and twenty-three trillion, four hundred and fifty-six billion, seven hundred and eighty-nine million, twelve thousand, three hundred and forty-five",
			"one, two, three, four, five, six, seven, eight, nine, zero, one, two, three, four, five",
			"twelve, thirty-four, fifty-six, seventy-eight, ninety, twelve, thirty-four, five",
			"one twenty-three, four fifty-six, seven eighty-nine, zero twelve, three forty-five",
			"one hundred and twenty-three trillion, four hundred and fifty-six billion, seven hundred and eighty-nine million, twelve thousand, three hundred and forty-fifth", ],
		["12345678901234567890",
			"twelve quintillion, three hundred and forty-five quadrillion, six hundred and seventy-eight trillion, nine hundred and one billion, two hundred and thirty-four million, five hundred and sixty-seven thousand, eight hundred and ninety",
			"one, two, three, four, five, six, seven, eight, nine, zero, one, two, three, four, five, six, seven, eight, nine, zero",
			"twelve, thirty-four, fifty-six, seventy-eight, ninety, twelve, thirty-four, fifty-six, seventy-eight, ninety",
			"one twenty-three, four fifty-six, seven eighty-nine, zero twelve, three forty-five, six seventy-eight, ninety",
			"twelve quintillion, three hundred and forty-five quadrillion, six hundred and seventy-eight trillion, nine hundred and one billion, two hundred and thirty-four million, five hundred and sixty-seven thousand, eight hundred and ninetieth", ],

		["0.987654", "zero point nine eight seven six five four",
			"zero, point, nine, eight, seven, six, five, four",
			"zero, point, ninety-eight, seventy-six, fifty-four",
			"zero, point, nine eighty-seven, six fifty-four",
			"zero point nine eight seven six five fourth", ],
		[".987654", "point nine eight seven six five four",
			"point, nine, eight, seven, six, five, four",
			"point, ninety-eight, seventy-six, fifty-four",
			"point, nine eighty-seven, six fifty-four",
			"point nine eight seven six five fourth", ],
		["9.87654", "nine point eight seven six five four",
			"nine, point, eight, seven, six, five, four",
			"nine, point, eighty-seven, sixty-five, four",
			"nine, point, eight seventy-six, fifty-four",
			"nine point eight seven six five fourth", ],
		["98.7654", "ninety-eight point seven six five four",
			"nine, eight, point, seven, six, five, four",
			"ninety-eight, point, seventy-six, fifty-four",
			"ninety-eight, point, seven sixty-five, four",
			"ninety-eight point seven six five fourth", ],
		["987.654", "nine hundred and eighty-seven point six five four",
			"nine, eight, seven, point, six, five, four",
			"ninety-eight, seven, point, sixty-five, four",
			"nine eighty-seven, point, six fifty-four",
			"nine hundred and eighty-seven point six five fourth", ],
		["9876.54", "nine thousand, eight hundred and seventy-six point five four",
			"nine, eight, seven, six, point, five, four",
			"ninety-eight, seventy-six, point, fifty-four",
			"nine eighty-seven, six, point, fifty-four",
			"nine thousand, eight hundred and seventy-six point five fourth", ],
		["98765.4", "ninety-eight thousand, seven hundred and sixty-five point four",
			"nine, eight, seven, six, five, point, four",
			"ninety-eight, seventy-six, five, point, four",
			"nine eighty-seven, sixty-five, point, four",
			"ninety-eight thousand, seven hundred and sixty-five point fourth", ],
		["101.202.303", "one hundred and one point two zero two three zero three",
			"one, zero, one, point, two, zero, two, point, three, zero, three",
			"ten, one, point, twenty, two, point, thirty, three",
			"one zero one, point, two zero two, point, three zero three",
		]
	]


	Ordinals = {
		:numbers => {
			0		=> "0th",
			1		=> "1st",
			2		=> "2nd",
			3		=> "3rd",
			4		=> "4th",
			5		=> "5th",
			6		=> "6th",
			7		=> "7th",
			8		=> "8th",
			9		=> "9th",
			10		=> "10th",
			11		=> "11th",
			12		=> "12th",
			13		=> "13th",
			14		=> "14th",
			15		=> "15th",
			16		=> "16th",
			17		=> "17th",
			18		=> "18th",
			19		=> "19th",
			20		=> "20th",
			21		=> "21st",
			22		=> "22nd",
			23		=> "23rd",
			24		=> "24th",
			100		=> "100th",
			101		=> "101st",
			102		=> "102nd",
			103		=> "103rd",
			104		=> "104th",
		},

		:words => {
			'zero'		=> "zeroth",
			'one'		=> "first",
			'two'		=> "second",
			'three'		=> "third",
			'four'		=> "fourth",
			'five'		=> "fifth",
			'six'		=> "sixth",
			'seven'		=> "seventh",
			'eight'		=> "eighth",
			'nine'		=> "ninth",
			'ten'		=> "tenth",

			'eleven'		=> "eleventh",
			'twelve'		=> "twelfth",
			'thirteen'		=> "thirteenth",
			'fourteen'		=> "fourteenth",
			'fifteen'		=> "fifteenth",
			'sixteen'		=> "sixteenth",
			'seventeen'		=> "seventeenth",
			'eighteen'		=> "eighteenth",
			'nineteen'		=> "nineteenth",
			'twenty'		=> "twentieth",

			'twenty-one'		=> "twenty-first",
			'twenty-two'		=> "twenty-second",
			'twenty-three'		=> "twenty-third",
			'twenty-four'		=> "twenty-fourth",
			'one hundred'		=> "one hundredth",
	
			'one hundred and one'		=> "one hundred and first",
			'one hundred and two'		=> "one hundred and second",
			'one hundred and three'		=> "one hundred and third",
			'one hundred and four'		=> "one hundred and fourth",
		}	
	}

	PresentParticiples = {
		'sees'	=> "seeing",
		'eats'	=> "eating",
		'bats'	=> "batting",
		'hates'	=> "hating",
		'spies'	=> "spying",
	}


	PluralDataLine = /^\s*(.*?)\s*->\s*(.*?)\s*(?:\|\s*(.*?)\s*)?(?:#\s*(.*))?$/
	ArticleDataLine = /^\s+(an?)\s+(.*?)\s*$/

	### Auto-generate tests for pluralization and indefinite articles
	begin
		inDataSection = false
		methodCounter = 100
		File::readlines( __FILE__ ).find_all do |line|
			case line
			when /^__END_DATA__$/
				inDataSection = false
				false

			when /^__END__$/
				inDataSection = true
				false

			else
				inDataSection
			end
		end.each do |line|
			case line
			when PluralDataLine
				singular, plural, altplural, comment = $~.to_a[1,4]
				methodName = "test_%04d_pluralize%s" %
					[ methodCounter, singular.gsub(/\W+/, '').capitalize ]
				define_method( methodName.intern ) {||
					printTestHeader "English: Plural of '#{singular}'"
					assertPlural( singular, plural, altplural, comment )
				}
				methodCounter += 1
			
			when ArticleDataLine
				article, word = $~.to_a[1,2]
				methodName = "test_%04d_%s%s" %
					[ methodCounter, article, word.gsub(/\W+/, '').capitalize ]
				define_method( methodName.intern ) {||
					printTestHeader "English: Indefinite article for '#{word}'"
					assertArticle( article, word )
				}

				methodCounter += 1
			else
				debug_msg "Skipped test data line '#{line.chomp}'"
			end
		end
	end

	### Overridden initializer: auto-generated test methods have an arity of 1
	### even though they don't require an argument (as of the current Ruby CVS),
	### and the default initializer throws an :invalid_test for methods with
	### arity != 0.
	def initialize( test_method_name )
        if !respond_to?( test_method_name )
			throw :invalid_test
        end
        @method_name = test_method_name
        @test_passed = true

		Linguistics::use( :en )
	end



	#################################################################
	###	T E S T S
	#################################################################

	def test_0000_loaded
		assert_respond_to Linguistics::EN, :numwords
	end


	def test_0030_numwords
		printTestHeader "English: Numbers to words"
		rval = nil

		NumberTests.each do
			|origin, regular, group1, group2, group3, numord, ordnum|

			op = "Regular numwords for #{origin}"
			assert_nothing_raised( op ) { rval = origin.en.numwords }
			assert_equal regular, rval, op

			op = "Group 1 numwords for #{origin}"
			assert_nothing_raised( op ) { rval = origin.en.numwords( :group => 1 ) }
			assert_equal group1, rval, op

			op = "Group 2 numwords for #{origin}"
			assert_nothing_raised( op ) { rval = origin.en.numwords( :group => 2 ) }
			assert_equal group2, rval, op

			op = "Group 3 numwords for #{origin}"
			assert_nothing_raised( op ) { rval = origin.en.numwords( :group => 3 ) }
			assert_equal group3, rval, op

			if numord
				op = "Numwords -> ordinal for #{origin}"
				assert_nothing_raised( op ) { rval = origin.en.numwords.en.ordinal }
				assert_equal numord, rval, op
			end
		end
	end


	def test_numwords_with_an_symboland_should_use_it_to_join_words
		rval = nil
		
		assert_nothing_raised do
			rval = 2006.en.numwords( :and => ' ' )
		end
		
		assert_equal "two thousand six", rval
	end


	def test_0040_ordinalNumbers
		printTestHeader "English: Numbers to ordinals"
		rval = nil

		Ordinals[:numbers].each do |input,output|
			op = "Ordinal for #{input.inspect}"
			assert_nothing_raised( op ) { rval = input.en.ordinal }
			assert_kind_of String, rval, op
			assert_equal output, rval, op
		end
	end


	def test_0045_ordinalWords
		printTestHeader "English: Number words to ordinals"
		rval = nil

		Ordinals[:numbers].each do |input,output|
			op = "Ordinal for #{input.inspect}"
			assert_nothing_raised( op ) { rval = input.en.ordinal }
			assert_kind_of String, rval, op
			assert_equal output, rval, op
		end
	end



	#
	# Common routines for auto-generated test methods
	#

	def assertPlural( singular, plural, altplural, comment )
		rval, pl_noun, pl_verb, pl, pl_val, altpl_val = [nil] * 6

		isNv = false
		case comment
		when /verb/i
			isNv = 'verb'
		when /noun/i
			isNv = 'noun'
		end

		op = "Pluralizing '#{singular}': "
		assert_nothing_raised( op + "plural verb" ) {
			pl_verb = singular.en.plural_verb
		}
		assert_nothing_raised( op + "plural noun" ) {
			pl_noun = singular.en.plural_noun
		}
		assert_nothing_raised( op + "plural" ) {
			pl = singular.en.plural
		}

		if !altplural.nil? && !altplural.empty?
			begin
				assert_nothing_raised( op + "classical" ) {
					Linguistics::classical = true
					altpl_val = singular.en.plural
				}
			ensure
				Linguistics::classical = false
			end
		end

		pl_val = isNv ? (isNv == "noun" ? pl_noun : pl_verb) : pl

		assert_equal plural, pl_val, "Plural of '#{singular}'"
		assert_equal altplural, altpl_val,
			"Classical plural of '#{singular}'" unless
			altplural.nil? or altplural.empty?
	end


	def assertArticle( article, word )
		rval = nil
		op = "Indefinite article for '#{word}'"
		assert_nothing_raised( op ) {
			rval = word.en.a
		}
		assert_equal "#{article} #{word}", rval, op
	end

		
end


### Dataset is from Lingua::EN::Inflect's test suite.
__END__

                    a  ->  some                         # INDEFINITE ARTICLE
                    a  ->  as                           # NOUN FORM
       A.C.R.O.N.Y.M.  ->  A.C.R.O.N.Y.M.s
             abscissa  ->  abscissas|abscissae
             Achinese  ->  Achinese
            acropolis  ->  acropolises
                adieu  ->  adieus|adieux
     adjutant general  ->  adjutant generals
                aegis  ->  aegises
             afflatus  ->  afflatuses
               afreet  ->  afreets|afreeti
                afrit  ->  afrits|afriti
              agendum  ->  agenda
         aide-de-camp  ->  aides-de-camp
             Alabaman  ->  Alabamans
               albino  ->  albinos
                album  ->  albums
             Alfurese  ->  Alfurese
                 alga  ->  algae
                alias  ->  aliases
                 alto  ->  altos|alti
               alumna  ->  alumnae
              alumnus  ->  alumni
             alveolus  ->  alveoli
                   am  ->  are
             am going  ->  are going
  ambassador-at-large  ->  ambassadors-at-large
            Amboinese  ->  Amboinese
          Americanese  ->  Americanese
               amoeba  ->  amoebas|amoebae
              Amoyese  ->  Amoyese
                   an  ->  some                         # INDEFINITE ARTICLE
             analysis  ->  analyses
             anathema  ->  anathemas|anathemata
           Andamanese  ->  Andamanese
             Angolese  ->  Angolese
             Annamese  ->  Annamese
              antenna  ->  antennas|antennae
                 anus  ->  anuses
                 apex  ->  apexes|apices
               apex's  ->  apexes'|apices'              # POSSESSIVE FORM
             aphelion  ->  aphelia
            apparatus  ->  apparatuses|apparatus
             appendix  ->  appendixes|appendices
                apple  ->  apples
             aquarium  ->  aquariums|aquaria
            Aragonese  ->  Aragonese
            Arakanese  ->  Arakanese
          archipelago  ->  archipelagos
                  are  ->  are
             are made  ->  are made
            armadillo  ->  armadillos
             arpeggio  ->  arpeggios
            arthritis  ->  arthritises
             asbestos  ->  asbestoses
            asparagus  ->  asparaguses
                  ass  ->  asses
             Assamese  ->  Assamese
               asylum  ->  asylums
            asyndeton  ->  asyndeta
                at it  ->  at them                      # ACCUSATIVE
                  ate  ->  ate
                atlas  ->  atlases
     attorney general  ->  attorneys general
   attorney of record  ->  attorneys of record
               aurora  ->  auroras|aurorae
             aviatrix  ->  aviatrixes|aviatrices
           aviatrix's  ->  aviatrixes'|aviatrices'
           Avignonese  ->  Avignonese
                  axe  ->  axes
                 axis  ->  axes
        Azerbaijanese  ->  Azerbaijanese
             bacillus  ->  bacilli
            bacterium  ->  bacteria
              Bahaman  ->  Bahamans
             Balinese  ->  Balinese
               bamboo  ->  bamboos
                banjo  ->  banjoes
                 bass  ->  basses                       # INSTRUMENT, NOT FISH
                basso  ->  bassos|bassi
               bathos  ->  bathoses
                 beau  ->  beaus|beaux
                 beef  ->  beefs|beeves
           beneath it  ->  beneath them                 # ACCUSATIVE
            Bengalese  ->  Bengalese
                 bent  ->  bent                         # VERB FORM
                 bent  ->  bents                        # NOUN FORM
              Bernese  ->  Bernese
            Bhutanese  ->  Bhutanese
                 bias  ->  biases
               biceps  ->  biceps
                bison  ->  bisons|bison
            Bolognese  ->  Bolognese
                bonus  ->  bonuses
             Borghese  ->  Borghese
                 boss  ->  bosses
            Bostonese  ->  Bostonese
                  box  ->  boxes
                  boy  ->  boys
                bravo  ->  bravoes
                bream  ->  bream
             breeches  ->  breeches
          bride-to-be  ->  brides-to-be
             britches  ->  britches
           bronchitis  ->  bronchitises
             bronchus  ->  bronchi
              brother  ->  brothers|brethren
            brother's  ->  brothers'|brethren's
              buffalo  ->  buffaloes|buffalo
             Buginese  ->  Buginese
                 buoy  ->  buoys
               bureau  ->  bureaus|bureaux
               Burman  ->  Burmans
              Burmese  ->  Burmese
             bursitis  ->  bursitises
                  bus  ->  buses
                 buzz  ->  buzzes
               buzzes  ->  buzz                         # VERB FORM
                by it  ->  by them                      # ACCUSATIVE
               caddis  ->  caddises
                 cake  ->  cakes
            Calabrese  ->  Calabrese
                 calf  ->  calves
               callus  ->  calluses
          Camaldolese  ->  Camaldolese
                cameo  ->  cameos
               campus  ->  campuses
                  can  ->  cans                         # NOUN FORM
                  can  ->  can                          # VERB FORM (all pers.)
          candelabrum  ->  candelabra
             cannabis  ->  cannabises
                canto  ->  cantos
            Cantonese  ->  Cantonese
               cantus  ->  cantus
               canvas  ->  canvases
              CAPITAL  ->  CAPITALS
            carcinoma  ->  carcinomas|carcinomata
                 care  ->  cares
                cargo  ->  cargoes
            Carlylese  ->  Carlylese
                 carp  ->  carp
            Cassinese  ->  Cassinese
                  cat  ->  cats
              catfish  ->  catfish
             Celanese  ->  Celanese
            Ceylonese  ->  Ceylonese
             chairman  ->  chairmen
              chamois  ->  chamois
                chaos  ->  chaoses
              chapeau  ->  chapeaus|chapeaux
             charisma  ->  charismas|charismata
               chases  ->  chase
              chassis  ->  chassis
              chateau  ->  chateaus|chateaux
               cherub  ->  cherubs|cherubim
           chickenpox  ->  chickenpox
                chief  ->  chiefs
                child  ->  children
              Chinese  ->  Chinese
               chorus  ->  choruses
               church  ->  churches
             cicatrix  ->  cicatrixes|cicatrices
               circus  ->  circuses
                class  ->  classes
              classes  ->  class                        # VERB FORM
             clippers  ->  clippers
             clitoris  ->  clitorises|clitorides
                  cod  ->  cod
                codex  ->  codices
               coitus  ->  coitus
             commando  ->  commandos
           compendium  ->  compendiums|compendia
             Congoese  ->  Congoese
            Congolese  ->  Congolese
           conspectus  ->  conspectuses
            contralto  ->  contraltos|contralti
          contretemps  ->  contretemps
            conundrum  ->  conundrums
                corps  ->  corps
               corpus  ->  corpuses|corpora
               cortex  ->  cortexes|cortices
               cosmos  ->  cosmoses
        court martial  ->  courts martial
                  cow  ->  cows|kine
              cranium  ->  craniums|crania
            crescendo  ->  crescendos
            criterion  ->  criteria
           curriculum  ->  curriculums|curricula
                 dais  ->  daises
           data point  ->  data points
                datum  ->  data
               debris  ->  debris
              decorum  ->  decorums
                 deer  ->  deer
           delphinium  ->  delphiniums
          desideratum  ->  desiderata
             diabetes  ->  diabetes
               dictum  ->  dictums|dicta
                  did  ->  did
             did need  ->  did need
            digitalis  ->  digitalises
                dingo  ->  dingoes
              diploma  ->  diplomas|diplomata
               discus  ->  discuses
                 dish  ->  dishes
                ditto  ->  dittos
                djinn  ->  djinn
                 does  ->  do
                  dog  ->  dogs
                dogma  ->  dogmas|dogmata
           dominatrix  ->  dominatrixes|dominatrices
               domino  ->  dominoes
            Dongolese  ->  Dongolese
                drama  ->  dramas|dramata
                 drum  ->  drums
                dwarf  ->  dwarves
               dynamo  ->  dynamos
                edema  ->  edemas|edemata
                eland  ->  elands|eland
                  elf  ->  elves
                  elk  ->  elks|elk
               embryo  ->  embryos
             emporium  ->  emporiums|emporia
         encephalitis  ->  encephalitises
             enconium  ->  enconiums|enconia
                enema  ->  enemas|enemata
               enigma  ->  enigmas|enigmata
            ephemeris  ->  ephemerides
            epidermis  ->  epidermises
              erratum  ->  errata
                ethos  ->  ethoses
           eucalyptus  ->  eucalyptuses
             extremum  ->  extrema
                 eyas  ->  eyases
             factotum  ->  factotums
              Faroese  ->  Faroese
                fauna  ->  faunas|faunae
                  fax  ->  faxes
            Ferrarese  ->  Ferrarese
                ferry  ->  ferries
                fetus  ->  fetuses
               fiance  ->  fiances
              fiancee  ->  fiancees
               fiasco  ->  fiascos
                 fish  ->  fish
                 fizz  ->  fizzes
             flamingo  ->  flamingoes
                flora  ->  floras|florae
             flounder  ->  flounder
                focus  ->  focuses|foci
               foetus  ->  foetuses
                folio  ->  folios
           Foochowese  ->  Foochowese
                 foot  ->  feet
               foot's  ->  feet's                       # POSSESSIVE FORM
              foramen  ->  foramens|foramina
              formula  ->  formulas|formulae
                forum  ->  forums
               fought  ->  fought
                  fox  ->  foxes
             from him  ->  from them
              from it  ->  from them                    # ACCUSATIVE
               fungus  ->  funguses|fungi
             Gabunese  ->  Gabunese
              gallows  ->  gallows
             ganglion  ->  ganglions|ganglia
                  gas  ->  gases
               gateau  ->  gateaus|gateaux
                 gave  ->  gave
        generalissimo  ->  generalissimos
             Genevese  ->  Genevese
                genie  ->  genies|genii
               genius  ->  geniuses|genii
              Genoese  ->  Genoese
                genus  ->  genera
               German  ->  Germans
               ghetto  ->  ghettos
           Gilbertese  ->  Gilbertese
              glottis  ->  glottises
              Goanese  ->  Goanese
                goose  ->  geese
     Governor General  ->  Governors General
                  goy  ->  goys|goyim
             graffiti  ->  graffiti
             graffito  ->  graffiti
                guano  ->  guanos
            guardsman  ->  guardsmen
             Guianese  ->  Guianese
                gumma  ->  gummas|gummata
            gymnasium  ->  gymnasiums|gymnasia
                  had  ->  had
          had thought  ->  had thought
            Hainanese  ->  Hainanese
         handkerchief  ->  handkerchiefs
             Hararese  ->  Hararese
            Harlemese  ->  Harlemese
            harmonium  ->  harmoniums
                  has  ->  have
           has become  ->  have become
             has been  ->  have been
             has-been  ->  has-beens
             Havanese  ->  Havanese
                 have  ->  have
        have conceded  ->  have conceded
                   he  ->  they
         headquarters  ->  headquarters
            Heavenese  ->  Heavenese
                helix  ->  helices
            hepatitis  ->  hepatitises
                  her  ->  them                         # PRONOUN
                  her  ->  their                        # POSSESSIVE ADJ
                 hero  ->  heroes
               herpes  ->  herpes
                 hers  ->  theirs                       # POSSESSIVE NOUN
              herself  ->  themselves
               hiatus  ->  hiatuses|hiatus
            highlight  ->  highlights
              hijinks  ->  hijinks
                  him  ->  them
              himself  ->  themselves
         hippopotamus  ->  hippopotamuses|hippopotami
           Hiroshiman  ->  Hiroshimans
                  his  ->  their                        # POSSESSIVE ADJ
                  his  ->  theirs                       # POSSESSIVE NOUN
           honorarium  ->  honorariums|honoraria
                 hoof  ->  hoofs|hooves
           Hoosierese  ->  Hoosierese
         Hottentotese  ->  Hottentotese
                house  ->  houses
            housewife  ->  housewives
               hubris  ->  hubrises
                human  ->  humans
             Hunanese  ->  Hunanese
                hydra  ->  hydras|hydrae
           hyperbaton  ->  hyperbata
            hyperbola  ->  hyperbolas|hyperbolae
                    I  ->  we
                 ibis  ->  ibises
            ignoramus  ->  ignoramuses
              impetus  ->  impetuses|impetus
              incubus  ->  incubuses|incubi
                index  ->  indexes|indices
          Indochinese  ->  Indochinese
              inferno  ->  infernos
              innings  ->  innings
    Inspector General  ->  Inspectors General
          interregnum  ->  interregnums|interregna
                 iris  ->  irises|irides
                   is  ->  are
             is eaten  ->  are eaten
                   it  ->  they                         # NOMINATIVE
                  its  ->  their                        # POSSESSIVE FORM
               itself  ->  themselves
           jackanapes  ->  jackanapes
             Japanese  ->  Japanese
             Javanese  ->  Javanese
                Jerry  ->  Jerrys
                jerry  ->  jerries
                 jinx  ->  jinxes
               jinxes  ->  jinx                         # VERB FORM
           Johnsonese  ->  Johnsonese
                Jones  ->  Joneses
                jumbo  ->  jumbos
             Kanarese  ->  Kanarese
           Kiplingese  ->  Kiplingese
                knife  ->  knives                       # NOUN FORM
                knife  ->  knife                        # VERB FORM (1st/2nd pers.)
               knifes  ->  knife                        # VERB FORM (3rd pers.)
             Kongoese  ->  Kongoese
            Kongolese  ->  Kongolese
               lacuna  ->  lacunas|lacunae
      lady in waiting  ->  ladies in waiting
            Lapponese  ->  Lapponese
               larynx  ->  larynxes|larynges
                latex  ->  latexes|latices
                 leaf  ->  leaf                         # VERB FORM (1st/2nd pers.)
                 leaf  ->  leaves                       # NOUN FORM
                leafs  ->  leaf                         # VERB FORM (3rd pers.)
             Lebanese  ->  Lebanese
                lemma  ->  lemmas|lemmata
                 lens  ->  lenses
              Leonese  ->  Leonese
      lick of the cat  ->  licks of the cat
   Lieutenant General  ->  Lieutenant Generals
                 life  ->  lives
                Liman  ->  Limans
                lingo  ->  lingos
                 loaf  ->  loaves
                locus  ->  loci
            Londonese  ->  Londonese
           Lorrainese  ->  Lorrainese
             lothario  ->  lotharios
                louse  ->  lice
             Lucchese  ->  Lucchese
              lumbago  ->  lumbagos
                lumen  ->  lumens|lumina
              lustrum  ->  lustrums|lustra
               lyceum  ->  lyceums
             lymphoma  ->  lymphomas|lymphomata
                 lynx  ->  lynxes
              Lyonese  ->  Lyonese
               M.I.A.  ->  M.I.A.s
             Macanese  ->  Macanese
          Macassarese  ->  Macassarese
             mackerel  ->  mackerel
                 made  ->  made
             Madurese  ->  Madurese
                magma  ->  magmas|magmata
              magneto  ->  magnetos
        Major General  ->  Major Generals
           Malabarese  ->  Malabarese
              Maltese  ->  Maltese
                  man  ->  men
             mandamus  ->  mandamuses
            manifesto  ->  manifestos
               mantis  ->  mantises
              marquis  ->  marquises
                 Mary  ->  Marys
              maximum  ->  maximums|maxima
              measles  ->  measles
               medico  ->  medicos
               medium  ->  mediums|media
             medium's  ->  mediums'|media's
               medusa  ->  medusas|medusae
           memorandum  ->  memorandums|memoranda
             meniscus  ->  menisci
            Messinese  ->  Messinese
        metamorphosis  ->  metamorphoses
           metropolis  ->  metropolises
                 mews  ->  mews
               miasma  ->  miasmas|miasmata
             Milanese  ->  Milanese
               milieu  ->  milieus|milieux
            millenium  ->  milleniums|millenia
              minimum  ->  minimums|minima
                 minx  ->  minxes
                 miss  ->  miss                         # VERB FORM (1st/2nd pers.)
                 miss  ->  misses                       # NOUN FORM
               misses  ->  miss                         # VERB FORM (3rd pers.)
             mittamus  ->  mittamuses
             Modenese  ->  Modenese
             momentum  ->  momentums|momenta
                money  ->  monies
             mongoose  ->  mongooses
                moose  ->  mooses|moose
        mother-in-law  ->  mothers-in-law
                mouse  ->  mice
                mumps  ->  mumps
             Muranese  ->  Muranese
                murex  ->  murices
               museum  ->  museums
            mustachio  ->  mustachios
                   my  ->  our                          # POSSESSIVE FORM
               myself  ->  ourselves
               mythos  ->  mythoi
            Nakayaman  ->  Nakayamans
           Nankingese  ->  Nankingese
           nasturtium  ->  nasturtiums
            Navarrese  ->  Navarrese
               nebula  ->  nebulas|nebulae
             Nepalese  ->  Nepalese
             neuritis  ->  neuritises
             neurosis  ->  neuroses
                 news  ->  news
                nexus  ->  nexus
              Niasese  ->  Niasese
           Nicobarese  ->  Nicobarese
               nimbus  ->  nimbuses|nimbi
            Nipponese  ->  Nipponese
                   no  ->  noes
              nostrum  ->  nostrums
             noumenon  ->  noumena
                 nova  ->  novas|novae
            nucleolus  ->  nucleoluses|nucleoli
              nucleus  ->  nuclei
                  oaf  ->  oafs
               octavo  ->  octavos
              octopus  ->  octopuses|octopodes
               oedema  ->  oedemas|oedemata
            Oklahoman  ->  Oklahomans
              omnibus  ->  omnibuses
                on it  ->  on them                      # ACCUSATIVE
                 onus  ->  onuses
                opera  ->  operas
              optimum  ->  optimums|optima
                 opus  ->  opuses|opera
              organon  ->  organa
          ought to be  ->  ought to be                  # VERB (UNLIKE bride to be)
                 ovum  ->  ova
                   ox  ->  oxen
                 ox's  ->  oxen's                       # POSSESSIVE FORM
             oxymoron  ->  oxymorons|oxymora
              Panaman  ->  Panamans
             parabola  ->  parabolas|parabolae
              Parmese  ->  Parmese
               pathos  ->  pathoses
              pegasus  ->  pegasuses
            Pekingese  ->  Pekingese
               pelvis  ->  pelvises
             pendulum  ->  pendulums
                penis  ->  penises|penes
             penumbra  ->  penumbras|penumbrae
           perihelion  ->  perihelia
              persona  ->  personae
            petroleum  ->  petroleums
              phalanx  ->  phalanxes|phalanges
                  PhD  ->  PhDs
           phenomenon  ->  phenomena
             philtrum  ->  philtrums
                photo  ->  photos
               phylum  ->  phylums|phyla
                piano  ->  pianos|piani
          Piedmontese  ->  Piedmontese
               pincer  ->  pincers
              pincers  ->  pincers
            Pistoiese  ->  Pistoiese
              plateau  ->  plateaus|plateaux
                 play  ->  plays
               plexus  ->  plexuses|plexus
               pliers  ->  pliers
                plies  ->  ply                          # VERB FORM
                polis  ->  polises
             Polonese  ->  Polonese
             pontifex  ->  pontifexes|pontifices
          portmanteau  ->  portmanteaus|portmanteaux
           Portuguese  ->  Portuguese
               potato  ->  potatoes
                  pox  ->  pox
               pragma  ->  pragmas|pragmata
              premium  ->  premiums
          prima donna  ->  prima donnas|prime donne
                  pro  ->  pros
          proceedings  ->  proceedings
         prolegomenon  ->  prolegomena
                proof  ->  proofs
     proof of concept  ->  proofs of concept
          prosecutrix  ->  prosecutrixes|prosecutrices
           prospectus  ->  prospectuses|prospectus
            protozoan  ->  protozoans
            protozoon  ->  protozoa
                  put  ->  put
              quantum  ->  quantums|quanta
quartermaster general  ->  quartermasters general
               quarto  ->  quartos
               quorum  ->  quorums
               rabies  ->  rabies
               radius  ->  radiuses|radii
                radix  ->  radices
                rebus  ->  rebuses
             reindeer  ->  reindeer
                rhino  ->  rhinos
           rhinoceros  ->  rhinoceroses|rhinoceros
            Romagnese  ->  Romagnese
             Romanese  ->  Romanese
                romeo  ->  romeos
                 roof  ->  roofs
              rostrum  ->  rostrums|rostra
               ruckus  ->  ruckuses
               salmon  ->  salmon
            Sangirese  ->  Sangirese
                 sank  ->  sank
           Sarawakese  ->  Sarawakese
              sarcoma  ->  sarcomas|sarcomata
            sassafras  ->  sassafrases
                  saw  ->  saws                         # NOUN FORM
                  saw  ->  saw                          # VERB FORM (1st/2nd pers.)
                 saws  ->  saw                          # VERB FORM (3rd pers.)
                scarf  ->  scarves
               schema  ->  schemas|schemata
             scissors  ->  scissors
             Scotsman  ->  Scotsmen
             sea-bass  ->  sea-bass
                 self  ->  selves
               Selman  ->  Selmans
           Senegalese  ->  Senegalese
               seraph  ->  seraphs|seraphim
               series  ->  series
            shall eat  ->  shall eat
              Shavese  ->  Shavese
            Shawanese  ->  Shawanese
                  she  ->  they
                sheaf  ->  sheaves
               shears  ->  shears
                sheep  ->  sheep
                shelf  ->  shelves
          should have  ->  should have
              Siamese  ->  Siamese
              Sienese  ->  Sienese
            Sikkimese  ->  Sikkimese
                silex  ->  silices
              simplex  ->  simplexes|simplices
           Singhalese  ->  Singhalese
            Sinhalese  ->  Sinhalese
                sinus  ->  sinuses|sinus
                 size  ->  sizes
                sizes  ->  size                         #VERB FORM
             smallpox  ->  smallpox
                Smith  ->  Smiths
           Sogdianese  ->  Sogdianese
            soliloquy  ->  soliloquies
                 solo  ->  solos|soli
                 soma  ->  somas|somata
       son of a bitch  ->  sons of bitches
              Sonaman  ->  Sonamans
              soprano  ->  sopranos|soprani
               sought  ->  sought
              species  ->  species
             spectrum  ->  spectrums|spectra
             speculum  ->  speculums|specula
                spent  ->  spent
         spermatozoon  ->  spermatozoa
               sphinx  ->  sphinxes|sphinges
              stadium  ->  stadiums|stadia
               stamen  ->  stamens|stamina
               status  ->  statuses|status
               stereo  ->  stereos
               stigma  ->  stigmas|stigmata
             stimulus  ->  stimuli
                stoma  ->  stomas|stomata
               storey  ->  storeys
                story  ->  stories
              stratum  ->  strata
               strife  ->  strifes
                stylo  ->  stylos
               stylus  ->  styluses|styli
             succubus  ->  succubuses|succubi
             Sudanese  ->  Sudanese
               suffix  ->  suffixes
            Sundanese  ->  Sundanese
             superior  ->  superiors
      Surgeon-General  ->  Surgeons-General
              surplus  ->  surpluses
            Swahilese  ->  Swahilese
                swine  ->  swines|swine
              syringe  ->  syringes
               syrinx  ->  syrinxes|syringes
              tableau  ->  tableaus|tableaux
              Tacoman  ->  Tacomans
               tattoo  ->  tattoos
                tempo  ->  tempos|tempi
           Tenggerese  ->  Tenggerese
            testatrix  ->  testatrixes|testatrices
               testes  ->  testes
               testis  ->  testes
                 that  ->  those
                their  ->  their                        # POSSESSIVE FORM (GENDER-INCLUSIVE)
             themself  ->  themselves                   # ugly but gaining currency
                 they  ->  they                         # for indeterminate gender
                 this  ->  these
              thought  ->  thought                      # VERB FORM
              thought  ->  thoughts                     # NOUN FORM
                Times  ->  Timeses
             Timorese  ->  Timorese
             Tirolese  ->  Tirolese
               to her  ->  to them
           to herself  ->  to themselves
               to him  ->  to them
           to himself  ->  to themselves
                to it  ->  to them
                to it  ->  to them                      # ACCUSATIVE
            to itself  ->  to themselves
                to me  ->  to us
            to myself  ->  to ourselves
              to them  ->  to them                      # for indeterminate gender
          to themself  ->  to themselves                # ugly but gaining currency
               to you  ->  to you
          to yourself  ->  to yourselves
            Tocharese  ->  Tocharese
               tomato  ->  tomatoes
            Tonkinese  ->  Tonkinese
          tonsillitis  ->  tonsillitises
                tooth  ->  teeth
             Torinese  ->  Torinese
                torus  ->  toruses|tori
            trapezium  ->  trapeziums|trapezia
               trauma  ->  traumas|traumata
              travois  ->  travois
              trellis  ->  trellises
                tries  ->  try
               trilby  ->  trilbys
             trousers  ->  trousers
            trousseau  ->  trousseaus|trousseaux
                trout  ->  trout
                  try  ->  tries
                 tuna  ->  tuna
                 turf  ->  turfs|turves
             Tyrolese  ->  Tyrolese
            ultimatum  ->  ultimatums|ultimata
            umbilicus  ->  umbilicuses|umbilici
                umbra  ->  umbras|umbrae
               uterus  ->  uteruses|uteri
               vacuum  ->  vacuums|vacua
               vellum  ->  vellums
                velum  ->  velums|vela
           Vermontese  ->  Vermontese
             Veronese  ->  Veronese
             vertebra  ->  vertebrae
               vertex  ->  vertexes|vertices
             Viennese  ->  Viennese
           Vietnamese  ->  Vietnamese
                virus  ->  viruses
                vixen  ->  vixens
               vortex  ->  vortexes|vortices
               walrus  ->  walruses
                  was  ->  were
       was faced with  ->  were faced with
           was hoping  ->  were hoping
           Wenchowese  ->  Wenchowese
                 were  ->  were
           were found  ->  were found
                wharf  ->  wharves
              whiting  ->  whiting
           Whitmanese  ->  Whitmanese
                 wife  ->  wives
           wildebeest  ->  wildebeests|wildebeest
                 will  ->  will                         # VERB FORM
                 will  ->  wills                        # NOUN FORM
             will eat  ->  will eat                     # VERB FORM
                wills  ->  will                         # VERB FORM
                 wish  ->  wishes
             with him  ->  with them
              with it  ->  with them                    # ACCUSATIVE
                 wolf  ->  wolves
                woman  ->  women
   woman of substance  ->  women of substance
              woman's  ->  women's                      # POSSESSIVE FORM
            woodlouse  ->  woodlice
              Yakiman  ->  Yakimans
             Yengeese  ->  Yengeese
            Yokohaman  ->  Yokohamans
                  you  ->  you
                 your  ->  your                         # POSSESSIVE FORM
             yourself  ->  yourselves
                Yuman  ->  Yumans
            Yunnanese  ->  Yunnanese
                 zoon  ->  zoa

	an A.B.C
	an AI
	an AGE
	an agendum
	an aide-de-camp
	an albino
	 a B.L.T. sandwich
	 a BMW
	 a BLANK
	 a bacterium
	 a Burmese restaurant
	 a C.O.
	 a CCD
	 a COLON
	 a cameo
	 a CAPITAL
	 a D.S.M.
	 a DNR
	 a DINNER
	 a dynamo
	an E.K.G.
	an ECG
	an EGG
	an embryo
	an erratum
	 a eucalyptus
	an Euler number
	 a eulogy
	 a euphemism
	 a euphoria
	 a ewe
	 a ewer
	an extremum
	an eye
	an F.B.I. agent
	an FSM
	 a FACT
	 a FAQ
	an F.A.Q.
	 a fish
	 a G-string
	 a GSM phone
	 a GOD
	 a genus
	 a Governor General
	an H-Bomb
	an H.M.S Ark Royal
	an HSL colour space
	 a HAL 9000
	an H.A.L. 9000
	 a has-been
	 a height
	an heir
	 a honed blade
	an honest man
	 a honeymoon
	an honorarium
	an honorary degree
	an honoree
	an honorific
	 a Hough transform
	 a hound
	an hour
	an hourglass
	 a houri
	 a house
	an I.O.U.
	an IQ
	an IDEA
	an inferno
	an Inspector General
	 a jumbo
	 a knife
	an L.E.D.
	 a LED
	an LCD
	 a lady in waiting
	 a leaf
	an M.I.A.
	 a MIASMA
	an MTV channel
	 a Major General
	an N.C.O.
	an NCO
	 a NATO country
	 a note
	an O.K.
	an OK
	an OLE
	an octavo
	an octopus
	an okay
	 a once-and-future-king
	an oncologist
	 a one night stand
	an onerous task
	an opera
	an optimum
	an opus
	an ox
	 a Ph.D.
	 a PET
	 a P.E.T. scan
	 a plateau
	 a quantum
	an R.S.V.P.
	an RSVP
	 a REST
	 a reindeer
	an S.O.S.
	 a SUM
	an SST
	 a salmon
	 a T.N.T. bomb
	 a TNT bomb
	 a TENT
	 a thought
	 a tomato
	 a U-boat
	 a U.F.O.
	 a UFO
	 a ubiquity
	 a unicorn
	an unidentified flying object
	 a uniform
	 a unimodal system
	an unimpressive record
	an uninformed opinion
	an uninvited guest
	 a union
	 a uniplex
	 a uniprocessor
	 a unique opportunity
	 a unisex hairdresser
	 a unison
	 a unit
	 a unitarian
	 a united front
	 a unity
	 a univalent bond
	 a univariate statistic
	 a universe
	an unordered meal
	 a uranium atom
	an urban myth
	an urbane miss
	an urchin
	 a urea detector
	 a urethane monomer
	an urge
	an urgency
	 a urinal
	an urn
	 a usage
	 a use
	an usher
	 a usual suspect
	 a usurer
	 a usurper
	 a utensil
	 a utility
	an utmost urgency
	 a utopia
	an utterance
	 a V.I.P.
	 a VIPER
	 a viper
	an X-ray
	an X.O.
	 a XYLAPHONE
	an XY chromosome
	 a xenophobe
	 a Y-shaped pipe
	 a Y.Z. plane
	 a YMCA
	an YBLENT eye
	an yblent eye
	an yclad body
	 a yellowing
	 a yield
	 a youth
	 a youth
	an ypsiliform junction
	an yttrium atom
	 a zoo

__END_DATA__
