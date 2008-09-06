#!/usr/bin/ruby -w
#
# Unit test for English infinitive (stem) forms. 
# $Id: infinitive.tests.rb,v 21e0fa69b1a3 2008/09/06 05:20:07 ged $
#
# Copyright (c) 2003 The FaerieMUD Consortium.
# 

unless defined? Linguistics::TestCase
	testsdir = File::dirname( File::dirname(File::expand_path( __FILE__ )) )
	$LOAD_PATH.unshift testsdir unless $LOAD_PATH.include?( testsdir )

	require 'lingtestcase'
end


### This test case tests the English infinitive function.
class EnglishInfinitiveTestCase < Linguistics::TestCase

	Linguistics::use( :en )
	include Linguistics::EN

	### Auto-generate tests for the dataset beneath the '__END__'
	begin
		inDataSection = false
		methodCounter = 5

		# Read the lines of this file below the __END__, splitting each
		# non-comment line into rule, original word, and expected infinitive
		# form. Then generate a test method for each one.
		File::readlines( __FILE__ ).find_all {|line|
			case line
			when /^__END_DATA__$/; inDataSection = false
			when /^__END__$/; inDataSection = true; false
			else inDataSection end
		}.each {|line|
			next if /^\s*#/ =~ line
			rule, oword, stemword = line.split( /\s+/ )

			# Add a test method for the method interface with a name generated
			# from the origin word and the method counter.
			methodname = "test_%04d_method_infinitive%s" %
				[ methodCounter, oword.capitalize.gsub(/\W+/, '') ]
			define_method( methodname.intern ) {||
				rval = ''
				printTestHeader "English: Stem of '#{oword}' (method)"

				assert_nothing_raised { rval = oword.en.infinitive }
				assert_instance_of Linguistics::EN::Infinitive, rval
				assert_block( "Method iface: Stem for #{oword}" ) {
					stemword == rval or stemword == rval.word2
				}
				assert_equal rule, rval.rule, "Method iface: Infinitive rule for #{oword}"
			}

			methodCounter += 1

			# Add a test method for the functional interface with a name
			# generated from the origin word and the method counter.
			methodname = "test_%04d_function_infinitive%s" %
				[ methodCounter, oword.capitalize.gsub(/\W+/, '') ]
			define_method( methodname.intern ) {||
				rval = ''
				printTestHeader "English: Stem of '#{oword}' (functional)"

				assert_nothing_raised { rval = infinitive( oword ) }
				assert_instance_of Linguistics::EN::Infinitive, rval
				assert_block( "Function iface: Stem for #{oword}" ) {
					stemword == rval or stemword == rval.word2
				}
				assert_equal rule, rval.rule, "Function iface: Infinitive rule for #{oword}"
			}

			methodCounter += 1
		}
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
	end


	#################################################################
	###	T E S T S
	#################################################################

	### Test to be sure the infinitive module loaded.
	def test_000_module
		printTestHeader "English: Infinitive method"
		assert_respond_to Linguistics::EN, :infinitive
	end
end


### Dataset is copied from Lingua::EN::Infinitive by Ron Savage (with a few
### bugfixes).
__END__
1			aches			ache
1			arches			arch
2			vases			vase
2			basses			bass
3			axes			axe
3			fixes			fix
4			hazes			haze
4			buzzes			buzz
6a			caress			caress
6b			bans			ban
7			Jones's			Jones
8			creater			creater
9			reacter			reacter
10			copier			copy
11			baker			bake
11			smaller			small
12a			curried			curry
12b			bored			bore
12b			seated			seat
# Can't handle these 2 with the special code as for the following 5 because after
# chopping the suffix, we are not left with a one-syllable word. Ie it's too hard.
# Yes, that was 5 not 7. Look for the doubled-consonant in the middle of the word.
# The special code is in Infinitive.pm @ line 1188.
#12b		bootstrapped	bootstrap
#12b		bootstrapping	bootstrap
12b			tipped			tip
12b			kitted			kit
12b			capped			cap
12b			chopped			chop
13a			flies			fly
13b			palates			palate
14a			liveliest		lively
14b			wisest			wise
14b			strongest		strong
15			living			live
15			laughing		laugh
15			swaying			sway
15			catching		catch
15			smiling			smile
15			swimming		swim
15			running			run
15			floating		float
15			keyboarding		keyboard
15			wrestling		wrestle
15			traveling		travel
15			traipsing		traipse
16			stylist			style
16			dentist			dent
17			cubism			cube
17			socialism		social
18			scarcity		scarce
18			rapidity		rapid
19			immunize		immune
19			lionize			lion
20c			livable			live
20c			portable		port
22			nobility		noble
23			identifiable	identify
24			psychologist	psychology
25			photographic	photography
26			stylistic		stylist
27			martensitic		martensite
27			politic			polite
28			ladylike		lady
29			biologic		biology
30			battlement		battle
31			supplemental	supplement
32			thermometry		thermometer
33			inadvertence	inadvertent
34			potency			potent
35			discipleship	disciple
36			mystical		mystic
37			regional		region
37			national		nation
38			horribly		horrible
39			scantily		scanty
40			partly			part
41a			dutiful			duty
41b			harmful			harm
42a			likelihood		likely
42b			neighborhood	neighbor
42b			neighbourhood	neighbour
43a			penniless		penny
43b			listless		list
44a			heartiness		hearty
44b			coolness		cool
45			specification	specify
46			rationalization	rationalize
47			detection		detect
48			exertion		exert
49			creation		create
50			creator			create
51			detector		detect
52			creative		creation
52			decisive		decision
53			Australian		Australia
54			Jeffersonian	Jefferson
irregular	rove			reeve
irregular	dove			dive
irregular	snuck			sneak
irregular	wot				wit
