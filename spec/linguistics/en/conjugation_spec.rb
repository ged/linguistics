#!/usr/bin/env spec -cfs

require_relative '../../helpers'

require 'rspec'

require 'linguistics'
require 'linguistics/en/conjugation'


describe Linguistics::EN::Conjugation do

	before( :all ) do
		Linguistics.use( :en )
	end


	it "adds EN::Conjugation to the list of English language modules" do
		expect( Linguistics::EN ).to have_extension( :conjugation )
	end

	context "documentation examples" do

		it 'conjugates "run".en.past_tense as "ran"' do
			expect( "run".en.past_tense ).to eq( "ran" )
		end

		it 'conjugates "run".en.past_participle as "run"' do
			expect( "run".en.past_participle ).to eq( "run" )
		end

		it 'conjugates "run".en.present_tense as "run"' do
			expect( "run".en.present_tense ).to eq( "run" )
		end

		it 'conjugates "run".en.present_participle as "running"' do
			expect( "run".en.present_participle ).to eq( "running" )
		end

		it '"be".en.conjugate( :present, :third_person_singular ) should return "is"' do
			expect( "be".en.conjugate( :present, :third_person_singular ) ).to eq( "is" )
		end

		it '"be".en.conjugate( :present, :first_person_singular ) should return "am"' do
			expect( "be".en.conjugate( :present, :first_person_singular ) ).to eq( "am" )
		end

		it '"be".en.conjugate( :past, :first_person_singular ) should return "was"' do
			expect( "be".en.conjugate( :past, :first_person_singular ) ).to eq( "was" )
		end

	end

	it "conjugates 'arise' as 'arose'" do
		expect( "arise".en.past_tense ).to eq( 'arose' )
	end

	it "conjugates 'awake' as 'awoke'" do
		expect( "awake".en.past_tense ).to eq( 'awoke' )
	end

	it "conjugates 'backbite' as 'backbit'" do
		expect( "backbite".en.past_tense ).to eq( 'backbit' )
	end

	it "conjugates 'backslide' as 'backslid'" do
		expect( "backslide".en.past_tense ).to eq( 'backslid' )
	end

	it "conjugates 'be' as 'was' in third person singular" do
		expect( "be".en.past_tense( :third_person_singular ) ).to eq( 'was' )
	end

	it "conjugates 'be' as 'were'" do
		expect( "be".en.past_tense ).to eq( 'were' )
	end

	it "conjugates 'be' in first person singular as 'was'" do
		expect( "be".en.past_tense(:first_person_singular) ).to eq( 'was' )
	end

	it "conjugates 'be' in third person singular as 'was'" do
		expect( "be".en.past_tense(:third_person_singular) ).to eq( 'was' )
	end

	it "conjugates 'bear' as 'bore'" do
		expect( "bear".en.past_tense ).to eq( 'bore' )
	end

	it "conjugates 'beat' as 'beat'" do
		expect( "beat".en.past_tense ).to eq( 'beat' )
	end

	it "conjugates 'become' as 'became'" do
		expect( "become".en.past_tense ).to eq( 'became' )
	end

	it "conjugates 'befall' as 'befell'" do
		expect( "befall".en.past_tense ).to eq( 'befell' )
	end

	it "conjugates 'beget' as 'begat'" do
		expect( "beget".en.past_tense ).to eq( 'begat' )
	end

	it "conjugates 'begin' as 'began'" do
		expect( "begin".en.past_tense ).to eq( 'began' )
	end

	it "conjugates 'bend' as 'bent'" do
		expect( "bend".en.past_tense ).to eq( 'bent' )
	end

	it "conjugates 'beset' as 'beset'" do
		expect( "beset".en.past_tense ).to eq( 'beset' )
	end

	it "conjugates 'bet' as 'bet'" do
		expect( "bet".en.past_tense ).to eq( 'bet' )
	end

	it "conjugates 'betake' as 'betook'" do
		expect( "betake".en.past_tense ).to eq( 'betook' )
	end

	it "conjugates 'bethink' as 'bethought'" do
		expect( "bethink".en.past_tense ).to eq( 'bethought' )
	end

	it "conjugates 'bid' as 'bid'" do
		expect( "bid".en.past_tense ).to eq( 'bid' )
	end

	it "conjugates 'bid' in first person as 'bid'" do
		expect( "bid".en.past_tense( :first_person ) ).to eq( 'bid' )
	end

	it "conjugates 'bid' in third person as 'bid'" do
		expect( "bid".en.past_tense( :third_person ) ).to eq( 'bid' )
	end

	it "conjugates 'bind' as 'bound'" do
		expect( "bind".en.past_tense ).to eq( 'bound' )
	end

	it "conjugates 'bite' as 'bit'" do
		expect( "bite".en.past_tense ).to eq( 'bit' )
	end

	it "conjugates 'bleed' as 'bled'" do
		expect( "bleed".en.past_tense ).to eq( 'bled' )
	end

	it "conjugates 'blow' as 'blew'" do
		expect( "blow".en.past_tense ).to eq( 'blew' )
	end

	it "conjugates 'break' as 'broke'" do
		expect( "break".en.past_tense ).to eq( 'broke' )
	end

	it "conjugates 'breed' as 'bred'" do
		expect( "breed".en.past_tense ).to eq( 'bred' )
	end

	it "conjugates 'bring' as 'brought'" do
		expect( "bring".en.past_tense ).to eq( 'brought' )
	end

	it "conjugates 'broadcast' as 'broadcast'" do
		expect( "broadcast".en.past_tense ).to eq( 'broadcast' )
	end

	it "conjugates 'browbeat' as 'browbeat'" do
		expect( "browbeat".en.past_tense ).to eq( 'browbeat' )
	end

	it "conjugates 'build' as 'built'" do
		expect( "build".en.past_tense ).to eq( 'built' )
	end

	it "conjugates 'build-up' as 'built-up'" do
		expect( "build-up".en.past_tense ).to eq( 'built-up' )
	end

	it "conjugates 'build-up' in first person as 'built-up'" do
		expect( "build-up".en.past_tense( :first_person ) ).to eq( 'built-up' )
	end

	it "conjugates 'build-up' in third person as 'built-up'" do
		expect( "build-up".en.past_tense( :third_person ) ).to eq( 'built-up' )
	end

	it "conjugates 'burst' as 'burst'" do
		expect( "burst".en.past_tense ).to eq( 'burst' )
	end

	it "conjugates 'buy' as 'bought'" do
		expect( "buy".en.past_tense ).to eq( 'bought' )
	end

	it "conjugates 'carry-out' as 'carried-out'" do
		expect( "carry-out".en.past_tense ).to eq( 'carried-out' )
	end

	it "conjugates 'carry-out' in first person as 'carried-out'" do
		expect( "carry-out".en.past_tense( :first_person ) ).to eq( 'carried-out' )
	end

	it "conjugates 'carry-out' in third person as 'carried-out'" do
		expect( "carry-out".en.past_tense( :third_person ) ).to eq( 'carried-out' )
	end

	it "conjugates 'cast' as 'cast'" do
		expect( "cast".en.past_tense ).to eq( 'cast' )
	end

	it "conjugates 'catch' as 'caught'" do
		expect( "catch".en.past_tense ).to eq( 'caught' )
	end

	it "conjugates 'choose' as 'chose'" do
		expect( "choose".en.past_tense ).to eq( 'chose' )
	end

	it "conjugates 'cling' as 'clung'" do
		expect( "cling".en.past_tense ).to eq( 'clung' )
	end

	it "conjugates 'colorbreed' as 'colorbred'" do
		expect( "colorbreed".en.past_tense ).to eq( 'colorbred' )
	end

	it "conjugates 'come' as 'came'" do
		expect( "come".en.past_tense ).to eq( 'came' )
	end

	it "conjugates 'cost' as 'cost'" do
		expect( "cost".en.past_tense ).to eq( 'cost' )
	end

	it "conjugates 'creep' as 'crept'" do
		expect( "creep".en.past_tense ).to eq( 'crept' )
	end

	it "conjugates 'crossbreed' as 'crossbred'" do
		expect( "crossbreed".en.past_tense ).to eq( 'crossbred' )
	end

	it "conjugates 'cut' as 'cut'" do
		expect( "cut".en.past_tense ).to eq( 'cut' )
	end

	it "conjugates 'deal' as 'dealt'" do
		expect( "deal".en.past_tense ).to eq( 'dealt' )
	end

	it "conjugates 'dig' as 'dug'" do
		expect( "dig".en.past_tense ).to eq( 'dug' )
	end

	it "conjugates 'dive' as 'dove'" do
		expect( "dive".en.past_tense ).to eq( 'dove' )
	end

	it "conjugates 'do' as 'did'" do
		expect( "do".en.past_tense ).to eq( 'did' )
	end

	it "conjugates 'draw' as 'drew'" do
		expect( "draw".en.past_tense ).to eq( 'drew' )
	end

	it "conjugates 'drink' as 'drank'" do
		expect( "drink".en.past_tense ).to eq( 'drank' )
	end

	it "conjugates 'drive' as 'drove'" do
		expect( "drive".en.past_tense ).to eq( 'drove' )
	end

	it "conjugates 'eat' as 'ate'" do
		expect( "eat".en.past_tense ).to eq( 'ate' )
	end

	it "conjugates 'enwind' as 'enwound'" do
		expect( "enwind".en.past_tense ).to eq( 'enwound' )
	end

	it "conjugates 'fall' as 'fell'" do
		expect( "fall".en.past_tense ).to eq( 'fell' )
	end

	it "conjugates 'fast-wind' as 'fast-wound'" do
		expect( "fast-wind".en.past_tense ).to eq( 'fast-wound' )
	end

	it "conjugates 'fast-wind' in first person as 'fast-wound'" do
		expect( "fast-wind".en.past_tense( :first_person ) ).to eq( 'fast-wound' )
	end

	it "conjugates 'fast-wind' in third person as 'fast-wound'" do
		expect( "fast-wind".en.past_tense( :third_person ) ).to eq( 'fast-wound' )
	end

	it "conjugates 'feed' as 'fed'" do
		expect( "feed".en.past_tense ).to eq( 'fed' )
	end

	it "conjugates 'feel' as 'felt'" do
		expect( "feel".en.past_tense ).to eq( 'felt' )
	end

	it "conjugates 'fight' as 'fought'" do
		expect( "fight".en.past_tense ).to eq( 'fought' )
	end

	it "conjugates 'find' as 'found'" do
		expect( "find".en.past_tense ).to eq( 'found' )
	end

	it "conjugates 'fit' as 'fit'" do
		expect( "fit".en.past_tense ).to eq( 'fit' )
	end

	it "conjugates 'fit-out' as 'fitted-out'" do
		expect( "fit-out".en.past_tense ).to eq( 'fitted-out' )
	end

	it "conjugates 'fit-out' in first person as 'fitted-out'" do
		expect( "fit-out".en.past_tense( :first_person ) ).to eq( 'fitted-out' )
	end

	it "conjugates 'fit-out' in third person as 'fitted-out'" do
		expect( "fit-out".en.past_tense( :third_person ) ).to eq( 'fitted-out' )
	end

	it "conjugates 'flee' as 'fled'" do
		expect( "flee".en.past_tense ).to eq( 'fled' )
	end

	it "conjugates 'fling' as 'flung'" do
		expect( "fling".en.past_tense ).to eq( 'flung' )
	end

	it "conjugates 'fly' as 'flew'" do
		expect( "fly".en.past_tense ).to eq( 'flew' )
	end

	it "conjugates 'forbear' as 'forbore'" do
		expect( "forbear".en.past_tense ).to eq( 'forbore' )
	end

	it "conjugates 'forbid' as 'forbade'" do
		expect( "forbid".en.past_tense ).to eq( 'forbade' )
	end

	it "conjugates 'forecast' as 'forecast'" do
		expect( "forecast".en.past_tense ).to eq( 'forecast' )
	end

	it "conjugates 'forego' as 'forewent'" do
		expect( "forego".en.past_tense ).to eq( 'forewent' )
	end

	it "conjugates 'foreknow' as 'foreknew'" do
		expect( "foreknow".en.past_tense ).to eq( 'foreknew' )
	end

	it "conjugates 'forerun' as 'foreran'" do
		expect( "forerun".en.past_tense ).to eq( 'foreran' )
	end

	it "conjugates 'forespeak' as 'forespoke'" do
		expect( "forespeak".en.past_tense ).to eq( 'forespoke' )
	end

	it "conjugates 'foreswear' as 'foreswore'" do
		expect( "foreswear".en.past_tense ).to eq( 'foreswore' )
	end

	it "conjugates 'foretell' as 'foretold'" do
		expect( "foretell".en.past_tense ).to eq( 'foretold' )
	end

	it "conjugates 'forget' as 'forgot'" do
		expect( "forget".en.past_tense ).to eq( 'forgot' )
	end

	it "conjugates 'forgive' as 'forgave'" do
		expect( "forgive".en.past_tense ).to eq( 'forgave' )
	end

	it "conjugates 'forsake' as 'forsook'" do
		expect( "forsake".en.past_tense ).to eq( 'forsook' )
	end

	it "conjugates 'forsee' as 'forsaw'" do
		expect( "forsee".en.past_tense ).to eq( 'forsaw' )
	end

	it "conjugates 'freeze' as 'froze'" do
		expect( "freeze".en.past_tense ).to eq( 'froze' )
	end

	it "conjugates 'gainsay' as 'gainsaid'" do
		expect( "gainsay".en.past_tense ).to eq( 'gainsaid' )
	end

	it "conjugates 'get' as 'got'" do
		expect( "get".en.past_tense ).to eq( 'got' )
	end

	it "conjugates 'give' as 'gave'" do
		expect( "give".en.past_tense ).to eq( 'gave' )
	end

	it "conjugates 'go' as 'went'" do
		expect( "go".en.past_tense ).to eq( 'went' )
	end

	it "conjugates 'grind' as 'ground'" do
		expect( "grind".en.past_tense ).to eq( 'ground' )
	end

	it "conjugates 'grow' as 'grew'" do
		expect( "grow".en.past_tense ).to eq( 'grew' )
	end

	it "conjugates 'hagride' as 'hagrode'" do
		expect( "hagride".en.past_tense ).to eq( 'hagrode' )
	end

	it "conjugates 'half-rise' as 'half-rose'" do
		expect( "half-rise".en.past_tense ).to eq( 'half-rose' )
	end

	it "conjugates 'half-rise' in first person as 'half-rose'" do
		expect( "half-rise".en.past_tense( :first_person ) ).to eq( 'half-rose' )
	end

	it "conjugates 'half-rise' in third person as 'half-rose'" do
		expect( "half-rise".en.past_tense( :third_person ) ).to eq( 'half-rose' )
	end

	it "conjugates 'halterbreak' as 'halterbroke'" do
		expect( "halterbreak".en.past_tense ).to eq( 'halterbroke' )
	end

	it "conjugates 'hamstring' as 'hamstrung'" do
		expect( "hamstring".en.past_tense ).to eq( 'hamstrung' )
	end

	it "conjugates 'hand-feed' as 'hand-fed'" do
		expect( "hand-feed".en.past_tense ).to eq( 'hand-fed' )
	end

	it "conjugates 'hand-feed' in first person as 'hand-fed'" do
		expect( "hand-feed".en.past_tense( :first_person ) ).to eq( 'hand-fed' )
	end

	it "conjugates 'hand-feed' in third person as 'hand-fed'" do
		expect( "hand-feed".en.past_tense( :third_person ) ).to eq( 'hand-fed' )
	end

	it "conjugates 'handwrite' as 'handwrote'" do
		expect( "handwrite".en.past_tense ).to eq( 'handwrote' )
	end

	it "conjugates 'hang' as 'hung'" do
		pending "handling for homographs"
		expect( "hang".en.past_tense ).to eq( 'hung' )
	end

	it "conjugates 'hang' in first person as 'hung'" do
		pending "handling for homographs"
		expect( "hang".en.past_tense( :first_person ) ).to eq( 'hung' )
	end

	it "conjugates 'hang' in third person as 'hung'" do
		pending "handling for homographs"
		expect( "hang".en.past_tense( :third_person ) ).to eq( 'hung' )
	end

	it "conjugates 'have' as 'had'" do
		expect( "have".en.past_tense ).to eq( 'had' )
	end

	it "conjugates 'have' as 'had'" do
		expect( "have".en.past_tense ).to eq( 'had' )
	end

	it "conjugates 'hear' as 'heard'" do
		expect( "hear".en.past_tense ).to eq( 'heard' )
	end

	it "conjugates 'hide' as 'hid'" do
		expect( "hide".en.past_tense ).to eq( 'hid' )
	end

	it "conjugates 'hit' as 'hit'" do
		expect( "hit".en.past_tense ).to eq( 'hit' )
	end

	it "conjugates 'hold' as 'held'" do
		expect( "hold".en.past_tense ).to eq( 'held' )
	end

	it "conjugates 'hurt' as 'hurt'" do
		expect( "hurt".en.past_tense ).to eq( 'hurt' )
	end

	it "conjugates 'inbreed' as 'inbred'" do
		expect( "inbreed".en.past_tense ).to eq( 'inbred' )
	end

	it "conjugates 'inbring' as 'inbrought'" do
		expect( "inbring".en.past_tense ).to eq( 'inbrought' )
	end

	it "conjugates 'inlay' as 'inlaid'" do
		expect( "inlay".en.past_tense ).to eq( 'inlaid' )
	end

	it "conjugates 'inset' as 'inset'" do
		expect( "inset".en.past_tense ).to eq( 'inset' )
	end

	it "conjugates 'interbreed' as 'interbred'" do
		expect( "interbreed".en.past_tense ).to eq( 'interbred' )
	end

	it "conjugates 'intercut' as 'intercut'" do
		expect( "intercut".en.past_tense ).to eq( 'intercut' )
	end

	it "conjugates 'interlay' as 'interlaid'" do
		expect( "interlay".en.past_tense ).to eq( 'interlaid' )
	end

	it "conjugates 'interset' as 'interset'" do
		expect( "interset".en.past_tense ).to eq( 'interset' )
	end

	it "conjugates 'interweave' as 'interwove'" do
		expect( "interweave".en.past_tense ).to eq( 'interwove' )
	end

	it "conjugates 'interwind' as 'interwound'" do
		expect( "interwind".en.past_tense ).to eq( 'interwound' )
	end

	it "conjugates 'inweave' as 'inwove'" do
		expect( "inweave".en.past_tense ).to eq( 'inwove' )
	end

	it "conjugates 'jerry-build' as 'jerry-built'" do
		expect( "jerry-build".en.past_tense ).to eq( 'jerry-built' )
	end

	it "conjugates 'jerry-build' in first person as 'jerry-built'" do
		expect( "jerry-build".en.past_tense( :first_person ) ).to eq( 'jerry-built' )
	end

	it "conjugates 'jerry-build' in third person as 'jerry-built'" do
		expect( "jerry-build".en.past_tense( :third_person ) ).to eq( 'jerry-built' )
	end

	it "conjugates 'keep' as 'kept'" do
		expect( "keep".en.past_tense ).to eq( 'kept' )
	end

	it "conjugates 'kick-off' as 'kicked-off'" do
		expect( "kick-off".en.past_tense ).to eq( 'kicked-off' )
	end

	it "conjugates 'kick-off' in first person as 'kicked-off'" do
		expect( "kick-off".en.past_tense( :first_person ) ).to eq( 'kicked-off' )
	end

	it "conjugates 'kick-off' in third person as 'kicked-off'" do
		expect( "kick-off".en.past_tense( :third_person ) ).to eq( 'kicked-off' )
	end

	it "conjugates 'kneel' as 'knelt'" do
		expect( "kneel".en.past_tense ).to eq( 'knelt' )
	end

	it "conjugates 'knit' as 'knitted'" do
		expect( "knit".en.past_tense ).to eq( 'knitted' )
	end

	it "conjugates 'know' as 'knew'" do
		expect( "know".en.past_tense ).to eq( 'knew' )
	end

	it "conjugates 'landslide' as 'landslid'" do
		expect( "landslide".en.past_tense ).to eq( 'landslid' )
	end

	it "conjugates 'lay' as 'laid'" do
		expect( "lay".en.past_tense ).to eq( 'laid' )
	end

	it "conjugates 'lead' as 'led'" do
		expect( "lead".en.past_tense ).to eq( 'led' )
	end

	it "conjugates 'leave' as 'left'" do
		expect( "leave".en.past_tense ).to eq( 'left' )
	end

	it "conjugates 'lend' as 'lent'" do
		expect( "lend".en.past_tense ).to eq( 'lent' )
	end

	it "conjugates 'let' as 'let'" do
		expect( "let".en.past_tense ).to eq( 'let' )
	end

	it "conjugates 'lie' as 'lay'" do
		pending "handling for homographs"
		expect( "lie".en.past_tense ).to eq( 'lay' )
	end

	it "conjugates 'lie' in first person as 'lay'" do
		pending "handling for homographs"
		expect( "lie".en.past_tense( :first_person ) ).to eq( 'lay' )
	end

	it "conjugates 'lie' in third person as 'lay'" do
		pending "handling for homographs"
		expect( "lie".en.past_tense( :third_person ) ).to eq( 'lay' )
	end

	it "conjugates 'light' as 'lit'" do
		expect( "light".en.past_tense ).to eq( 'lit' )
	end

	it "conjugates 'light-up' as 'lit-up'" do
		expect( "light-up".en.past_tense ).to eq( 'lit-up' )
	end

	it "conjugates 'light-up' in first person as 'lit-up'" do
		expect( "light-up".en.past_tense( :first_person ) ).to eq( 'lit-up' )
	end

	it "conjugates 'light-up' in third person as 'lit-up'" do
		expect( "light-up".en.past_tense( :third_person ) ).to eq( 'lit-up' )
	end

	it "conjugates 'lip-read' as 'lip-read'" do
		expect( "lip-read".en.past_tense ).to eq( 'lip-read' )
	end

	it "conjugates 'lip-read' in first person as 'lip-read'" do
		expect( "lip-read".en.past_tense( :first_person ) ).to eq( 'lip-read' )
	end

	it "conjugates 'lip-read' in third person as 'lip-read'" do
		expect( "lip-read".en.past_tense( :third_person ) ).to eq( 'lip-read' )
	end

	it "conjugates 'loop-up' as 'looped-up'" do
		expect( "loop-up".en.past_tense ).to eq( 'looped-up' )
	end

	it "conjugates 'loop-up' in first person as 'looped-up'" do
		expect( "loop-up".en.past_tense( :first_person ) ).to eq( 'looped-up' )
	end

	it "conjugates 'loop-up' in third person as 'looped-up'" do
		expect( "loop-up".en.past_tense( :third_person ) ).to eq( 'looped-up' )
	end

	it "conjugates 'lose' as 'lost'" do
		expect( "lose".en.past_tense ).to eq( 'lost' )
	end

	it "conjugates 'make' as 'made'" do
		expect( "make".en.past_tense ).to eq( 'made' )
	end

	it "conjugates 'make-out' as 'made-out'" do
		expect( "make-out".en.past_tense ).to eq( 'made-out' )
	end

	it "conjugates 'make-out' in first person as 'made-out'" do
		expect( "make-out".en.past_tense( :first_person ) ).to eq( 'made-out' )
	end

	it "conjugates 'make-out' in third person as 'made-out'" do
		expect( "make-out".en.past_tense( :third_person ) ).to eq( 'made-out' )
	end

	it "conjugates 'mean' as 'meant'" do
		expect( "mean".en.past_tense ).to eq( 'meant' )
	end

	it "conjugates 'meet' as 'met'" do
		expect( "meet".en.past_tense ).to eq( 'met' )
	end

	it "conjugates 'misbecome' as 'misbecame'" do
		expect( "misbecome".en.past_tense ).to eq( 'misbecame' )
	end

	it "conjugates 'miscast' as 'miscast'" do
		expect( "miscast".en.past_tense ).to eq( 'miscast' )
	end

	it "conjugates 'miscut' as 'miscut'" do
		expect( "miscut".en.past_tense ).to eq( 'miscut' )
	end

	it "conjugates 'misdeal' as 'misdealt'" do
		expect( "misdeal".en.past_tense ).to eq( 'misdealt' )
	end

	it "conjugates 'misdo' as 'misdid'" do
		expect( "misdo".en.past_tense ).to eq( 'misdid' )
	end

	it "conjugates 'mishear' as 'misheard'" do
		expect( "mishear".en.past_tense ).to eq( 'misheard' )
	end

	it "conjugates 'mishit' as 'mishit'" do
		expect( "mishit".en.past_tense ).to eq( 'mishit' )
	end

	it "conjugates 'mislay' as 'mislaid'" do
		expect( "mislay".en.past_tense ).to eq( 'mislaid' )
	end

	it "conjugates 'mislead' as 'misled'" do
		expect( "mislead".en.past_tense ).to eq( 'misled' )
	end

	it "conjugates 'misread' as 'misread'" do
		expect( "misread".en.past_tense ).to eq( 'misread' )
	end

	it "conjugates 'missay' as 'missaid'" do
		expect( "missay".en.past_tense ).to eq( 'missaid' )
	end

	it "conjugates 'missend' as 'missent'" do
		expect( "missend".en.past_tense ).to eq( 'missent' )
	end

	it "conjugates 'misspeak' as 'misspoke'" do
		expect( "misspeak".en.past_tense ).to eq( 'misspoke' )
	end

	it "conjugates 'misspend' as 'misspent'" do
		expect( "misspend".en.past_tense ).to eq( 'misspent' )
	end

	it "conjugates 'misswear' as 'misswore'" do
		expect( "misswear".en.past_tense ).to eq( 'misswore' )
	end

	it "conjugates 'mistake' as 'mistook'" do
		expect( "mistake".en.past_tense ).to eq( 'mistook' )
	end

	it "conjugates 'misteach' as 'mistaught'" do
		expect( "misteach".en.past_tense ).to eq( 'mistaught' )
	end

	it "conjugates 'mistell' as 'mistold'" do
		expect( "mistell".en.past_tense ).to eq( 'mistold' )
	end

	it "conjugates 'misthink' as 'misthought'" do
		expect( "misthink".en.past_tense ).to eq( 'misthought' )
	end

	it "conjugates 'misunderstand' as 'misunderstood'" do
		expect( "misunderstand".en.past_tense ).to eq( 'misunderstood' )
	end

	it "conjugates 'miswear' as 'miswore'" do
		expect( "miswear".en.past_tense ).to eq( 'miswore' )
	end

	it "conjugates 'miswed' as 'miswed'" do
		expect( "miswed".en.past_tense ).to eq( 'miswed' )
	end

	it "conjugates 'miswrite' as 'miswrote'" do
		expect( "miswrite".en.past_tense ).to eq( 'miswrote' )
	end

	it "conjugates 'offset' as 'offset'" do
		expect( "offset".en.past_tense ).to eq( 'offset' )
	end

	it "conjugates 'outbid' as 'outbid'" do
		expect( "outbid".en.past_tense ).to eq( 'outbid' )
	end

	it "conjugates 'outbreed' as 'outbred'" do
		expect( "outbreed".en.past_tense ).to eq( 'outbred' )
	end

	it "conjugates 'outdo' as 'outdid'" do
		expect( "outdo".en.past_tense ).to eq( 'outdid' )
	end

	it "conjugates 'outdraw' as 'outdrew'" do
		expect( "outdraw".en.past_tense ).to eq( 'outdrew' )
	end

	it "conjugates 'outdrink' as 'outdrank'" do
		expect( "outdrink".en.past_tense ).to eq( 'outdrank' )
	end

	it "conjugates 'outdrive' as 'outdrove'" do
		expect( "outdrive".en.past_tense ).to eq( 'outdrove' )
	end

	it "conjugates 'outfight' as 'outfought'" do
		expect( "outfight".en.past_tense ).to eq( 'outfought' )
	end

	it "conjugates 'outfly' as 'outflew'" do
		expect( "outfly".en.past_tense ).to eq( 'outflew' )
	end

	it "conjugates 'outgrow' as 'outgrew'" do
		expect( "outgrow".en.past_tense ).to eq( 'outgrew' )
	end

	it "conjugates 'outlay' as 'outlaid'" do
		expect( "outlay".en.past_tense ).to eq( 'outlaid' )
	end

	it "conjugates 'outride' as 'outrode'" do
		expect( "outride".en.past_tense ).to eq( 'outrode' )
	end

	it "conjugates 'outrun' as 'outran'" do
		expect( "outrun".en.past_tense ).to eq( 'outran' )
	end

	it "conjugates 'outsee' as 'outsaw'" do
		expect( "outsee".en.past_tense ).to eq( 'outsaw' )
	end

	it "conjugates 'outsell' as 'outsold'" do
		expect( "outsell".en.past_tense ).to eq( 'outsold' )
	end

	it "conjugates 'outshoot' as 'outshot'" do
		expect( "outshoot".en.past_tense ).to eq( 'outshot' )
	end

	it "conjugates 'outsing' as 'outsang'" do
		expect( "outsing".en.past_tense ).to eq( 'outsang' )
	end

	it "conjugates 'outsit' as 'outsat'" do
		expect( "outsit".en.past_tense ).to eq( 'outsat' )
	end

	it "conjugates 'outsleep' as 'outslept'" do
		expect( "outsleep".en.past_tense ).to eq( 'outslept' )
	end

	it "conjugates 'outspeak' as 'outspoke'" do
		expect( "outspeak".en.past_tense ).to eq( 'outspoke' )
	end

	it "conjugates 'outspeed' as 'outsped'" do
		expect( "outspeed".en.past_tense ).to eq( 'outsped' )
	end

	it "conjugates 'outspend' as 'outspent'" do
		expect( "outspend".en.past_tense ).to eq( 'outspent' )
	end

	it "conjugates 'outspin' as 'outspun'" do
		expect( "outspin".en.past_tense ).to eq( 'outspun' )
	end

	it "conjugates 'outspring' as 'outsprang'" do
		expect( "outspring".en.past_tense ).to eq( 'outsprang' )
	end

	it "conjugates 'outstand' as 'outstood'" do
		expect( "outstand".en.past_tense ).to eq( 'outstood' )
	end

	it "conjugates 'outswear' as 'outswore'" do
		expect( "outswear".en.past_tense ).to eq( 'outswore' )
	end

	it "conjugates 'outswim' as 'outswam'" do
		expect( "outswim".en.past_tense ).to eq( 'outswam' )
	end

	it "conjugates 'outtell' as 'outtold'" do
		expect( "outtell".en.past_tense ).to eq( 'outtold' )
	end

	it "conjugates 'outthink' as 'outthought'" do
		expect( "outthink".en.past_tense ).to eq( 'outthought' )
	end

	it "conjugates 'outthrow' as 'outthrew'" do
		expect( "outthrow".en.past_tense ).to eq( 'outthrew' )
	end

	it "conjugates 'outwear' as 'outwore'" do
		expect( "outwear".en.past_tense ).to eq( 'outwore' )
	end

	it "conjugates 'outwind' as 'outwound'" do
		expect( "outwind".en.past_tense ).to eq( 'outwound' )
	end

	it "conjugates 'outwrite' as 'outwrote'" do
		expect( "outwrite".en.past_tense ).to eq( 'outwrote' )
	end

	it "conjugates 'overbear' as 'overbore'" do
		expect( "overbear".en.past_tense ).to eq( 'overbore' )
	end

	it "conjugates 'overbid' as 'overbid'" do
		expect( "overbid".en.past_tense ).to eq( 'overbid' )
	end

	it "conjugates 'overbreed' as 'overbred'" do
		expect( "overbreed".en.past_tense ).to eq( 'overbred' )
	end

	it "conjugates 'overbuild' as 'overbuilt'" do
		expect( "overbuild".en.past_tense ).to eq( 'overbuilt' )
	end

	it "conjugates 'overbuy' as 'overbought'" do
		expect( "overbuy".en.past_tense ).to eq( 'overbought' )
	end

	it "conjugates 'overcast' as 'overcast'" do
		expect( "overcast".en.past_tense ).to eq( 'overcast' )
	end

	it "conjugates 'overcome' as 'overcame'" do
		expect( "overcome".en.past_tense ).to eq( 'overcame' )
	end

	it "conjugates 'overcut' as 'overcut'" do
		expect( "overcut".en.past_tense ).to eq( 'overcut' )
	end

	it "conjugates 'overdo' as 'overdid'" do
		expect( "overdo".en.past_tense ).to eq( 'overdid' )
	end

	it "conjugates 'overdraw' as 'overdrew'" do
		expect( "overdraw".en.past_tense ).to eq( 'overdrew' )
	end

	it "conjugates 'overdrink' as 'overdrank'" do
		expect( "overdrink".en.past_tense ).to eq( 'overdrank' )
	end

	it "conjugates 'overdrive' as 'overdrove'" do
		expect( "overdrive".en.past_tense ).to eq( 'overdrove' )
	end

	it "conjugates 'overeat' as 'overate'" do
		expect( "overeat".en.past_tense ).to eq( 'overate' )
	end

	it "conjugates 'overfeed' as 'overfed'" do
		expect( "overfeed".en.past_tense ).to eq( 'overfed' )
	end

	it "conjugates 'overhang' as 'overhung'" do
		expect( "overhang".en.past_tense ).to eq( 'overhung' )
	end

	it "conjugates 'overhear' as 'overheard'" do
		expect( "overhear".en.past_tense ).to eq( 'overheard' )
	end

	it "conjugates 'overlay' as 'overlaid'" do
		expect( "overlay".en.past_tense ).to eq( 'overlaid' )
	end

	it "conjugates 'overlie' as 'overlay'" do
		expect( "overlie".en.past_tense ).to eq( 'overlay' )
	end

	it "conjugates 'overpay' as 'overpaid'" do
		expect( "overpay".en.past_tense ).to eq( 'overpaid' )
	end

	it "conjugates 'override' as 'overrode'" do
		expect( "override".en.past_tense ).to eq( 'overrode' )
	end

	it "conjugates 'overrun' as 'overran'" do
		expect( "overrun".en.past_tense ).to eq( 'overran' )
	end

	it "conjugates 'oversee' as 'oversaw'" do
		expect( "oversee".en.past_tense ).to eq( 'oversaw' )
	end

	it "conjugates 'oversell' as 'oversold'" do
		expect( "oversell".en.past_tense ).to eq( 'oversold' )
	end

	it "conjugates 'overset' as 'overset'" do
		expect( "overset".en.past_tense ).to eq( 'overset' )
	end

	it "conjugates 'overshoot' as 'overshot'" do
		expect( "overshoot".en.past_tense ).to eq( 'overshot' )
	end

	it "conjugates 'oversleep' as 'overslept'" do
		expect( "oversleep".en.past_tense ).to eq( 'overslept' )
	end

	it "conjugates 'overslide' as 'overslid'" do
		expect( "overslide".en.past_tense ).to eq( 'overslid' )
	end

	it "conjugates 'oversling' as 'overslung'" do
		expect( "oversling".en.past_tense ).to eq( 'overslung' )
	end

	it "conjugates 'overspeak' as 'overspoke'" do
		expect( "overspeak".en.past_tense ).to eq( 'overspoke' )
	end

	it "conjugates 'overspeed' as 'oversped'" do
		expect( "overspeed".en.past_tense ).to eq( 'oversped' )
	end

	it "conjugates 'overspend' as 'overspent'" do
		expect( "overspend".en.past_tense ).to eq( 'overspent' )
	end

	it "conjugates 'overspin' as 'overspun'" do
		expect( "overspin".en.past_tense ).to eq( 'overspun' )
	end

	it "conjugates 'overspread' as 'overspread'" do
		expect( "overspread".en.past_tense ).to eq( 'overspread' )
	end

	it "conjugates 'overspring' as 'oversprang'" do
		expect( "overspring".en.past_tense ).to eq( 'oversprang' )
	end

	it "conjugates 'overstand' as 'overstood'" do
		expect( "overstand".en.past_tense ).to eq( 'overstood' )
	end

	it "conjugates 'overstride' as 'overstrode'" do
		expect( "overstride".en.past_tense ).to eq( 'overstrode' )
	end

	it "conjugates 'overstrike' as 'overstruck'" do
		expect( "overstrike".en.past_tense ).to eq( 'overstruck' )
	end

	it "conjugates 'overstring' as 'overstrung'" do
		expect( "overstring".en.past_tense ).to eq( 'overstrung' )
	end

	it "conjugates 'overstrive' as 'overstrove'" do
		expect( "overstrive".en.past_tense ).to eq( 'overstrove' )
	end

	it "conjugates 'overtake' as 'overtook'" do
		expect( "overtake".en.past_tense ).to eq( 'overtook' )
	end

	it "conjugates 'overthink' as 'overthought'" do
		expect( "overthink".en.past_tense ).to eq( 'overthought' )
	end

	it "conjugates 'overthrow' as 'overthrew'" do
		expect( "overthrow".en.past_tense ).to eq( 'overthrew' )
	end

	it "conjugates 'overwear' as 'overwore'" do
		expect( "overwear".en.past_tense ).to eq( 'overwore' )
	end

	it "conjugates 'overwind' as 'overwound'" do
		expect( "overwind".en.past_tense ).to eq( 'overwound' )
	end

	it "conjugates 'overwrite' as 'overwrote'" do
		expect( "overwrite".en.past_tense ).to eq( 'overwrote' )
	end

	it "conjugates 'pay' as 'paid'" do
		expect( "pay".en.past_tense ).to eq( 'paid' )
	end

	it "conjugates 'picnic' as 'picnicked'" do
		expect( "picnic".en.past_tense ).to eq( 'picnicked' )
	end

	it "conjugates 'plead' as 'pleaded'" do
		expect( "plead".en.past_tense ).to eq( 'pleaded' )
	end

	it "conjugates 'prebuild' as 'prebuilt'" do
		expect( "prebuild".en.past_tense ).to eq( 'prebuilt' )
	end

	it "conjugates 'predo' as 'predid'" do
		expect( "predo".en.past_tense ).to eq( 'predid' )
	end

	it "conjugates 'premake' as 'premade'" do
		expect( "premake".en.past_tense ).to eq( 'premade' )
	end

	it "conjugates 'prepay' as 'prepaid'" do
		expect( "prepay".en.past_tense ).to eq( 'prepaid' )
	end

	it "conjugates 'presell' as 'presold'" do
		expect( "presell".en.past_tense ).to eq( 'presold' )
	end

	it "conjugates 'preset' as 'preset'" do
		expect( "preset".en.past_tense ).to eq( 'preset' )
	end

	it "conjugates 'preshrink' as 'preshrank'" do
		expect( "preshrink".en.past_tense ).to eq( 'preshrank' )
	end

	it "conjugates 'presplit' as 'presplit'" do
		expect( "presplit".en.past_tense ).to eq( 'presplit' )
	end

	it "conjugates 'proofread' as 'proofread'" do
		expect( "proofread".en.past_tense ).to eq( 'proofread' )
	end

	it "conjugates 'prove' as 'proved'" do
		expect( "prove".en.past_tense ).to eq( 'proved' )
	end

	it "conjugates 'put' as 'put'" do
		expect( "put".en.past_tense ).to eq( 'put' )
	end

	it "conjugates 'quick-freeze' as 'quick-froze'" do
		expect( "quick-freeze".en.past_tense ).to eq( 'quick-froze' )
	end

	it "conjugates 'quick-freeze' in first person as 'quick-froze'" do
		expect( "quick-freeze".en.past_tense( :first_person ) ).to eq( 'quick-froze' )
	end

	it "conjugates 'quick-freeze' in third person as 'quick-froze'" do
		expect( "quick-freeze".en.past_tense( :third_person ) ).to eq( 'quick-froze' )
	end

	it "conjugates 'quickfreeze' as 'quickfroze'" do
		expect( "quickfreeze".en.past_tense ).to eq( 'quickfroze' )
	end

	it "conjugates 'quit' as 'quit'" do
		expect( "quit".en.past_tense ).to eq( 'quit' )
	end

	it "conjugates 're-cast' as 're-cast'" do
		expect( "re-cast".en.past_tense ).to eq( 're-cast' )
	end

	it "conjugates 're-cast' in first person as 're-cast'" do
		expect( "re-cast".en.past_tense( :first_person ) ).to eq( 're-cast' )
	end

	it "conjugates 're-cast' in third person as 're-cast'" do
		expect( "re-cast".en.past_tense( :third_person ) ).to eq( 're-cast' )
	end

	it "conjugates 're-lay' as 're-laid'" do
		expect( "re-lay".en.past_tense ).to eq( 're-laid' )
	end

	it "conjugates 're-lay' in first person as 're-laid'" do
		expect( "re-lay".en.past_tense( :first_person ) ).to eq( 're-laid' )
	end

	it "conjugates 're-lay' in third person as 're-laid'" do
		expect( "re-lay".en.past_tense( :third_person ) ).to eq( 're-laid' )
	end

	it "conjugates 're-make' as 're-made'" do
		expect( "re-make".en.past_tense ).to eq( 're-made' )
	end

	it "conjugates 're-make' in first person as 're-made'" do
		expect( "re-make".en.past_tense( :first_person ) ).to eq( 're-made' )
	end

	it "conjugates 're-make' in third person as 're-made'" do
		expect( "re-make".en.past_tense( :third_person ) ).to eq( 're-made' )
	end

	it "conjugates 're-sell' as 're-sold'" do
		expect( "re-sell".en.past_tense ).to eq( 're-sold' )
	end

	it "conjugates 're-sell' in first person as 're-sold'" do
		expect( "re-sell".en.past_tense( :first_person ) ).to eq( 're-sold' )
	end

	it "conjugates 're-sell' in third person as 're-sold'" do
		expect( "re-sell".en.past_tense( :third_person ) ).to eq( 're-sold' )
	end

	it "conjugates 're-tell' as 're-told'" do
		expect( "re-tell".en.past_tense ).to eq( 're-told' )
	end

	it "conjugates 're-tell' in first person as 're-told'" do
		expect( "re-tell".en.past_tense( :first_person ) ).to eq( 're-told' )
	end

	it "conjugates 're-tell' in third person as 're-told'" do
		expect( "re-tell".en.past_tense( :third_person ) ).to eq( 're-told' )
	end

	it "conjugates 'read' as 'read'" do
		expect( "read".en.past_tense ).to eq( 'read' )
	end

	it "conjugates 'rebid' as 'rebid'" do
		expect( "rebid".en.past_tense ).to eq( 'rebid' )
	end

	it "conjugates 'rebind' as 'rebound'" do
		expect( "rebind".en.past_tense ).to eq( 'rebound' )
	end

	it "conjugates 'rebroadcast' as 'rebroadcast'" do
		expect( "rebroadcast".en.past_tense ).to eq( 'rebroadcast' )
	end

	it "conjugates 'rebuild' as 'rebuilt'" do
		expect( "rebuild".en.past_tense ).to eq( 'rebuilt' )
	end

	it "conjugates 'recast' as 'recast'" do
		expect( "recast".en.past_tense ).to eq( 'recast' )
	end

	it "conjugates 'recut' as 'recut'" do
		expect( "recut".en.past_tense ).to eq( 'recut' )
	end

	it "conjugates 'redeal' as 'redealt'" do
		expect( "redeal".en.past_tense ).to eq( 'redealt' )
	end

	it "conjugates 'redo' as 'redid'" do
		expect( "redo".en.past_tense ).to eq( 'redid' )
	end

	it "conjugates 'redraw' as 'redrew'" do
		expect( "redraw".en.past_tense ).to eq( 'redrew' )
	end

	it "conjugates 'refit' as 'refit'" do
		expect( "refit".en.past_tense ).to eq( 'refit' )
	end

	it "conjugates 'regrind' as 'reground'" do
		expect( "regrind".en.past_tense ).to eq( 'reground' )
	end

	it "conjugates 'regrow' as 'regrew'" do
		expect( "regrow".en.past_tense ).to eq( 'regrew' )
	end

	it "conjugates 'rehang' as 'rehung'" do
		expect( "rehang".en.past_tense ).to eq( 'rehung' )
	end

	it "conjugates 'rehear' as 'reheard'" do
		expect( "rehear".en.past_tense ).to eq( 'reheard' )
	end

	it "conjugates 'reknit' as 'reknitted'" do
		expect( "reknit".en.past_tense ).to eq( 'reknitted' )
	end

	it "conjugates 'relay' as 'relaid'" do
		expect( "relay".en.past_tense ).to eq( 'relaid' )
	end

	it "conjugates 'remake' as 'remade'" do
		expect( "remake".en.past_tense ).to eq( 'remade' )
	end

	it "conjugates 'repay' as 'repaid'" do
		expect( "repay".en.past_tense ).to eq( 'repaid' )
	end

	it "conjugates 'rerun' as 'reran'" do
		expect( "rerun".en.past_tense ).to eq( 'reran' )
	end

	it "conjugates 'resell' as 'resold'" do
		expect( "resell".en.past_tense ).to eq( 'resold' )
	end

	it "conjugates 'resend' as 'resent'" do
		expect( "resend".en.past_tense ).to eq( 'resent' )
	end

	it "conjugates 'reset' as 'reset'" do
		expect( "reset".en.past_tense ).to eq( 'reset' )
	end

	it "conjugates 'resew' as 'resewed'" do
		expect( "resew".en.past_tense ).to eq( 'resewed' )
	end

	it "conjugates 'retake' as 'retook'" do
		expect( "retake".en.past_tense ).to eq( 'retook' )
	end

	it "conjugates 'reteach' as 'retaught'" do
		expect( "reteach".en.past_tense ).to eq( 'retaught' )
	end

	it "conjugates 'retear' as 'retore'" do
		expect( "retear".en.past_tense ).to eq( 'retore' )
	end

	it "conjugates 'retell' as 'retold'" do
		expect( "retell".en.past_tense ).to eq( 'retold' )
	end

	it "conjugates 'rethink' as 'rethought'" do
		expect( "rethink".en.past_tense ).to eq( 'rethought' )
	end

	it "conjugates 'retread' as 'retrod'" do
		expect( "retread".en.past_tense ).to eq( 'retrod' )
	end

	it "conjugates 'retrofit' as 'retrofit'" do
		expect( "retrofit".en.past_tense ).to eq( 'retrofit' )
	end

	it "conjugates 'reweave' as 'rewove'" do
		expect( "reweave".en.past_tense ).to eq( 'rewove' )
	end

	it "conjugates 'rewed' as 'rewed'" do
		expect( "rewed".en.past_tense ).to eq( 'rewed' )
	end

	it "conjugates 'rewet' as 'rewet'" do
		expect( "rewet".en.past_tense ).to eq( 'rewet' )
	end

	it "conjugates 'rewin' as 'rewon'" do
		expect( "rewin".en.past_tense ).to eq( 'rewon' )
	end

	it "conjugates 'rewind' as 'rewound'" do
		expect( "rewind".en.past_tense ).to eq( 'rewound' )
	end

	it "conjugates 'rewrite' as 'rewrote'" do
		expect( "rewrite".en.past_tense ).to eq( 'rewrote' )
	end

	it "conjugates 'rid' as 'rid'" do
		expect( "rid".en.past_tense ).to eq( 'rid' )
	end

	it "conjugates 'ride' as 'rode'" do
		expect( "ride".en.past_tense ).to eq( 'rode' )
	end

	it "conjugates 'ring' as 'rang'" do
		expect( "ring".en.past_tense ).to eq( 'rang' )
	end

	it "conjugates 'rise' as 'rose'" do
		expect( "rise".en.past_tense ).to eq( 'rose' )
	end

	it "conjugates 'run' as 'ran'" do
		expect( "run".en.past_tense ).to eq( 'ran' )
	end

	it "conjugates 'sand-cast' as 'sand-cast'" do
		expect( "sand-cast".en.past_tense ).to eq( 'sand-cast' )
	end

	it "conjugates 'sand-cast' in first person as 'sand-cast'" do
		expect( "sand-cast".en.past_tense( :first_person ) ).to eq( 'sand-cast' )
	end

	it "conjugates 'sand-cast' in third person as 'sand-cast'" do
		expect( "sand-cast".en.past_tense( :third_person ) ).to eq( 'sand-cast' )
	end

	it "conjugates 'sandcast' as 'sandcast'" do
		expect( "sandcast".en.past_tense ).to eq( 'sandcast' )
	end

	it "conjugates 'say' as 'said'" do
		expect( "say".en.past_tense ).to eq( 'said' )
	end

	it "conjugates 'see' as 'saw'" do
		expect( "see".en.past_tense ).to eq( 'saw' )
	end

	it "conjugates 'seek' as 'sought'" do
		expect( "seek".en.past_tense ).to eq( 'sought' )
	end

	it "conjugates 'self-feed' as 'self-fed'" do
		expect( "self-feed".en.past_tense ).to eq( 'self-fed' )
	end

	it "conjugates 'self-feed' in first person as 'self-fed'" do
		expect( "self-feed".en.past_tense( :first_person ) ).to eq( 'self-fed' )
	end

	it "conjugates 'self-feed' in third person as 'self-fed'" do
		expect( "self-feed".en.past_tense( :third_person ) ).to eq( 'self-fed' )
	end

	it "conjugates 'selffeed' as 'selffed'" do
		expect( "selffeed".en.past_tense ).to eq( 'selffed' )
	end

	it "conjugates 'sell' as 'sold'" do
		expect( "sell".en.past_tense ).to eq( 'sold' )
	end

	it "conjugates 'send' as 'sent'" do
		expect( "send".en.past_tense ).to eq( 'sent' )
	end

	it "conjugates 'set' as 'set'" do
		expect( "set".en.past_tense ).to eq( 'set' )
	end

	it "conjugates 'sew' as 'sewed'" do
		expect( "sew".en.past_tense ).to eq( 'sewed' )
	end

	it "conjugates 'shake' as 'shook'" do
		expect( "shake".en.past_tense ).to eq( 'shook' )
	end

	it "conjugates 'shear' as 'shore'" do
		expect( "shear".en.past_tense ).to eq( 'shore' )
	end

	it "conjugates 'shed' as 'shed'" do
		expect( "shed".en.past_tense ).to eq( 'shed' )
	end

	it "conjugates 'shoot' as 'shot'" do
		expect( "shoot".en.past_tense ).to eq( 'shot' )
	end

	it "conjugates 'show' as 'showed'" do
		expect( "show".en.past_tense ).to eq( 'showed' )
	end

	it "conjugates 'shrink' as 'shrank'" do
		expect( "shrink".en.past_tense ).to eq( 'shrank' )
	end

	it "conjugates 'shut' as 'shut'" do
		expect( "shut".en.past_tense ).to eq( 'shut' )
	end

	it "conjugates 'sight-read' as 'sight-read'" do
		expect( "sight-read".en.past_tense ).to eq( 'sight-read' )
	end

	it "conjugates 'sight-read' in first person as 'sight-read'" do
		expect( "sight-read".en.past_tense( :first_person ) ).to eq( 'sight-read' )
	end

	it "conjugates 'sight-read' in third person as 'sight-read'" do
		expect( "sight-read".en.past_tense( :third_person ) ).to eq( 'sight-read' )
	end

	it "conjugates 'sightread' as 'sightread'" do
		expect( "sightread".en.past_tense ).to eq( 'sightread' )
	end

	it "conjugates 'sign-on' as 'signed-on'" do
		expect( "sign-on".en.past_tense ).to eq( 'signed-on' )
	end

	it "conjugates 'sign-on' in first person as 'signed-on'" do
		expect( "sign-on".en.past_tense( :first_person ) ).to eq( 'signed-on' )
	end

	it "conjugates 'sign-on' in third person as 'signed-on'" do
		expect( "sign-on".en.past_tense( :third_person ) ).to eq( 'signed-on' )
	end

	it "conjugates 'sing' as 'sang'" do
		expect( "sing".en.past_tense ).to eq( 'sang' )
	end

	it "conjugates 'sink' as 'sank'" do
		expect( "sink".en.past_tense ).to eq( 'sank' )
	end

	it "conjugates 'sit' as 'sat'" do
		expect( "sit".en.past_tense ).to eq( 'sat' )
	end

	it "conjugates 'skywrite' as 'skywrote'" do
		expect( "skywrite".en.past_tense ).to eq( 'skywrote' )
	end

	it "conjugates 'slay' as 'slew'" do
		expect( "slay".en.past_tense ).to eq( 'slew' )
	end

	it "conjugates 'sleep' as 'slept'" do
		expect( "sleep".en.past_tense ).to eq( 'slept' )
	end

	it "conjugates 'slide' as 'slid'" do
		expect( "slide".en.past_tense ).to eq( 'slid' )
	end

	it "conjugates 'sling' as 'slung'" do
		expect( "sling".en.past_tense ).to eq( 'slung' )
	end

	it "conjugates 'slit' as 'slit'" do
		expect( "slit".en.past_tense ).to eq( 'slit' )
	end

	it "conjugates 'smite' as 'smote'" do
		expect( "smite".en.past_tense ).to eq( 'smote' )
	end

	it "conjugates 'speak' as 'spoke'" do
		expect( "speak".en.past_tense ).to eq( 'spoke' )
	end

	it "conjugates 'speed' as 'sped'" do
		expect( "speed".en.past_tense ).to eq( 'sped' )
	end

	it "conjugates 'spend' as 'spent'" do
		expect( "spend".en.past_tense ).to eq( 'spent' )
	end

	it "conjugates 'spin' as 'spun'" do
		expect( "spin".en.past_tense ).to eq( 'spun' )
	end

	it "conjugates 'spit' as 'spat'" do
		expect( "spit".en.past_tense ).to eq( 'spat' )
	end

	it "conjugates 'split' as 'split'" do
		expect( "split".en.past_tense ).to eq( 'split' )
	end

	it "conjugates 'spoon-feed' as 'spoon-fed'" do
		expect( "spoon-feed".en.past_tense ).to eq( 'spoon-fed' )
	end

	it "conjugates 'spoon-feed' in first person as 'spoon-fed'" do
		expect( "spoon-feed".en.past_tense( :first_person ) ).to eq( 'spoon-fed' )
	end

	it "conjugates 'spoon-feed' in third person as 'spoon-fed'" do
		expect( "spoon-feed".en.past_tense( :third_person ) ).to eq( 'spoon-fed' )
	end

	it "conjugates 'spoonfeed' as 'spoonfed'" do
		expect( "spoonfeed".en.past_tense ).to eq( 'spoonfed' )
	end

	it "conjugates 'spot' as 'spotted'" do
		expect( "spot".en.past_tense ).to eq( 'spotted' )
	end

	it "conjugates 'spread' as 'spread'" do
		expect( "spread".en.past_tense ).to eq( 'spread' )
	end

	it "conjugates 'spring' as 'sprang'" do
		expect( "spring".en.past_tense ).to eq( 'sprang' )
	end

	it "conjugates 'stall-feed' as 'stall-fed'" do
		expect( "stall-feed".en.past_tense ).to eq( 'stall-fed' )
	end

	it "conjugates 'stall-feed' in first person as 'stall-fed'" do
		expect( "stall-feed".en.past_tense( :first_person ) ).to eq( 'stall-fed' )
	end

	it "conjugates 'stall-feed' in third person as 'stall-fed'" do
		expect( "stall-feed".en.past_tense( :third_person ) ).to eq( 'stall-fed' )
	end

	it "conjugates 'stallfeed' as 'stallfed'" do
		expect( "stallfeed".en.past_tense ).to eq( 'stallfed' )
	end

	it "conjugates 'stand' as 'stood'" do
		expect( "stand".en.past_tense ).to eq( 'stood' )
	end

	it "conjugates 'steal' as 'stole'" do
		expect( "steal".en.past_tense ).to eq( 'stole' )
	end

	it "conjugates 'step-up' as 'stepped-up'" do
		expect( "step-up".en.past_tense ).to eq( 'stepped-up' )
	end

	it "conjugates 'step-up' in first person as 'stepped-up'" do
		expect( "step-up".en.past_tense( :first_person ) ).to eq( 'stepped-up' )
	end

	it "conjugates 'step-up' in third person as 'stepped-up'" do
		expect( "step-up".en.past_tense( :third_person ) ).to eq( 'stepped-up' )
	end

	it "conjugates 'stepup' as 'steppedup'" do
		expect( "stepup".en.past_tense ).to eq( 'steppedup' )
	end

	it "conjugates 'stick' as 'stuck'" do
		expect( "stick".en.past_tense ).to eq( 'stuck' )
	end

	it "conjugates 'sting' as 'stung'" do
		expect( "sting".en.past_tense ).to eq( 'stung' )
	end

	it "conjugates 'stink' as 'stank'" do
		expect( "stink".en.past_tense ).to eq( 'stank' )
	end

	it "conjugates 'stride' as 'strode'" do
		expect( "stride".en.past_tense ).to eq( 'strode' )
	end

	it "conjugates 'strike' as 'struck'" do
		expect( "strike".en.past_tense ).to eq( 'struck' )
	end

	it "conjugates 'string' as 'strung'" do
		expect( "string".en.past_tense ).to eq( 'strung' )
	end

	it "conjugates 'strive' as 'strove'" do
		expect( "strive".en.past_tense ).to eq( 'strove' )
	end

	it "conjugates 'sub-let' as 'sub-let'" do
		expect( "sub-let".en.past_tense ).to eq( 'sub-let' )
	end

	it "conjugates 'sub-let' in first person as 'sub-let'" do
		expect( "sub-let".en.past_tense( :first_person ) ).to eq( 'sub-let' )
	end

	it "conjugates 'sub-let' in third person as 'sub-let'" do
		expect( "sub-let".en.past_tense( :third_person ) ).to eq( 'sub-let' )
	end

	it "conjugates 'sublet' as 'sublet'" do
		expect( "sublet".en.past_tense ).to eq( 'sublet' )
	end

	it "conjugates 'swear' as 'swore'" do
		expect( "swear".en.past_tense ).to eq( 'swore' )
	end

	it "conjugates 'sweep' as 'swept'" do
		expect( "sweep".en.past_tense ).to eq( 'swept' )
	end

	it "conjugates 'swell' as 'swelled'" do
		expect( "swell".en.past_tense ).to eq( 'swelled' )
	end

	it "conjugates 'swim' as 'swam'" do
		expect( "swim".en.past_tense ).to eq( 'swam' )
	end

	it "conjugates 'swing' as 'swung'" do
		expect( "swing".en.past_tense ).to eq( 'swung' )
	end

	it "conjugates 'take' as 'took'" do
		expect( "take".en.past_tense ).to eq( 'took' )
	end

	it "conjugates 'teach' as 'taught'" do
		expect( "teach".en.past_tense ).to eq( 'taught' )
	end

	it "conjugates 'tear' as 'tore'" do
		expect( "tear".en.past_tense ).to eq( 'tore' )
	end

	it "conjugates 'telecast' as 'telecast'" do
		expect( "telecast".en.past_tense ).to eq( 'telecast' )
	end

	it "conjugates 'tell' as 'told'" do
		expect( "tell".en.past_tense ).to eq( 'told' )
	end

	it "conjugates 'test-drive' as 'test-drove'" do
		expect( "test-drive".en.past_tense ).to eq( 'test-drove' )
	end

	it "conjugates 'test-drive' in first person as 'test-drove'" do
		expect( "test-drive".en.past_tense( :first_person ) ).to eq( 'test-drove' )
	end

	it "conjugates 'test-drive' in third person as 'test-drove'" do
		expect( "test-drive".en.past_tense( :third_person ) ).to eq( 'test-drove' )
	end

	it "conjugates 'test-fly' as 'test-flew'" do
		expect( "test-fly".en.past_tense ).to eq( 'test-flew' )
	end

	it "conjugates 'test-fly' in first person as 'test-flew'" do
		expect( "test-fly".en.past_tense( :first_person ) ).to eq( 'test-flew' )
	end

	it "conjugates 'test-fly' in third person as 'test-flew'" do
		expect( "test-fly".en.past_tense( :third_person ) ).to eq( 'test-flew' )
	end

	it "conjugates 'testdrive' as 'testdrove'" do
		expect( "testdrive".en.past_tense ).to eq( 'testdrove' )
	end

	it "conjugates 'testfly' as 'testflew'" do
		expect( "testfly".en.past_tense ).to eq( 'testflew' )
	end

	it "conjugates 'think' as 'thought'" do
		expect( "think".en.past_tense ).to eq( 'thought' )
	end

	it "conjugates 'thring' as 'throng'" do
		expect( "thring".en.past_tense ).to eq( 'throng' )
	end

	it "conjugates 'throw' as 'threw'" do
		expect( "throw".en.past_tense ).to eq( 'threw' )
	end

	it "conjugates 'thrust' as 'thrust'" do
		expect( "thrust".en.past_tense ).to eq( 'thrust' )
	end

	it "conjugates 'trail-off' as 'trailed-off'" do
		expect( "trail-off".en.past_tense ).to eq( 'trailed-off' )
	end

	it "conjugates 'trail-off' in first person as 'trailed-off'" do
		expect( "trail-off".en.past_tense( :first_person ) ).to eq( 'trailed-off' )
	end

	it "conjugates 'trail-off' in third person as 'trailed-off'" do
		expect( "trail-off".en.past_tense( :third_person ) ).to eq( 'trailed-off' )
	end

	it "conjugates 'tread' as 'trod'" do
		expect( "tread".en.past_tense ).to eq( 'trod' )
	end

	it "conjugates 'troubleshoot' as 'troubleshot'" do
		expect( "troubleshoot".en.past_tense ).to eq( 'troubleshot' )
	end

	it "conjugates 'try' as 'tried'" do
		expect( "try".en.past_tense ).to eq( 'tried' )
	end

	it "conjugates 'typecast' as 'typecast'" do
		expect( "typecast".en.past_tense ).to eq( 'typecast' )
	end

	it "conjugates 'typewrite' as 'typewrote'" do
		expect( "typewrite".en.past_tense ).to eq( 'typewrote' )
	end

	it "conjugates 'under-write' as 'under-wrote'" do
		expect( "under-write".en.past_tense ).to eq( 'under-wrote' )
	end

	it "conjugates 'under-write' in first person as 'under-wrote'" do
		expect( "under-write".en.past_tense( :first_person ) ).to eq( 'under-wrote' )
	end

	it "conjugates 'under-write' in third person as 'under-wrote'" do
		expect( "under-write".en.past_tense( :third_person ) ).to eq( 'under-wrote' )
	end

	it "conjugates 'underbid' as 'underbid'" do
		expect( "underbid".en.past_tense ).to eq( 'underbid' )
	end

	it "conjugates 'underbuy' as 'underbought'" do
		expect( "underbuy".en.past_tense ).to eq( 'underbought' )
	end

	it "conjugates 'undercut' as 'undercut'" do
		expect( "undercut".en.past_tense ).to eq( 'undercut' )
	end

	it "conjugates 'underfeed' as 'underfed'" do
		expect( "underfeed".en.past_tense ).to eq( 'underfed' )
	end

	it "conjugates 'undergo' as 'underwent'" do
		expect( "undergo".en.past_tense ).to eq( 'underwent' )
	end

	it "conjugates 'underrun' as 'underran'" do
		expect( "underrun".en.past_tense ).to eq( 'underran' )
	end

	it "conjugates 'undersell' as 'undersold'" do
		expect( "undersell".en.past_tense ).to eq( 'undersold' )
	end

	it "conjugates 'undershoot' as 'undershot'" do
		expect( "undershoot".en.past_tense ).to eq( 'undershot' )
	end

	it "conjugates 'underspend' as 'underspent'" do
		expect( "underspend".en.past_tense ).to eq( 'underspent' )
	end

	it "conjugates 'understand' as 'understood'" do
		expect( "understand".en.past_tense ).to eq( 'understood' )
	end

	it "conjugates 'undertake' as 'undertook'" do
		expect( "undertake".en.past_tense ).to eq( 'undertook' )
	end

	it "conjugates 'underthrust' as 'underthrust'" do
		expect( "underthrust".en.past_tense ).to eq( 'underthrust' )
	end

	it "conjugates 'underwrite' as 'underwrote'" do
		expect( "underwrite".en.past_tense ).to eq( 'underwrote' )
	end

	it "conjugates 'undo' as 'undid'" do
		expect( "undo".en.past_tense ).to eq( 'undid' )
	end

	it "conjugates 'undraw' as 'undrew'" do
		expect( "undraw".en.past_tense ).to eq( 'undrew' )
	end

	it "conjugates 'unfreeze' as 'unfroze'" do
		expect( "unfreeze".en.past_tense ).to eq( 'unfroze' )
	end

	it "conjugates 'unhang' as 'unhung'" do
		expect( "unhang".en.past_tense ).to eq( 'unhung' )
	end

	it "conjugates 'unhide' as 'unhid'" do
		expect( "unhide".en.past_tense ).to eq( 'unhid' )
	end

	it "conjugates 'unhold' as 'unheld'" do
		expect( "unhold".en.past_tense ).to eq( 'unheld' )
	end

	it "conjugates 'unknit' as 'unknitted'" do
		expect( "unknit".en.past_tense ).to eq( 'unknitted' )
	end

	it "conjugates 'unlay' as 'unlaid'" do
		expect( "unlay".en.past_tense ).to eq( 'unlaid' )
	end

	it "conjugates 'unmake' as 'unmade'" do
		expect( "unmake".en.past_tense ).to eq( 'unmade' )
	end

	it "conjugates 'unsay' as 'unsaid'" do
		expect( "unsay".en.past_tense ).to eq( 'unsaid' )
	end

	it "conjugates 'unsew' as 'unsewed'" do
		expect( "unsew".en.past_tense ).to eq( 'unsewed' )
	end

	it "conjugates 'unsling' as 'unslung'" do
		expect( "unsling".en.past_tense ).to eq( 'unslung' )
	end

	it "conjugates 'unspin' as 'unspun'" do
		expect( "unspin".en.past_tense ).to eq( 'unspun' )
	end

	it "conjugates 'unstick' as 'unstuck'" do
		expect( "unstick".en.past_tense ).to eq( 'unstuck' )
	end

	it "conjugates 'unstring' as 'unstrung'" do
		expect( "unstring".en.past_tense ).to eq( 'unstrung' )
	end

	it "conjugates 'unswear' as 'unswore'" do
		expect( "unswear".en.past_tense ).to eq( 'unswore' )
	end

	it "conjugates 'unteach' as 'untaught'" do
		expect( "unteach".en.past_tense ).to eq( 'untaught' )
	end

	it "conjugates 'unthink' as 'unthought'" do
		expect( "unthink".en.past_tense ).to eq( 'unthought' )
	end

	it "conjugates 'unweave' as 'unwove'" do
		expect( "unweave".en.past_tense ).to eq( 'unwove' )
	end

	it "conjugates 'unwind' as 'unwound'" do
		expect( "unwind".en.past_tense ).to eq( 'unwound' )
	end

	it "conjugates 'unwrite' as 'unwrote'" do
		expect( "unwrite".en.past_tense ).to eq( 'unwrote' )
	end

	it "conjugates 'uphold' as 'upheld'" do
		expect( "uphold".en.past_tense ).to eq( 'upheld' )
	end

	it "conjugates 'upset' as 'upset'" do
		expect( "upset".en.past_tense ).to eq( 'upset' )
	end

	it "conjugates 'use-up' as 'used-up'" do
		expect( "use-up".en.past_tense ).to eq( 'used-up' )
	end

	it "conjugates 'use-up' in first person as 'used-up'" do
		expect( "use-up".en.past_tense( :first_person ) ).to eq( 'used-up' )
	end

	it "conjugates 'use-up' in third person as 'used-up'" do
		expect( "use-up".en.past_tense( :third_person ) ).to eq( 'used-up' )
	end

	it "conjugates 'wake' as 'woke'" do
		expect( "wake".en.past_tense ).to eq( 'woke' )
	end

	it "conjugates 'waylay' as 'waylaid'" do
		expect( "waylay".en.past_tense ).to eq( 'waylaid' )
	end

	it "conjugates 'wear' as 'wore'" do
		expect( "wear".en.past_tense ).to eq( 'wore' )
	end

	it "conjugates 'weave' as 'wove'" do
		expect( "weave".en.past_tense ).to eq( 'wove' )
	end

	it "conjugates 'wed' as 'wed'" do
		expect( "wed".en.past_tense ).to eq( 'wed' )
	end

	it "conjugates 'weep' as 'wept'" do
		expect( "weep".en.past_tense ).to eq( 'wept' )
	end

	it "conjugates 'welcome' as 'welcomed'" do
		expect( "welcome".en.past_tense ).to eq( 'welcomed' )
	end

	it "conjugates 'wet' as 'wet'" do
		expect( "wet".en.past_tense ).to eq( 'wet' )
	end

	it "conjugates 'win' as 'won'" do
		expect( "win".en.past_tense ).to eq( 'won' )
	end

	it "conjugates 'wind' as 'wound'" do
		expect( "wind".en.past_tense ).to eq( 'wound' )
	end

	it "conjugates 'withdraw' as 'withdrew'" do
		expect( "withdraw".en.past_tense ).to eq( 'withdrew' )
	end

	it "conjugates 'withhold' as 'withheld'" do
		expect( "withhold".en.past_tense ).to eq( 'withheld' )
	end

	it "conjugates 'withstand' as 'withstood'" do
		expect( "withstand".en.past_tense ).to eq( 'withstood' )
	end

	it "conjugates 'wring' as 'wrung'" do
		expect( "wring".en.past_tense ).to eq( 'wrung' )
	end

	it "conjugates 'write' as 'wrote'" do
		expect( "write".en.past_tense ).to eq( 'wrote' )
	end

	it "conjugates 'take' as 'taking'" do
		expect( "take".en.present_participle ).to eq( 'taking' )
	end

	it "conjugates 'die' as 'dying'" do
		expect( "die".en.present_participle ).to eq( 'dying' )
	end

end

