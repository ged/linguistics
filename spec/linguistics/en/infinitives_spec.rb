#!/usr/bin/env spec -cfs

require_relative '../../helpers'

require 'rspec'

require 'linguistics'
require 'linguistics/en/infinitives'


describe Linguistics::EN::Infinitives do

	before( :all ) do
		Linguistics.use( :en, :proxy => true )
		include Linguistics::EN
	end


	describe "Infinitive object class" do
		it "compares as equal if its primary word is equal" do
			expect( Linguistics::EN::Infinitives::Infinitive.new('basse', 'bass', 's', '2') ).
				to eq( 'basse' )
		end

		it "compares as equal if its secondary word is equal" do
			expect( Linguistics::EN::Infinitives::Infinitive.new('basse', 'bass', 's', '2') ).
				to eq( 'bass' )
		end

	end


	it "uses rule 1 when calculating the infinitive of 'aches'" do
		expect( "aches".en.infinitive ).to eq( 'ache' )
		expect( "aches".en.infinitive.rule ).to eq( '1' )
	end

	it "uses rule 2 when calculating the infinitive of 'vases'" do
		expect( "vases".en.infinitive ).to eq( 'vase' )
		expect( "vases".en.infinitive.rule ).to eq( '2' )
	end

	it "uses rule 2 when calculating the infinitive of 'basses'" do
		expect( "basses".en.infinitive ).to eq( 'bass' )
		expect( "basses".en.infinitive.rule ).to eq( '2' )
	end

	it "uses rule 3 when calculating the infinitive of 'axes'" do
		expect( "axes".en.infinitive ).to eq( 'axe' )
		expect( "axes".en.infinitive.rule ).to eq( '3' )
	end

	it "uses rule 3 when calculating the infinitive of 'fixes'" do
		expect( "fixes".en.infinitive ).to eq( 'fix' )
		expect( "fixes".en.infinitive.rule ).to eq( '3' )
	end

	it "uses rule 4 when calculating the infinitive of 'hazes'" do
		expect( "hazes".en.infinitive ).to eq( 'haze' )
		expect( "hazes".en.infinitive.rule ).to eq( '4' )
	end

	it "uses rule 4 when calculating the infinitive of 'buzzes'" do
		expect( "buzzes".en.infinitive ).to eq( 'buzz' )
		expect( "buzzes".en.infinitive.rule ).to eq( '4' )
	end

	it "uses rule 6a when calculating the infinitive of 'caress'" do
		expect( "caress".en.infinitive ).to eq( 'caress' )
		expect( "caress".en.infinitive.rule ).to eq( '6a' )
	end

	it "uses rule 6b when calculating the infinitive of 'bans'" do
		expect( "bans".en.infinitive ).to eq( 'ban' )
		expect( "bans".en.infinitive.rule ).to eq( '6b' )
	end

	it "uses rule 7 when calculating the infinitive of 'Jones's'" do
		expect( "Jones's".en.infinitive ).to eq( 'Jones' )
		expect( "Jones's".en.infinitive.rule ).to eq( '7' )
	end

	it "uses rule 8 when calculating the infinitive of 'creater'" do
		expect( "creater".en.infinitive ).to eq( 'creater' )
		expect( "creater".en.infinitive.rule ).to eq( '8' )
	end

	it "uses rule 9 when calculating the infinitive of 'reacter'" do
		expect( "reacter".en.infinitive ).to eq( 'reacter' )
		expect( "reacter".en.infinitive.rule ).to eq( '9' )
	end

	it "uses rule 10 when calculating the infinitive of 'copier'" do
		expect( "copier".en.infinitive ).to eq( 'copy' )
		expect( "copier".en.infinitive.rule ).to eq( '10' )
	end

	it "uses rule 11 when calculating the infinitive of 'baker'" do
		expect( "baker".en.infinitive ).to eq( 'bake' )
		expect( "baker".en.infinitive.rule ).to eq( '11' )
	end

	it "uses rule 11 when calculating the infinitive of 'smaller'" do
		expect( "smaller".en.infinitive ).to eq( 'small' )
		expect( "smaller".en.infinitive.rule ).to eq( '11' )
	end

	it "uses rule 12a when calculating the infinitive of 'curried'" do
		expect( "curried".en.infinitive ).to eq( 'curry' )
		expect( "curried".en.infinitive.rule ).to eq( '12a' )
	end

	it "uses rule 12b when calculating the infinitive of 'bored'" do
		expect( "bored".en.infinitive ).to eq( 'bore' )
		expect( "bored".en.infinitive.rule ).to eq( '12b' )
	end

	it "uses rule 12b when calculating the infinitive of 'seated'" do
		expect( "seated".en.infinitive ).to eq( 'seat' )
		expect( "seated".en.infinitive.rule ).to eq( '12b' )
	end

	it "uses rule 12b when calculating the infinitive of 'tipped'" do
		expect( "tipped".en.infinitive ).to eq( 'tip' )
		expect( "tipped".en.infinitive.rule ).to eq( '12b' )
	end

	it "uses rule 12b when calculating the infinitive of 'kitted'" do
		expect( "kitted".en.infinitive ).to eq( 'kit' )
		expect( "kitted".en.infinitive.rule ).to eq( '12b' )
	end

	it "uses rule 12b when calculating the infinitive of 'capped'" do
		expect( "capped".en.infinitive ).to eq( 'cap' )
		expect( "capped".en.infinitive.rule ).to eq( '12b' )
	end

	it "uses rule 12b when calculating the infinitive of 'chopped'" do
		expect( "chopped".en.infinitive ).to eq( 'chop' )
		expect( "chopped".en.infinitive.rule ).to eq( '12b' )
	end

	it "uses rule 13a when calculating the infinitive of 'flies'" do
		expect( "flies".en.infinitive ).to eq( 'fly' )
		expect( "flies".en.infinitive.rule ).to eq( '13a' )
	end

	it "uses rule 13b when calculating the infinitive of 'palates'" do
		expect( "palates".en.infinitive ).to eq( 'palate' )
		expect( "palates".en.infinitive.rule ).to eq( '13b' )
	end

	it "uses rule 14a when calculating the infinitive of 'liveliest'" do
		expect( "liveliest".en.infinitive ).to eq( 'lively' )
		expect( "liveliest".en.infinitive.rule ).to eq( '14a' )
	end

	it "uses rule 14b when calculating the infinitive of 'wisest'" do
		expect( "wisest".en.infinitive ).to eq( 'wise' )
		expect( "wisest".en.infinitive.rule ).to eq( '14b' )
	end

	it "uses rule 14b when calculating the infinitive of 'strongest'" do
		expect( "strongest".en.infinitive ).to eq( 'strong' )
		expect( "strongest".en.infinitive.rule ).to eq( '14b' )
	end

	it "uses rule 15 when calculating the infinitive of 'living'" do
		expect( "living".en.infinitive ).to eq( 'live' )
		expect( "living".en.infinitive.rule ).to eq( '15' )
	end

	it "uses rule 15 when calculating the infinitive of 'laughing'" do
		expect( "laughing".en.infinitive ).to eq( 'laugh' )
		expect( "laughing".en.infinitive.rule ).to eq( '15' )
	end

	it "uses rule 15 when calculating the infinitive of 'swaying'" do
		expect( "swaying".en.infinitive ).to eq( 'sway' )
		expect( "swaying".en.infinitive.rule ).to eq( '15' )
	end

	it "uses rule 15 when calculating the infinitive of 'catching'" do
		expect( "catching".en.infinitive ).to eq( 'catch' )
		expect( "catching".en.infinitive.rule ).to eq( '15' )
	end

	it "uses rule 15 when calculating the infinitive of 'smiling'" do
		expect( "smiling".en.infinitive ).to eq( 'smile' )
		expect( "smiling".en.infinitive.rule ).to eq( '15' )
	end

	it "uses rule 15 when calculating the infinitive of 'swimming'" do
		expect( "swimming".en.infinitive ).to eq( 'swim' )
		expect( "swimming".en.infinitive.rule ).to eq( '15' )
	end

	it "uses rule 15 when calculating the infinitive of 'running'" do
		expect( "running".en.infinitive ).to eq( 'run' )
		expect( "running".en.infinitive.rule ).to eq( '15' )
	end

	it "uses rule 15 when calculating the infinitive of 'floating'" do
		expect( "floating".en.infinitive ).to eq( 'float' )
		expect( "floating".en.infinitive.rule ).to eq( '15' )
	end

	it "uses rule 15 when calculating the infinitive of 'keyboarding'" do
		expect( "keyboarding".en.infinitive ).to eq( 'keyboard' )
		expect( "keyboarding".en.infinitive.rule ).to eq( '15' )
	end

	it "uses rule 15 when calculating the infinitive of 'wrestling'" do
		expect( "wrestling".en.infinitive ).to eq( 'wrestle' )
		expect( "wrestling".en.infinitive.rule ).to eq( '15' )
	end

	it "uses rule 15 when calculating the infinitive of 'traveling'" do
		expect( "traveling".en.infinitive ).to eq( 'travel' )
		expect( "traveling".en.infinitive.rule ).to eq( '15' )
	end

	it "uses rule 15 when calculating the infinitive of 'traipsing'" do
		expect( "traipsing".en.infinitive ).to eq( 'traipse' )
		expect( "traipsing".en.infinitive.rule ).to eq( '15' )
	end

	it "uses rule 16 when calculating the infinitive of 'stylist'" do
		expect( "stylist".en.infinitive ).to eq( 'style' )
		expect( "stylist".en.infinitive.rule ).to eq( '16' )
	end

	it "uses rule 16 when calculating the infinitive of 'dentist'" do
		expect( "dentist".en.infinitive ).to eq( 'dent' )
		expect( "dentist".en.infinitive.rule ).to eq( '16' )
	end

	it "uses rule 17 when calculating the infinitive of 'cubism'" do
		expect( "cubism".en.infinitive ).to eq( 'cube' )
		expect( "cubism".en.infinitive.rule ).to eq( '17' )
	end

	it "uses rule 17 when calculating the infinitive of 'socialism'" do
		expect( "socialism".en.infinitive ).to eq( 'social' )
		expect( "socialism".en.infinitive.rule ).to eq( '17' )
	end

	it "uses rule 18 when calculating the infinitive of 'scarcity'" do
		expect( "scarcity".en.infinitive ).to eq( 'scarce' )
		expect( "scarcity".en.infinitive.rule ).to eq( '18' )
	end

	it "uses rule 18 when calculating the infinitive of 'rapidity'" do
		expect( "rapidity".en.infinitive ).to eq( 'rapid' )
		expect( "rapidity".en.infinitive.rule ).to eq( '18' )
	end

	it "uses rule 19 when calculating the infinitive of 'immunize'" do
		expect( "immunize".en.infinitive ).to eq( 'immune' )
		expect( "immunize".en.infinitive.rule ).to eq( '19' )
	end

	it "uses rule 19 when calculating the infinitive of 'lionize'" do
		expect( "lionize".en.infinitive ).to eq( 'lion' )
		expect( "lionize".en.infinitive.rule ).to eq( '19' )
	end

	it "uses rule 20c when calculating the infinitive of 'livable'" do
		expect( "livable".en.infinitive ).to eq( 'live' )
		expect( "livable".en.infinitive.rule ).to eq( '20c' )
	end

	it "uses rule 20c when calculating the infinitive of 'portable'" do
		expect( "portable".en.infinitive ).to eq( 'port' )
		expect( "portable".en.infinitive.rule ).to eq( '20c' )
	end

	it "uses rule 22 when calculating the infinitive of 'nobility'" do
		expect( "nobility".en.infinitive ).to eq( 'noble' )
		expect( "nobility".en.infinitive.rule ).to eq( '22' )
	end

	it "uses rule 23 when calculating the infinitive of 'identifiable'" do
		expect( "identifiable".en.infinitive ).to eq( 'identify' )
		expect( "identifiable".en.infinitive.rule ).to eq( '23' )
	end

	it "uses rule 24 when calculating the infinitive of 'psychologist'" do
		expect( "psychologist".en.infinitive ).to eq( 'psychology' )
		expect( "psychologist".en.infinitive.rule ).to eq( '24' )
	end

	it "uses rule 25 when calculating the infinitive of 'photographic'" do
		expect( "photographic".en.infinitive ).to eq( 'photography' )
		expect( "photographic".en.infinitive.rule ).to eq( '25' )
	end

	it "uses rule 26 when calculating the infinitive of 'stylistic'" do
		expect( "stylistic".en.infinitive ).to eq( 'stylist' )
		expect( "stylistic".en.infinitive.rule ).to eq( '26' )
	end

	it "uses rule 27 when calculating the infinitive of 'martensitic'" do
		expect( "martensitic".en.infinitive ).to eq( 'martensite' )
		expect( "martensitic".en.infinitive.rule ).to eq( '27' )
	end

	it "uses rule 27 when calculating the infinitive of 'politic'" do
		expect( "politic".en.infinitive ).to eq( 'polite' )
		expect( "politic".en.infinitive.rule ).to eq( '27' )
	end

	it "uses rule 28 when calculating the infinitive of 'ladylike'" do
		expect( "ladylike".en.infinitive ).to eq( 'lady' )
		expect( "ladylike".en.infinitive.rule ).to eq( '28' )
	end

	it "uses rule 29 when calculating the infinitive of 'biologic'" do
		expect( "biologic".en.infinitive ).to eq( 'biology' )
		expect( "biologic".en.infinitive.rule ).to eq( '29' )
	end

	it "uses rule 30 when calculating the infinitive of 'battlement'" do
		expect( "battlement".en.infinitive ).to eq( 'battle' )
		expect( "battlement".en.infinitive.rule ).to eq( '30' )
	end

	it "uses rule 31 when calculating the infinitive of 'supplemental'" do
		expect( "supplemental".en.infinitive ).to eq( 'supplement' )
		expect( "supplemental".en.infinitive.rule ).to eq( '31' )
	end

	it "uses rule 32 when calculating the infinitive of 'thermometry'" do
		expect( "thermometry".en.infinitive ).to eq( 'thermometer' )
		expect( "thermometry".en.infinitive.rule ).to eq( '32' )
	end

	it "uses rule 33 when calculating the infinitive of 'inadvertence'" do
		expect( "inadvertence".en.infinitive ).to eq( 'inadvertent' )
		expect( "inadvertence".en.infinitive.rule ).to eq( '33' )
	end

	it "uses rule 34 when calculating the infinitive of 'potency'" do
		expect( "potency".en.infinitive ).to eq( 'potent' )
		expect( "potency".en.infinitive.rule ).to eq( '34' )
	end

	it "uses rule 35 when calculating the infinitive of 'discipleship'" do
		expect( "discipleship".en.infinitive ).to eq( 'disciple' )
		expect( "discipleship".en.infinitive.rule ).to eq( '35' )
	end

	it "uses rule 36 when calculating the infinitive of 'mystical'" do
		expect( "mystical".en.infinitive ).to eq( 'mystic' )
		expect( "mystical".en.infinitive.rule ).to eq( '36' )
	end

	it "uses rule 37 when calculating the infinitive of 'regional'" do
		expect( "regional".en.infinitive ).to eq( 'region' )
		expect( "regional".en.infinitive.rule ).to eq( '37' )
	end

	it "uses rule 37 when calculating the infinitive of 'national'" do
		expect( "national".en.infinitive ).to eq( 'nation' )
		expect( "national".en.infinitive.rule ).to eq( '37' )
	end

	it "uses rule 38 when calculating the infinitive of 'horribly'" do
		expect( "horribly".en.infinitive ).to eq( 'horrible' )
		expect( "horribly".en.infinitive.rule ).to eq( '38' )
	end

	it "uses rule 39 when calculating the infinitive of 'scantily'" do
		expect( "scantily".en.infinitive ).to eq( 'scanty' )
		expect( "scantily".en.infinitive.rule ).to eq( '39' )
	end

	it "uses rule 40 when calculating the infinitive of 'partly'" do
		expect( "partly".en.infinitive ).to eq( 'part' )
		expect( "partly".en.infinitive.rule ).to eq( '40' )
	end

	it "uses rule 41a when calculating the infinitive of 'dutiful'" do
		expect( "dutiful".en.infinitive ).to eq( 'duty' )
		expect( "dutiful".en.infinitive.rule ).to eq( '41a' )
	end

	it "uses rule 41b when calculating the infinitive of 'harmful'" do
		expect( "harmful".en.infinitive ).to eq( 'harm' )
		expect( "harmful".en.infinitive.rule ).to eq( '41b' )
	end

	it "uses rule 42a when calculating the infinitive of 'likelihood'" do
		expect( "likelihood".en.infinitive ).to eq( 'likely' )
		expect( "likelihood".en.infinitive.rule ).to eq( '42a' )
	end

	it "uses rule 42b when calculating the infinitive of 'neighborhood'" do
		expect( "neighborhood".en.infinitive ).to eq( 'neighbor' )
		expect( "neighborhood".en.infinitive.rule ).to eq( '42b' )
	end

	it "uses rule 42b when calculating the infinitive of 'neighbourhood'" do
		expect( "neighbourhood".en.infinitive ).to eq( 'neighbour' )
		expect( "neighbourhood".en.infinitive.rule ).to eq( '42b' )
	end

	it "uses rule 43a when calculating the infinitive of 'penniless'" do
		expect( "penniless".en.infinitive ).to eq( 'penny' )
		expect( "penniless".en.infinitive.rule ).to eq( '43a' )
	end

	it "uses rule 43b when calculating the infinitive of 'listless'" do
		expect( "listless".en.infinitive ).to eq( 'list' )
		expect( "listless".en.infinitive.rule ).to eq( '43b' )
	end

	it "uses rule 44a when calculating the infinitive of 'heartiness'" do
		expect( "heartiness".en.infinitive ).to eq( 'hearty' )
		expect( "heartiness".en.infinitive.rule ).to eq( '44a' )
	end

	it "uses rule 44b when calculating the infinitive of 'coolness'" do
		expect( "coolness".en.infinitive ).to eq( 'cool' )
		expect( "coolness".en.infinitive.rule ).to eq( '44b' )
	end

	it "uses rule 45 when calculating the infinitive of 'specification'" do
		expect( "specification".en.infinitive ).to eq( 'specify' )
		expect( "specification".en.infinitive.rule ).to eq( '45' )
	end

	it "uses rule 46 when calculating the infinitive of 'rationalization'" do
		expect( "rationalization".en.infinitive ).to eq( 'rationalize' )
		expect( "rationalization".en.infinitive.rule ).to eq( '46' )
	end

	it "uses rule 47 when calculating the infinitive of 'detection'" do
		expect( "detection".en.infinitive ).to eq( 'detect' )
		expect( "detection".en.infinitive.rule ).to eq( '47' )
	end

	it "uses rule 48 when calculating the infinitive of 'exertion'" do
		expect( "exertion".en.infinitive ).to eq( 'exert' )
		expect( "exertion".en.infinitive.rule ).to eq( '48' )
	end

	it "uses rule 49 when calculating the infinitive of 'creation'" do
		expect( "creation".en.infinitive ).to eq( 'create' )
		expect( "creation".en.infinitive.rule ).to eq( '49' )
	end

	it "uses rule 50 when calculating the infinitive of 'creator'" do
		expect( "creator".en.infinitive ).to eq( 'create' )
		expect( "creator".en.infinitive.rule ).to eq( '50' )
	end

	it "uses rule 51 when calculating the infinitive of 'detector'" do
		expect( "detector".en.infinitive ).to eq( 'detect' )
		expect( "detector".en.infinitive.rule ).to eq( '51' )
	end

	it "uses rule 52 when calculating the infinitive of 'creative'" do
		expect( "creative".en.infinitive ).to eq( 'creation' )
		expect( "creative".en.infinitive.rule ).to eq( '52' )
	end

	it "uses rule 52 when calculating the infinitive of 'decisive'" do
		expect( "decisive".en.infinitive ).to eq( 'decision' )
		expect( "decisive".en.infinitive.rule ).to eq( '52' )
	end

	it "uses rule 53 when calculating the infinitive of 'Australian'" do
		expect( "Australian".en.infinitive ).to eq( 'Australia' )
		expect( "Australian".en.infinitive.rule ).to eq( '53' )
	end

	it "uses rule 54 when calculating the infinitive of 'Jeffersonian'" do
		expect( "Jeffersonian".en.infinitive ).to eq( 'Jefferson' )
		expect( "Jeffersonian".en.infinitive.rule ).to eq( '54' )
	end

	it "uses irregular rule when calculating the infinitive of 'rove'" do
		expect( "rove".en.infinitive ).to eq( 'reeve' )
		expect( "rove".en.infinitive.rule ).to eq( 'irregular' )
	end

	it "uses irregular rule when calculating the infinitive of 'dove'" do
		expect( "dove".en.infinitive ).to eq( 'dive' )
		expect( "dove".en.infinitive.rule ).to eq( 'irregular' )
	end

	it "uses irregular rule when calculating the infinitive of 'snuck'" do
		expect( "snuck".en.infinitive ).to eq( 'sneak' )
		expect( "snuck".en.infinitive.rule ).to eq( 'irregular' )
	end

	it "uses irregular rule when calculating the infinitive of 'wot'" do
		expect( "wot".en.infinitive ).to eq( 'wit' )
		expect( "wot".en.infinitive.rule ).to eq( 'irregular' )
	end

end

