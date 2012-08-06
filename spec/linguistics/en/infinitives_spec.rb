#!/usr/bin/env spec -cfs

BEGIN {
	require 'pathname'
	basedir = Pathname.new( __FILE__ ).dirname.parent.parent.parent

	libdir = basedir + "lib"

	$LOAD_PATH.unshift( basedir.to_s ) unless $LOAD_PATH.include?( basedir.to_s )
	$LOAD_PATH.unshift( libdir.to_s ) unless $LOAD_PATH.include?( libdir.to_s )
}

require 'rspec'
require 'spec/lib/helpers'

require 'linguistics'
require 'linguistics/en/infinitives'


describe Linguistics::EN::Infinitives do

	before( :all ) do
		setup_logging( :fatal )
		Linguistics.use( :en, :proxy => true )
		include Linguistics::EN
	end

	after( :all ) do
		reset_logging()
	end


	describe "Infinitive object class" do
		it "compares as equal if its primary word is equal" do
			Linguistics::EN::Infinitives::Infinitive.new( 'basse', 'bass', 's', '2' ).should ==
				'basse'
		end

		it "compares as equal if its secondary word is equal" do
			Linguistics::EN::Infinitives::Infinitive.new( 'basse', 'bass', 's', '2' ).should ==
				'bass'
		end

	end


	it "uses rule 1 when calculating the infinitive of 'aches'" do
		"aches".en.infinitive.should == 'ache'
		"aches".en.infinitive.rule.should == '1'
	end

	it "uses rule 2 when calculating the infinitive of 'vases'" do
		"vases".en.infinitive.should == 'vase'
		"vases".en.infinitive.rule.should == '2'
	end

	it "uses rule 2 when calculating the infinitive of 'basses'" do
		"basses".en.infinitive.should == 'bass'
		"basses".en.infinitive.rule.should == '2'
	end

	it "uses rule 3 when calculating the infinitive of 'axes'" do
		"axes".en.infinitive.should == 'axe'
		"axes".en.infinitive.rule.should == '3'
	end

	it "uses rule 3 when calculating the infinitive of 'fixes'" do
		"fixes".en.infinitive.should == 'fix'
		"fixes".en.infinitive.rule.should == '3'
	end

	it "uses rule 4 when calculating the infinitive of 'hazes'" do
		"hazes".en.infinitive.should == 'haze'
		"hazes".en.infinitive.rule.should == '4'
	end

	it "uses rule 4 when calculating the infinitive of 'buzzes'" do
		"buzzes".en.infinitive.should == 'buzz'
		"buzzes".en.infinitive.rule.should == '4'
	end

	it "uses rule 6a when calculating the infinitive of 'caress'" do
		"caress".en.infinitive.should == 'caress'
		"caress".en.infinitive.rule.should == '6a'
	end

	it "uses rule 6b when calculating the infinitive of 'bans'" do
		"bans".en.infinitive.should == 'ban'
		"bans".en.infinitive.rule.should == '6b'
	end

	it "uses rule 7 when calculating the infinitive of 'Jones's'" do
		"Jones's".en.infinitive.should == 'Jones'
		"Jones's".en.infinitive.rule.should == '7'
	end

	it "uses rule 8 when calculating the infinitive of 'creater'" do
		"creater".en.infinitive.should == 'creater'
		"creater".en.infinitive.rule.should == '8'
	end

	it "uses rule 9 when calculating the infinitive of 'reacter'" do
		"reacter".en.infinitive.should == 'reacter'
		"reacter".en.infinitive.rule.should == '9'
	end

	it "uses rule 10 when calculating the infinitive of 'copier'" do
		"copier".en.infinitive.should == 'copy'
		"copier".en.infinitive.rule.should == '10'
	end

	it "uses rule 11 when calculating the infinitive of 'baker'" do
		"baker".en.infinitive.should == 'bake'
		"baker".en.infinitive.rule.should == '11'
	end

	it "uses rule 11 when calculating the infinitive of 'smaller'" do
		"smaller".en.infinitive.should == 'small'
		"smaller".en.infinitive.rule.should == '11'
	end

	it "uses rule 12a when calculating the infinitive of 'curried'" do
		"curried".en.infinitive.should == 'curry'
		"curried".en.infinitive.rule.should == '12a'
	end

	it "uses rule 12b when calculating the infinitive of 'bored'" do
		"bored".en.infinitive.should == 'bore'
		"bored".en.infinitive.rule.should == '12b'
	end

	it "uses rule 12b when calculating the infinitive of 'seated'" do
		"seated".en.infinitive.should == 'seat'
		"seated".en.infinitive.rule.should == '12b'
	end

	it "uses rule 12b when calculating the infinitive of 'tipped'" do
		"tipped".en.infinitive.should == 'tip'
		"tipped".en.infinitive.rule.should == '12b'
	end

	it "uses rule 12b when calculating the infinitive of 'kitted'" do
		"kitted".en.infinitive.should == 'kit'
		"kitted".en.infinitive.rule.should == '12b'
	end

	it "uses rule 12b when calculating the infinitive of 'capped'" do
		"capped".en.infinitive.should == 'cap'
		"capped".en.infinitive.rule.should == '12b'
	end

	it "uses rule 12b when calculating the infinitive of 'chopped'" do
		"chopped".en.infinitive.should == 'chop'
		"chopped".en.infinitive.rule.should == '12b'
	end

	it "uses rule 13a when calculating the infinitive of 'flies'" do
		"flies".en.infinitive.should == 'fly'
		"flies".en.infinitive.rule.should == '13a'
	end

	it "uses rule 13b when calculating the infinitive of 'palates'" do
		"palates".en.infinitive.should == 'palate'
		"palates".en.infinitive.rule.should == '13b'
	end

	it "uses rule 14a when calculating the infinitive of 'liveliest'" do
		"liveliest".en.infinitive.should == 'lively'
		"liveliest".en.infinitive.rule.should == '14a'
	end

	it "uses rule 14b when calculating the infinitive of 'wisest'" do
		"wisest".en.infinitive.should == 'wise'
		"wisest".en.infinitive.rule.should == '14b'
	end

	it "uses rule 14b when calculating the infinitive of 'strongest'" do
		"strongest".en.infinitive.should == 'strong'
		"strongest".en.infinitive.rule.should == '14b'
	end

	it "uses rule 15 when calculating the infinitive of 'living'" do
		"living".en.infinitive.should == 'live'
		"living".en.infinitive.rule.should == '15'
	end

	it "uses rule 15 when calculating the infinitive of 'laughing'" do
		"laughing".en.infinitive.should == 'laugh'
		"laughing".en.infinitive.rule.should == '15'
	end

	it "uses rule 15 when calculating the infinitive of 'swaying'" do
		"swaying".en.infinitive.should == 'sway'
		"swaying".en.infinitive.rule.should == '15'
	end

	it "uses rule 15 when calculating the infinitive of 'catching'" do
		"catching".en.infinitive.should == 'catch'
		"catching".en.infinitive.rule.should == '15'
	end

	it "uses rule 15 when calculating the infinitive of 'smiling'" do
		"smiling".en.infinitive.should == 'smile'
		"smiling".en.infinitive.rule.should == '15'
	end

	it "uses rule 15 when calculating the infinitive of 'swimming'" do
		"swimming".en.infinitive.should == 'swim'
		"swimming".en.infinitive.rule.should == '15'
	end

	it "uses rule 15 when calculating the infinitive of 'running'" do
		"running".en.infinitive.should == 'run'
		"running".en.infinitive.rule.should == '15'
	end

	it "uses rule 15 when calculating the infinitive of 'floating'" do
		"floating".en.infinitive.should == 'float'
		"floating".en.infinitive.rule.should == '15'
	end

	it "uses rule 15 when calculating the infinitive of 'keyboarding'" do
		"keyboarding".en.infinitive.should == 'keyboard'
		"keyboarding".en.infinitive.rule.should == '15'
	end

	it "uses rule 15 when calculating the infinitive of 'wrestling'" do
		"wrestling".en.infinitive.should == 'wrestle'
		"wrestling".en.infinitive.rule.should == '15'
	end

	it "uses rule 15 when calculating the infinitive of 'traveling'" do
		"traveling".en.infinitive.should == 'travel'
		"traveling".en.infinitive.rule.should == '15'
	end

	it "uses rule 15 when calculating the infinitive of 'traipsing'" do
		"traipsing".en.infinitive.should == 'traipse'
		"traipsing".en.infinitive.rule.should == '15'
	end

	it "uses rule 16 when calculating the infinitive of 'stylist'" do
		"stylist".en.infinitive.should == 'style'
		"stylist".en.infinitive.rule.should == '16'
	end

	it "uses rule 16 when calculating the infinitive of 'dentist'" do
		"dentist".en.infinitive.should == 'dent'
		"dentist".en.infinitive.rule.should == '16'
	end

	it "uses rule 17 when calculating the infinitive of 'cubism'" do
		"cubism".en.infinitive.should == 'cube'
		"cubism".en.infinitive.rule.should == '17'
	end

	it "uses rule 17 when calculating the infinitive of 'socialism'" do
		"socialism".en.infinitive.should == 'social'
		"socialism".en.infinitive.rule.should == '17'
	end

	it "uses rule 18 when calculating the infinitive of 'scarcity'" do
		"scarcity".en.infinitive.should == 'scarce'
		"scarcity".en.infinitive.rule.should == '18'
	end

	it "uses rule 18 when calculating the infinitive of 'rapidity'" do
		"rapidity".en.infinitive.should == 'rapid'
		"rapidity".en.infinitive.rule.should == '18'
	end

	it "uses rule 19 when calculating the infinitive of 'immunize'" do
		"immunize".en.infinitive.should == 'immune'
		"immunize".en.infinitive.rule.should == '19'
	end

	it "uses rule 19 when calculating the infinitive of 'lionize'" do
		"lionize".en.infinitive.should == 'lion'
		"lionize".en.infinitive.rule.should == '19'
	end

	it "uses rule 20c when calculating the infinitive of 'livable'" do
		"livable".en.infinitive.should == 'live'
		"livable".en.infinitive.rule.should == '20c'
	end

	it "uses rule 20c when calculating the infinitive of 'portable'" do
		"portable".en.infinitive.should == 'port'
		"portable".en.infinitive.rule.should == '20c'
	end

	it "uses rule 22 when calculating the infinitive of 'nobility'" do
		"nobility".en.infinitive.should == 'noble'
		"nobility".en.infinitive.rule.should == '22'
	end

	it "uses rule 23 when calculating the infinitive of 'identifiable'" do
		"identifiable".en.infinitive.should == 'identify'
		"identifiable".en.infinitive.rule.should == '23'
	end

	it "uses rule 24 when calculating the infinitive of 'psychologist'" do
		"psychologist".en.infinitive.should == 'psychology'
		"psychologist".en.infinitive.rule.should == '24'
	end

	it "uses rule 25 when calculating the infinitive of 'photographic'" do
		"photographic".en.infinitive.should == 'photography'
		"photographic".en.infinitive.rule.should == '25'
	end

	it "uses rule 26 when calculating the infinitive of 'stylistic'" do
		"stylistic".en.infinitive.should == 'stylist'
		"stylistic".en.infinitive.rule.should == '26'
	end

	it "uses rule 27 when calculating the infinitive of 'martensitic'" do
		"martensitic".en.infinitive.should == 'martensite'
		"martensitic".en.infinitive.rule.should == '27'
	end

	it "uses rule 27 when calculating the infinitive of 'politic'" do
		"politic".en.infinitive.should == 'polite'
		"politic".en.infinitive.rule.should == '27'
	end

	it "uses rule 28 when calculating the infinitive of 'ladylike'" do
		"ladylike".en.infinitive.should == 'lady'
		"ladylike".en.infinitive.rule.should == '28'
	end

	it "uses rule 29 when calculating the infinitive of 'biologic'" do
		"biologic".en.infinitive.should == 'biology'
		"biologic".en.infinitive.rule.should == '29'
	end

	it "uses rule 30 when calculating the infinitive of 'battlement'" do
		"battlement".en.infinitive.should == 'battle'
		"battlement".en.infinitive.rule.should == '30'
	end

	it "uses rule 31 when calculating the infinitive of 'supplemental'" do
		"supplemental".en.infinitive.should == 'supplement'
		"supplemental".en.infinitive.rule.should == '31'
	end

	it "uses rule 32 when calculating the infinitive of 'thermometry'" do
		"thermometry".en.infinitive.should == 'thermometer'
		"thermometry".en.infinitive.rule.should == '32'
	end

	it "uses rule 33 when calculating the infinitive of 'inadvertence'" do
		"inadvertence".en.infinitive.should == 'inadvertent'
		"inadvertence".en.infinitive.rule.should == '33'
	end

	it "uses rule 34 when calculating the infinitive of 'potency'" do
		"potency".en.infinitive.should == 'potent'
		"potency".en.infinitive.rule.should == '34'
	end

	it "uses rule 35 when calculating the infinitive of 'discipleship'" do
		"discipleship".en.infinitive.should == 'disciple'
		"discipleship".en.infinitive.rule.should == '35'
	end

	it "uses rule 36 when calculating the infinitive of 'mystical'" do
		"mystical".en.infinitive.should == 'mystic'
		"mystical".en.infinitive.rule.should == '36'
	end

	it "uses rule 37 when calculating the infinitive of 'regional'" do
		"regional".en.infinitive.should == 'region'
		"regional".en.infinitive.rule.should == '37'
	end

	it "uses rule 37 when calculating the infinitive of 'national'" do
		"national".en.infinitive.should == 'nation'
		"national".en.infinitive.rule.should == '37'
	end

	it "uses rule 38 when calculating the infinitive of 'horribly'" do
		"horribly".en.infinitive.should == 'horrible'
		"horribly".en.infinitive.rule.should == '38'
	end

	it "uses rule 39 when calculating the infinitive of 'scantily'" do
		"scantily".en.infinitive.should == 'scanty'
		"scantily".en.infinitive.rule.should == '39'
	end

	it "uses rule 40 when calculating the infinitive of 'partly'" do
		"partly".en.infinitive.should == 'part'
		"partly".en.infinitive.rule.should == '40'
	end

	it "uses rule 41a when calculating the infinitive of 'dutiful'" do
		"dutiful".en.infinitive.should == 'duty'
		"dutiful".en.infinitive.rule.should == '41a'
	end

	it "uses rule 41b when calculating the infinitive of 'harmful'" do
		"harmful".en.infinitive.should == 'harm'
		"harmful".en.infinitive.rule.should == '41b'
	end

	it "uses rule 42a when calculating the infinitive of 'likelihood'" do
		"likelihood".en.infinitive.should == 'likely'
		"likelihood".en.infinitive.rule.should == '42a'
	end

	it "uses rule 42b when calculating the infinitive of 'neighborhood'" do
		"neighborhood".en.infinitive.should == 'neighbor'
		"neighborhood".en.infinitive.rule.should == '42b'
	end

	it "uses rule 42b when calculating the infinitive of 'neighbourhood'" do
		"neighbourhood".en.infinitive.should == 'neighbour'
		"neighbourhood".en.infinitive.rule.should == '42b'
	end

	it "uses rule 43a when calculating the infinitive of 'penniless'" do
		"penniless".en.infinitive.should == 'penny'
		"penniless".en.infinitive.rule.should == '43a'
	end

	it "uses rule 43b when calculating the infinitive of 'listless'" do
		"listless".en.infinitive.should == 'list'
		"listless".en.infinitive.rule.should == '43b'
	end

	it "uses rule 44a when calculating the infinitive of 'heartiness'" do
		"heartiness".en.infinitive.should == 'hearty'
		"heartiness".en.infinitive.rule.should == '44a'
	end

	it "uses rule 44b when calculating the infinitive of 'coolness'" do
		"coolness".en.infinitive.should == 'cool'
		"coolness".en.infinitive.rule.should == '44b'
	end

	it "uses rule 45 when calculating the infinitive of 'specification'" do
		"specification".en.infinitive.should == 'specify'
		"specification".en.infinitive.rule.should == '45'
	end

	it "uses rule 46 when calculating the infinitive of 'rationalization'" do
		"rationalization".en.infinitive.should == 'rationalize'
		"rationalization".en.infinitive.rule.should == '46'
	end

	it "uses rule 47 when calculating the infinitive of 'detection'" do
		"detection".en.infinitive.should == 'detect'
		"detection".en.infinitive.rule.should == '47'
	end

	it "uses rule 48 when calculating the infinitive of 'exertion'" do
		"exertion".en.infinitive.should == 'exert'
		"exertion".en.infinitive.rule.should == '48'
	end

	it "uses rule 49 when calculating the infinitive of 'creation'" do
		"creation".en.infinitive.should == 'create'
		"creation".en.infinitive.rule.should == '49'
	end

	it "uses rule 50 when calculating the infinitive of 'creator'" do
		"creator".en.infinitive.should == 'create'
		"creator".en.infinitive.rule.should == '50'
	end

	it "uses rule 51 when calculating the infinitive of 'detector'" do
		"detector".en.infinitive.should == 'detect'
		"detector".en.infinitive.rule.should == '51'
	end

	it "uses rule 52 when calculating the infinitive of 'creative'" do
		"creative".en.infinitive.should == 'creation'
		"creative".en.infinitive.rule.should == '52'
	end

	it "uses rule 52 when calculating the infinitive of 'decisive'" do
		"decisive".en.infinitive.should == 'decision'
		"decisive".en.infinitive.rule.should == '52'
	end

	it "uses rule 53 when calculating the infinitive of 'Australian'" do
		"Australian".en.infinitive.should == 'Australia'
		"Australian".en.infinitive.rule.should == '53'
	end

	it "uses rule 54 when calculating the infinitive of 'Jeffersonian'" do
		"Jeffersonian".en.infinitive.should == 'Jefferson'
		"Jeffersonian".en.infinitive.rule.should == '54'
	end

	it "uses irregular rule when calculating the infinitive of 'rove'" do
		"rove".en.infinitive.should == 'reeve'
		"rove".en.infinitive.rule.should == 'irregular'
	end

	it "uses irregular rule when calculating the infinitive of 'dove'" do
		"dove".en.infinitive.should == 'dive'
		"dove".en.infinitive.rule.should == 'irregular'
	end

	it "uses irregular rule when calculating the infinitive of 'snuck'" do
		"snuck".en.infinitive.should == 'sneak'
		"snuck".en.infinitive.rule.should == 'irregular'
	end

	it "uses irregular rule when calculating the infinitive of 'wot'" do
		"wot".en.infinitive.should == 'wit'
		"wot".en.infinitive.rule.should == 'irregular'
	end

end

