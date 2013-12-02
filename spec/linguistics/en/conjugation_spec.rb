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
require 'linguistics/en/conjugation'


describe Linguistics::EN::Conjugation do

	before( :all ) do
		setup_logging( :fatal )
		Linguistics.use( :en )
	end

	after( :all ) do
		reset_logging()
	end


	it "adds EN::Conjugation to the list of English language modules" do
		Linguistics::EN.should have_extension( :conjugation )
	end

	context "documentation examples" do

		it 'conjugates "run".en.past_tense as "ran"' do
			"run".en.past_tense.should == "ran"
		end

		it 'conjugates "run".en.past_participle as "run"' do
			"run".en.past_participle.should == "run"
		end

		it 'conjugates "run".en.present_tense as "run"' do
			"run".en.present_tense.should == "run"
		end

		it 'conjugates "run".en.present_participle as "running"' do
			"run".en.present_participle.should == "running"
		end

		it '"be".en.conjugate( :present, :third_person_singular ) should return "is"' do
			"be".en.conjugate( :present, :third_person_singular ).should == "is"
		end

		it '"be".en.conjugate( :present, :first_person_singular ) should return "am"' do
			"be".en.conjugate( :present, :first_person_singular ).should == "am"
		end

		it '"be".en.conjugate( :past, :first_person_singular ) should return "was"' do
			"be".en.conjugate( :past, :first_person_singular ).should == "was"
		end

	end

	it "conjugates 'arise' as 'arose'" do
		"arise".en.past_tense.should == 'arose'
	end

	it "conjugates 'awake' as 'awoke'" do
		"awake".en.past_tense.should == 'awoke'
	end

	it "conjugates 'backbite' as 'backbit'" do
		"backbite".en.past_tense.should == 'backbit'
	end

	it "conjugates 'backslide' as 'backslid'" do
		"backslide".en.past_tense.should == 'backslid'
	end

	it "conjugates 'be' as 'was' in third person singular" do
		"be".en.past_tense( :third_person_singular ).should == 'was'
	end

	it "conjugates 'be' as 'were'" do
		"be".en.past_tense.should == 'were'
	end

	it "conjugates 'be' in first person singular as 'was'" do
		pending "figuring out how this is supposed to work" do
			"be".en.past_tense( :first_person ).should == 'was'
		end
	end

	it "conjugates 'be' in third person singular as 'were'" do
		"be".en.past_tense( :third_person ).should == 'were'
	end

	it "conjugates 'bear' as 'bore'" do
		"bear".en.past_tense.should == 'bore'
	end

	it "conjugates 'beat' as 'beat'" do
		"beat".en.past_tense.should == 'beat'
	end

	it "conjugates 'become' as 'became'" do
		"become".en.past_tense.should == 'became'
	end

	it "conjugates 'befall' as 'befell'" do
		"befall".en.past_tense.should == 'befell'
	end

	it "conjugates 'beget' as 'begat'" do
		"beget".en.past_tense.should == 'begat'
	end

	it "conjugates 'begin' as 'began'" do
		"begin".en.past_tense.should == 'began'
	end

	it "conjugates 'bend' as 'bent'" do
		"bend".en.past_tense.should == 'bent'
	end

	it "conjugates 'beset' as 'beset'" do
		"beset".en.past_tense.should == 'beset'
	end

	it "conjugates 'bet' as 'bet'" do
		"bet".en.past_tense.should == 'bet'
	end

	it "conjugates 'betake' as 'betook'" do
		"betake".en.past_tense.should == 'betook'
	end

	it "conjugates 'bethink' as 'bethought'" do
		"bethink".en.past_tense.should == 'bethought'
	end

	it "conjugates 'bid' as 'bade'" do
		pending "figuring out how this is supposed to work" do
			"bid".en.past_tense.should == 'bade'
		end
	end

	it "conjugates 'bid' in first person as 'bade'" do
		pending "figuring out how pipe-delimited conjugations are supposed to work" do
			"bid".en.past_tense( :first_person ).should == 'bade'
		end
	end

	it "conjugates 'bid' in third person as 'bade'" do
		pending "figuring out how this is supposed to work" do
			"bid".en.past_tense( :third_person ).should == 'bade'
		end
	end

	it "conjugates 'bind' as 'bound'" do
		"bind".en.past_tense.should == 'bound'
	end

	it "conjugates 'bite' as 'bit'" do
		"bite".en.past_tense.should == 'bit'
	end

	it "conjugates 'bleed' as 'bled'" do
		"bleed".en.past_tense.should == 'bled'
	end

	it "conjugates 'blow' as 'blew'" do
		"blow".en.past_tense.should == 'blew'
	end

	it "conjugates 'break' as 'broke'" do
		"break".en.past_tense.should == 'broke'
	end

	it "conjugates 'breed' as 'bred'" do
		"breed".en.past_tense.should == 'bred'
	end

	it "conjugates 'bring' as 'brought'" do
		"bring".en.past_tense.should == 'brought'
	end

	it "conjugates 'broadcast' as 'broadcast'" do
		"broadcast".en.past_tense.should == 'broadcast'
	end

	it "conjugates 'browbeat' as 'browbeat'" do
		"browbeat".en.past_tense.should == 'browbeat'
	end

	it "conjugates 'build' as 'built'" do
		"build".en.past_tense.should == 'built'
	end

	it "conjugates 'build-up' as 'built-up'" do
		"build-up".en.past_tense.should == 'built-up'
	end

	it "conjugates 'build-up' in first person as 'built-up'" do
		"build-up".en.past_tense( :first_person ).should == 'built-up'
	end

	it "conjugates 'build-up' in third person as 'built-up'" do
		"build-up".en.past_tense( :third_person ).should == 'built-up'
	end

	it "conjugates 'burst' as 'burst'" do
		"burst".en.past_tense.should == 'burst'
	end

	it "conjugates 'buy' as 'bought'" do
		"buy".en.past_tense.should == 'bought'
	end

	it "conjugates 'carry-out' as 'carried-out'" do
		"carry-out".en.past_tense.should == 'carried-out'
	end

	it "conjugates 'carry-out' in first person as 'carried-out'" do
		"carry-out".en.past_tense( :first_person ).should == 'carried-out'
	end

	it "conjugates 'carry-out' in third person as 'carried-out'" do
		"carry-out".en.past_tense( :third_person ).should == 'carried-out'
	end

	it "conjugates 'cast' as 'cast'" do
		"cast".en.past_tense.should == 'cast'
	end

	it "conjugates 'catch' as 'caught'" do
		"catch".en.past_tense.should == 'caught'
	end

	it "conjugates 'choose' as 'chose'" do
		"choose".en.past_tense.should == 'chose'
	end

	it "conjugates 'cling' as 'clung'" do
		"cling".en.past_tense.should == 'clung'
	end

	it "conjugates 'colorbreed' as 'colorbred'" do
		"colorbreed".en.past_tense.should == 'colorbred'
	end

	it "conjugates 'come' as 'came'" do
		"come".en.past_tense.should == 'came'
	end

	it "conjugates 'cost' as 'cost'" do
		"cost".en.past_tense.should == 'cost'
	end

	it "conjugates 'creep' as 'crept'" do
		"creep".en.past_tense.should == 'crept'
	end

	it "conjugates 'crossbreed' as 'crossbred'" do
		"crossbreed".en.past_tense.should == 'crossbred'
	end

	it "conjugates 'cut' as 'cut'" do
		"cut".en.past_tense.should == 'cut'
	end

	it "conjugates 'deal' as 'dealt'" do
		"deal".en.past_tense.should == 'dealt'
	end

	it "conjugates 'dig' as 'dug'" do
		"dig".en.past_tense.should == 'dug'
	end

	it "conjugates 'dive' as 'dove'" do
		"dive".en.past_tense.should == 'dove'
	end

	it "conjugates 'do' as 'did'" do
		"do".en.past_tense.should == 'did'
	end

	it "conjugates 'draw' as 'drew'" do
		"draw".en.past_tense.should == 'drew'
	end

	it "conjugates 'drink' as 'drank'" do
		"drink".en.past_tense.should == 'drank'
	end

	it "conjugates 'drive' as 'drove'" do
		"drive".en.past_tense.should == 'drove'
	end

	it "conjugates 'eat' as 'ate'" do
		"eat".en.past_tense.should == 'ate'
	end

	it "conjugates 'enwind' as 'enwound'" do
		"enwind".en.past_tense.should == 'enwound'
	end

	it "conjugates 'fall' as 'fell'" do
		"fall".en.past_tense.should == 'fell'
	end

	it "conjugates 'fast-wind' as 'fast-wound'" do
		"fast-wind".en.past_tense.should == 'fast-wound'
	end

	it "conjugates 'fast-wind' in first person as 'fast-wound'" do
		"fast-wind".en.past_tense( :first_person ).should == 'fast-wound'
	end

	it "conjugates 'fast-wind' in third person as 'fast-wound'" do
		"fast-wind".en.past_tense( :third_person ).should == 'fast-wound'
	end

	it "conjugates 'feed' as 'fed'" do
		"feed".en.past_tense.should == 'fed'
	end

	it "conjugates 'feel' as 'felt'" do
		"feel".en.past_tense.should == 'felt'
	end

	it "conjugates 'fight' as 'fought'" do
		"fight".en.past_tense.should == 'fought'
	end

	it "conjugates 'find' as 'found'" do
		"find".en.past_tense.should == 'found'
	end

	it "conjugates 'fit' as 'fit'" do
		"fit".en.past_tense.should == 'fit'
	end

	it "conjugates 'fit-out' as 'fitted-out'" do
		"fit-out".en.past_tense.should == 'fitted-out'
	end

	it "conjugates 'fit-out' in first person as 'fitted-out'" do
		"fit-out".en.past_tense( :first_person ).should == 'fitted-out'
	end

	it "conjugates 'fit-out' in third person as 'fitted-out'" do
		"fit-out".en.past_tense( :third_person ).should == 'fitted-out'
	end

	it "conjugates 'flee' as 'fled'" do
		"flee".en.past_tense.should == 'fled'
	end

	it "conjugates 'fling' as 'flung'" do
		"fling".en.past_tense.should == 'flung'
	end

	it "conjugates 'fly' as 'flew'" do
		"fly".en.past_tense.should == 'flew'
	end

	it "conjugates 'forbear' as 'forbore'" do
		"forbear".en.past_tense.should == 'forbore'
	end

	it "conjugates 'forbid' as 'forbade'" do
		"forbid".en.past_tense.should == 'forbade'
	end

	it "conjugates 'forecast' as 'forecast'" do
		"forecast".en.past_tense.should == 'forecast'
	end

	it "conjugates 'forego' as 'forewent'" do
		"forego".en.past_tense.should == 'forewent'
	end

	it "conjugates 'foreknow' as 'foreknew'" do
		"foreknow".en.past_tense.should == 'foreknew'
	end

	it "conjugates 'forerun' as 'foreran'" do
		"forerun".en.past_tense.should == 'foreran'
	end

	it "conjugates 'forespeak' as 'forespoke'" do
		"forespeak".en.past_tense.should == 'forespoke'
	end

	it "conjugates 'foreswear' as 'foreswore'" do
		"foreswear".en.past_tense.should == 'foreswore'
	end

	it "conjugates 'foretell' as 'foretold'" do
		"foretell".en.past_tense.should == 'foretold'
	end

	it "conjugates 'forget' as 'forgot'" do
		"forget".en.past_tense.should == 'forgot'
	end

	it "conjugates 'forgive' as 'forgave'" do
		"forgive".en.past_tense.should == 'forgave'
	end

	it "conjugates 'forsake' as 'forsook'" do
		"forsake".en.past_tense.should == 'forsook'
	end

	it "conjugates 'forsee' as 'forsaw'" do
		"forsee".en.past_tense.should == 'forsaw'
	end

	it "conjugates 'freeze' as 'froze'" do
		"freeze".en.past_tense.should == 'froze'
	end

	it "conjugates 'gainsay' as 'gainsaid'" do
		"gainsay".en.past_tense.should == 'gainsaid'
	end

	it "conjugates 'get' as 'got'" do
		"get".en.past_tense.should == 'got'
	end

	it "conjugates 'give' as 'gave'" do
		"give".en.past_tense.should == 'gave'
	end

	it "conjugates 'go' as 'went'" do
		"go".en.past_tense.should == 'went'
	end

	it "conjugates 'grind' as 'ground'" do
		"grind".en.past_tense.should == 'ground'
	end

	it "conjugates 'grow' as 'grew'" do
		"grow".en.past_tense.should == 'grew'
	end

	it "conjugates 'hagride' as 'hagrode'" do
		"hagride".en.past_tense.should == 'hagrode'
	end

	it "conjugates 'half-rise' as 'half-rose'" do
		"half-rise".en.past_tense.should == 'half-rose'
	end

	it "conjugates 'half-rise' in first person as 'half-rose'" do
		"half-rise".en.past_tense( :first_person ).should == 'half-rose'
	end

	it "conjugates 'half-rise' in third person as 'half-rose'" do
		"half-rise".en.past_tense( :third_person ).should == 'half-rose'
	end

	it "conjugates 'halterbreak' as 'halterbroke'" do
		"halterbreak".en.past_tense.should == 'halterbroke'
	end

	it "conjugates 'hamstring' as 'hamstrung'" do
		"hamstring".en.past_tense.should == 'hamstrung'
	end

	it "conjugates 'hand-feed' as 'hand-fed'" do
		"hand-feed".en.past_tense.should == 'hand-fed'
	end

	it "conjugates 'hand-feed' in first person as 'hand-fed'" do
		"hand-feed".en.past_tense( :first_person ).should == 'hand-fed'
	end

	it "conjugates 'hand-feed' in third person as 'hand-fed'" do
		"hand-feed".en.past_tense( :third_person ).should == 'hand-fed'
	end

	it "conjugates 'handwrite' as 'handwrote'" do
		"handwrite".en.past_tense.should == 'handwrote'
	end

	it "conjugates 'hang' as 'hung'" do
		pending "figuring out how this is supposed to work" do
			"hang".en.past_tense.should == 'hung'
		end
	end

	it "conjugates 'hang' in first person as 'hung'" do
		pending "figuring out how this is supposed to work" do
			"hang".en.past_tense( :first_person ).should == 'hung'
		end
	end

	it "conjugates 'hang' in third person as 'hung'" do
		pending "figuring out how this is supposed to work" do
			"hang".en.past_tense( :third_person ).should == 'hung'
		end
	end

	it "conjugates 'have' as 'had'" do
		"have".en.past_tense.should == 'had'
	end

	it "conjugates 'have' as 'had'" do
		"have".en.past_tense.should == 'had'
	end

	it "conjugates 'hear' as 'heard'" do
		"hear".en.past_tense.should == 'heard'
	end

	it "conjugates 'hide' as 'hid'" do
		"hide".en.past_tense.should == 'hid'
	end

	it "conjugates 'hit' as 'hit'" do
		"hit".en.past_tense.should == 'hit'
	end

	it "conjugates 'hold' as 'held'" do
		"hold".en.past_tense.should == 'held'
	end

	it "conjugates 'hurt' as 'hurt'" do
		"hurt".en.past_tense.should == 'hurt'
	end

	it "conjugates 'inbreed' as 'inbred'" do
		"inbreed".en.past_tense.should == 'inbred'
	end

	it "conjugates 'inbring' as 'inbrought'" do
		"inbring".en.past_tense.should == 'inbrought'
	end

	it "conjugates 'inlay' as 'inlaid'" do
		"inlay".en.past_tense.should == 'inlaid'
	end

	it "conjugates 'inset' as 'inset'" do
		"inset".en.past_tense.should == 'inset'
	end

	it "conjugates 'interbreed' as 'interbred'" do
		"interbreed".en.past_tense.should == 'interbred'
	end

	it "conjugates 'intercut' as 'intercut'" do
		"intercut".en.past_tense.should == 'intercut'
	end

	it "conjugates 'interlay' as 'interlaid'" do
		"interlay".en.past_tense.should == 'interlaid'
	end

	it "conjugates 'interset' as 'interset'" do
		"interset".en.past_tense.should == 'interset'
	end

	it "conjugates 'interweave' as 'interwove'" do
		"interweave".en.past_tense.should == 'interwove'
	end

	it "conjugates 'interwind' as 'interwound'" do
		"interwind".en.past_tense.should == 'interwound'
	end

	it "conjugates 'inweave' as 'inwove'" do
		"inweave".en.past_tense.should == 'inwove'
	end

	it "conjugates 'jerry-build' as 'jerry-built'" do
		"jerry-build".en.past_tense.should == 'jerry-built'
	end

	it "conjugates 'jerry-build' in first person as 'jerry-built'" do
		"jerry-build".en.past_tense( :first_person ).should == 'jerry-built'
	end

	it "conjugates 'jerry-build' in third person as 'jerry-built'" do
		"jerry-build".en.past_tense( :third_person ).should == 'jerry-built'
	end

	it "conjugates 'keep' as 'kept'" do
		"keep".en.past_tense.should == 'kept'
	end

	it "conjugates 'kick-off' as 'kicked-off'" do
		"kick-off".en.past_tense.should == 'kicked-off'
	end

	it "conjugates 'kick-off' in first person as 'kicked-off'" do
		"kick-off".en.past_tense( :first_person ).should == 'kicked-off'
	end

	it "conjugates 'kick-off' in third person as 'kicked-off'" do
		"kick-off".en.past_tense( :third_person ).should == 'kicked-off'
	end

	it "conjugates 'kneel' as 'knelt'" do
		"kneel".en.past_tense.should == 'knelt'
	end

	it "conjugates 'knit' as 'knitted'" do
		"knit".en.past_tense.should == 'knitted'
	end

	it "conjugates 'know' as 'knew'" do
		"know".en.past_tense.should == 'knew'
	end

	it "conjugates 'landslide' as 'landslid'" do
		"landslide".en.past_tense.should == 'landslid'
	end

	it "conjugates 'lay' as 'laid'" do
		"lay".en.past_tense.should == 'laid'
	end

	it "conjugates 'lead' as 'led'" do
		"lead".en.past_tense.should == 'led'
	end

	it "conjugates 'leave' as 'left'" do
		"leave".en.past_tense.should == 'left'
	end

	it "conjugates 'lend' as 'lent'" do
		"lend".en.past_tense.should == 'lent'
	end

	it "conjugates 'let' as 'let'" do
		"let".en.past_tense.should == 'let'
	end

	it "conjugates 'lie' as 'lay'" do
		pending "figuring out how this is supposed to work" do
			"lie".en.past_tense.should == 'lay'
		end
	end

	it "conjugates 'lie' in first person as 'lay'" do
		pending "figuring out how this is supposed to work" do
			"lie".en.past_tense( :first_person ).should == 'lay'
		end
	end

	it "conjugates 'lie' in third person as 'lay'" do
		pending "figuring out how this is supposed to work" do
			"lie".en.past_tense( :third_person ).should == 'lay'
		end
	end

	it "conjugates 'light' as 'lit'" do
		"light".en.past_tense.should == 'lit'
	end

	it "conjugates 'light-up' as 'lit-up'" do
		"light-up".en.past_tense.should == 'lit-up'
	end

	it "conjugates 'light-up' in first person as 'lit-up'" do
		"light-up".en.past_tense( :first_person ).should == 'lit-up'
	end

	it "conjugates 'light-up' in third person as 'lit-up'" do
		"light-up".en.past_tense( :third_person ).should == 'lit-up'
	end

	it "conjugates 'lip-read' as 'lip-read'" do
		"lip-read".en.past_tense.should == 'lip-read'
	end

	it "conjugates 'lip-read' in first person as 'lip-read'" do
		"lip-read".en.past_tense( :first_person ).should == 'lip-read'
	end

	it "conjugates 'lip-read' in third person as 'lip-read'" do
		"lip-read".en.past_tense( :third_person ).should == 'lip-read'
	end

	it "conjugates 'loop-up' as 'looped-up'" do
		"loop-up".en.past_tense.should == 'looped-up'
	end

	it "conjugates 'loop-up' in first person as 'looped-up'" do
		"loop-up".en.past_tense( :first_person ).should == 'looped-up'
	end

	it "conjugates 'loop-up' in third person as 'looped-up'" do
		"loop-up".en.past_tense( :third_person ).should == 'looped-up'
	end

	it "conjugates 'lose' as 'lost'" do
		"lose".en.past_tense.should == 'lost'
	end

	it "conjugates 'make' as 'made'" do
		"make".en.past_tense.should == 'made'
	end

	it "conjugates 'make-out' as 'made-out'" do
		"make-out".en.past_tense.should == 'made-out'
	end

	it "conjugates 'make-out' in first person as 'made-out'" do
		"make-out".en.past_tense( :first_person ).should == 'made-out'
	end

	it "conjugates 'make-out' in third person as 'made-out'" do
		"make-out".en.past_tense( :third_person ).should == 'made-out'
	end

	it "conjugates 'mean' as 'meant'" do
		"mean".en.past_tense.should == 'meant'
	end

	it "conjugates 'meet' as 'met'" do
		"meet".en.past_tense.should == 'met'
	end

	it "conjugates 'misbecome' as 'misbecame'" do
		"misbecome".en.past_tense.should == 'misbecame'
	end

	it "conjugates 'miscast' as 'miscast'" do
		"miscast".en.past_tense.should == 'miscast'
	end

	it "conjugates 'miscut' as 'miscut'" do
		"miscut".en.past_tense.should == 'miscut'
	end

	it "conjugates 'misdeal' as 'misdealt'" do
		"misdeal".en.past_tense.should == 'misdealt'
	end

	it "conjugates 'misdo' as 'misdid'" do
		"misdo".en.past_tense.should == 'misdid'
	end

	it "conjugates 'mishear' as 'misheard'" do
		"mishear".en.past_tense.should == 'misheard'
	end

	it "conjugates 'mishit' as 'mishit'" do
		"mishit".en.past_tense.should == 'mishit'
	end

	it "conjugates 'mislay' as 'mislaid'" do
		"mislay".en.past_tense.should == 'mislaid'
	end

	it "conjugates 'mislead' as 'misled'" do
		"mislead".en.past_tense.should == 'misled'
	end

	it "conjugates 'misread' as 'misread'" do
		"misread".en.past_tense.should == 'misread'
	end

	it "conjugates 'missay' as 'missaid'" do
		"missay".en.past_tense.should == 'missaid'
	end

	it "conjugates 'missend' as 'missent'" do
		"missend".en.past_tense.should == 'missent'
	end

	it "conjugates 'misspeak' as 'misspoke'" do
		"misspeak".en.past_tense.should == 'misspoke'
	end

	it "conjugates 'misspend' as 'misspent'" do
		"misspend".en.past_tense.should == 'misspent'
	end

	it "conjugates 'misswear' as 'misswore'" do
		"misswear".en.past_tense.should == 'misswore'
	end

	it "conjugates 'mistake' as 'mistook'" do
		"mistake".en.past_tense.should == 'mistook'
	end

	it "conjugates 'misteach' as 'mistaught'" do
		"misteach".en.past_tense.should == 'mistaught'
	end

	it "conjugates 'mistell' as 'mistold'" do
		"mistell".en.past_tense.should == 'mistold'
	end

	it "conjugates 'misthink' as 'misthought'" do
		"misthink".en.past_tense.should == 'misthought'
	end

	it "conjugates 'misunderstand' as 'misunderstood'" do
		"misunderstand".en.past_tense.should == 'misunderstood'
	end

	it "conjugates 'miswear' as 'miswore'" do
		"miswear".en.past_tense.should == 'miswore'
	end

	it "conjugates 'miswed' as 'miswed'" do
		"miswed".en.past_tense.should == 'miswed'
	end

	it "conjugates 'miswrite' as 'miswrote'" do
		"miswrite".en.past_tense.should == 'miswrote'
	end

	it "conjugates 'offset' as 'offset'" do
		"offset".en.past_tense.should == 'offset'
	end

	it "conjugates 'outbid' as 'outbid'" do
		"outbid".en.past_tense.should == 'outbid'
	end

	it "conjugates 'outbreed' as 'outbred'" do
		"outbreed".en.past_tense.should == 'outbred'
	end

	it "conjugates 'outdo' as 'outdid'" do
		"outdo".en.past_tense.should == 'outdid'
	end

	it "conjugates 'outdraw' as 'outdrew'" do
		"outdraw".en.past_tense.should == 'outdrew'
	end

	it "conjugates 'outdrink' as 'outdrank'" do
		"outdrink".en.past_tense.should == 'outdrank'
	end

	it "conjugates 'outdrive' as 'outdrove'" do
		"outdrive".en.past_tense.should == 'outdrove'
	end

	it "conjugates 'outfight' as 'outfought'" do
		"outfight".en.past_tense.should == 'outfought'
	end

	it "conjugates 'outfly' as 'outflew'" do
		"outfly".en.past_tense.should == 'outflew'
	end

	it "conjugates 'outgrow' as 'outgrew'" do
		"outgrow".en.past_tense.should == 'outgrew'
	end

	it "conjugates 'outlay' as 'outlaid'" do
		"outlay".en.past_tense.should == 'outlaid'
	end

	it "conjugates 'outride' as 'outrode'" do
		"outride".en.past_tense.should == 'outrode'
	end

	it "conjugates 'outrun' as 'outran'" do
		"outrun".en.past_tense.should == 'outran'
	end

	it "conjugates 'outsee' as 'outsaw'" do
		"outsee".en.past_tense.should == 'outsaw'
	end

	it "conjugates 'outsell' as 'outsold'" do
		"outsell".en.past_tense.should == 'outsold'
	end

	it "conjugates 'outshoot' as 'outshot'" do
		"outshoot".en.past_tense.should == 'outshot'
	end

	it "conjugates 'outsing' as 'outsang'" do
		"outsing".en.past_tense.should == 'outsang'
	end

	it "conjugates 'outsit' as 'outsat'" do
		"outsit".en.past_tense.should == 'outsat'
	end

	it "conjugates 'outsleep' as 'outslept'" do
		"outsleep".en.past_tense.should == 'outslept'
	end

	it "conjugates 'outspeak' as 'outspoke'" do
		"outspeak".en.past_tense.should == 'outspoke'
	end

	it "conjugates 'outspeed' as 'outsped'" do
		"outspeed".en.past_tense.should == 'outsped'
	end

	it "conjugates 'outspend' as 'outspent'" do
		"outspend".en.past_tense.should == 'outspent'
	end

	it "conjugates 'outspin' as 'outspun'" do
		"outspin".en.past_tense.should == 'outspun'
	end

	it "conjugates 'outspring' as 'outsprang'" do
		"outspring".en.past_tense.should == 'outsprang'
	end

	it "conjugates 'outstand' as 'outstood'" do
		"outstand".en.past_tense.should == 'outstood'
	end

	it "conjugates 'outswear' as 'outswore'" do
		"outswear".en.past_tense.should == 'outswore'
	end

	it "conjugates 'outswim' as 'outswam'" do
		"outswim".en.past_tense.should == 'outswam'
	end

	it "conjugates 'outtell' as 'outtold'" do
		"outtell".en.past_tense.should == 'outtold'
	end

	it "conjugates 'outthink' as 'outthought'" do
		"outthink".en.past_tense.should == 'outthought'
	end

	it "conjugates 'outthrow' as 'outthrew'" do
		"outthrow".en.past_tense.should == 'outthrew'
	end

	it "conjugates 'outwear' as 'outwore'" do
		"outwear".en.past_tense.should == 'outwore'
	end

	it "conjugates 'outwind' as 'outwound'" do
		"outwind".en.past_tense.should == 'outwound'
	end

	it "conjugates 'outwrite' as 'outwrote'" do
		"outwrite".en.past_tense.should == 'outwrote'
	end

	it "conjugates 'overbear' as 'overbore'" do
		"overbear".en.past_tense.should == 'overbore'
	end

	it "conjugates 'overbid' as 'overbid'" do
		"overbid".en.past_tense.should == 'overbid'
	end

	it "conjugates 'overbreed' as 'overbred'" do
		"overbreed".en.past_tense.should == 'overbred'
	end

	it "conjugates 'overbuild' as 'overbuilt'" do
		"overbuild".en.past_tense.should == 'overbuilt'
	end

	it "conjugates 'overbuy' as 'overbought'" do
		"overbuy".en.past_tense.should == 'overbought'
	end

	it "conjugates 'overcast' as 'overcast'" do
		"overcast".en.past_tense.should == 'overcast'
	end

	it "conjugates 'overcome' as 'overcame'" do
		"overcome".en.past_tense.should == 'overcame'
	end

	it "conjugates 'overcut' as 'overcut'" do
		"overcut".en.past_tense.should == 'overcut'
	end

	it "conjugates 'overdo' as 'overdid'" do
		"overdo".en.past_tense.should == 'overdid'
	end

	it "conjugates 'overdraw' as 'overdrew'" do
		"overdraw".en.past_tense.should == 'overdrew'
	end

	it "conjugates 'overdrink' as 'overdrank'" do
		"overdrink".en.past_tense.should == 'overdrank'
	end

	it "conjugates 'overdrive' as 'overdrove'" do
		"overdrive".en.past_tense.should == 'overdrove'
	end

	it "conjugates 'overeat' as 'overate'" do
		"overeat".en.past_tense.should == 'overate'
	end

	it "conjugates 'overfeed' as 'overfed'" do
		"overfeed".en.past_tense.should == 'overfed'
	end

	it "conjugates 'overhang' as 'overhung'" do
		"overhang".en.past_tense.should == 'overhung'
	end

	it "conjugates 'overhear' as 'overheard'" do
		"overhear".en.past_tense.should == 'overheard'
	end

	it "conjugates 'overlay' as 'overlaid'" do
		"overlay".en.past_tense.should == 'overlaid'
	end

	it "conjugates 'overlie' as 'overlay'" do
		"overlie".en.past_tense.should == 'overlay'
	end

	it "conjugates 'overpay' as 'overpaid'" do
		"overpay".en.past_tense.should == 'overpaid'
	end

	it "conjugates 'override' as 'overrode'" do
		"override".en.past_tense.should == 'overrode'
	end

	it "conjugates 'overrun' as 'overran'" do
		"overrun".en.past_tense.should == 'overran'
	end

	it "conjugates 'oversee' as 'oversaw'" do
		"oversee".en.past_tense.should == 'oversaw'
	end

	it "conjugates 'oversell' as 'oversold'" do
		"oversell".en.past_tense.should == 'oversold'
	end

	it "conjugates 'overset' as 'overset'" do
		"overset".en.past_tense.should == 'overset'
	end

	it "conjugates 'overshoot' as 'overshot'" do
		"overshoot".en.past_tense.should == 'overshot'
	end

	it "conjugates 'oversleep' as 'overslept'" do
		"oversleep".en.past_tense.should == 'overslept'
	end

	it "conjugates 'overslide' as 'overslid'" do
		"overslide".en.past_tense.should == 'overslid'
	end

	it "conjugates 'oversling' as 'overslung'" do
		"oversling".en.past_tense.should == 'overslung'
	end

	it "conjugates 'overspeak' as 'overspoke'" do
		"overspeak".en.past_tense.should == 'overspoke'
	end

	it "conjugates 'overspeed' as 'oversped'" do
		"overspeed".en.past_tense.should == 'oversped'
	end

	it "conjugates 'overspend' as 'overspent'" do
		"overspend".en.past_tense.should == 'overspent'
	end

	it "conjugates 'overspin' as 'overspun'" do
		"overspin".en.past_tense.should == 'overspun'
	end

	it "conjugates 'overspread' as 'overspread'" do
		"overspread".en.past_tense.should == 'overspread'
	end

	it "conjugates 'overspring' as 'oversprang'" do
		"overspring".en.past_tense.should == 'oversprang'
	end

	it "conjugates 'overstand' as 'overstood'" do
		"overstand".en.past_tense.should == 'overstood'
	end

	it "conjugates 'overstride' as 'overstrode'" do
		"overstride".en.past_tense.should == 'overstrode'
	end

	it "conjugates 'overstrike' as 'overstruck'" do
		"overstrike".en.past_tense.should == 'overstruck'
	end

	it "conjugates 'overstring' as 'overstrung'" do
		"overstring".en.past_tense.should == 'overstrung'
	end

	it "conjugates 'overstrive' as 'overstrove'" do
		"overstrive".en.past_tense.should == 'overstrove'
	end

	it "conjugates 'overtake' as 'overtook'" do
		"overtake".en.past_tense.should == 'overtook'
	end

	it "conjugates 'overthink' as 'overthought'" do
		"overthink".en.past_tense.should == 'overthought'
	end

	it "conjugates 'overthrow' as 'overthrew'" do
		"overthrow".en.past_tense.should == 'overthrew'
	end

	it "conjugates 'overwear' as 'overwore'" do
		"overwear".en.past_tense.should == 'overwore'
	end

	it "conjugates 'overwind' as 'overwound'" do
		"overwind".en.past_tense.should == 'overwound'
	end

	it "conjugates 'overwrite' as 'overwrote'" do
		"overwrite".en.past_tense.should == 'overwrote'
	end

	it "conjugates 'pay' as 'paid'" do
		"pay".en.past_tense.should == 'paid'
	end

	it "conjugates 'picnic' as 'picnicked'" do
		"picnic".en.past_tense.should == 'picnicked'
	end

	it "conjugates 'plead' as 'pleaded'" do
		"plead".en.past_tense.should == 'pleaded'
	end

	it "conjugates 'prebuild' as 'prebuilt'" do
		"prebuild".en.past_tense.should == 'prebuilt'
	end

	it "conjugates 'predo' as 'predid'" do
		"predo".en.past_tense.should == 'predid'
	end

	it "conjugates 'premake' as 'premade'" do
		"premake".en.past_tense.should == 'premade'
	end

	it "conjugates 'prepay' as 'prepaid'" do
		"prepay".en.past_tense.should == 'prepaid'
	end

	it "conjugates 'presell' as 'presold'" do
		"presell".en.past_tense.should == 'presold'
	end

	it "conjugates 'preset' as 'preset'" do
		"preset".en.past_tense.should == 'preset'
	end

	it "conjugates 'preshrink' as 'preshrank'" do
		"preshrink".en.past_tense.should == 'preshrank'
	end

	it "conjugates 'presplit' as 'presplit'" do
		"presplit".en.past_tense.should == 'presplit'
	end

	it "conjugates 'proofread' as 'proofread'" do
		"proofread".en.past_tense.should == 'proofread'
	end

	it "conjugates 'prove' as 'proved'" do
		"prove".en.past_tense.should == 'proved'
	end

	it "conjugates 'put' as 'put'" do
		"put".en.past_tense.should == 'put'
	end

	it "conjugates 'quick-freeze' as 'quick-froze'" do
		"quick-freeze".en.past_tense.should == 'quick-froze'
	end

	it "conjugates 'quick-freeze' in first person as 'quick-froze'" do
		"quick-freeze".en.past_tense( :first_person ).should == 'quick-froze'
	end

	it "conjugates 'quick-freeze' in third person as 'quick-froze'" do
		"quick-freeze".en.past_tense( :third_person ).should == 'quick-froze'
	end

	it "conjugates 'quickfreeze' as 'quickfroze'" do
		"quickfreeze".en.past_tense.should == 'quickfroze'
	end

	it "conjugates 'quit' as 'quit'" do
		"quit".en.past_tense.should == 'quit'
	end

	it "conjugates 're-cast' as 're-cast'" do
		"re-cast".en.past_tense.should == 're-cast'
	end

	it "conjugates 're-cast' in first person as 're-cast'" do
		"re-cast".en.past_tense( :first_person ).should == 're-cast'
	end

	it "conjugates 're-cast' in third person as 're-cast'" do
		"re-cast".en.past_tense( :third_person ).should == 're-cast'
	end

	it "conjugates 're-lay' as 're-laid'" do
		"re-lay".en.past_tense.should == 're-laid'
	end

	it "conjugates 're-lay' in first person as 're-laid'" do
		"re-lay".en.past_tense( :first_person ).should == 're-laid'
	end

	it "conjugates 're-lay' in third person as 're-laid'" do
		"re-lay".en.past_tense( :third_person ).should == 're-laid'
	end

	it "conjugates 're-make' as 're-made'" do
		"re-make".en.past_tense.should == 're-made'
	end

	it "conjugates 're-make' in first person as 're-made'" do
		"re-make".en.past_tense( :first_person ).should == 're-made'
	end

	it "conjugates 're-make' in third person as 're-made'" do
		"re-make".en.past_tense( :third_person ).should == 're-made'
	end

	it "conjugates 're-sell' as 're-sold'" do
		"re-sell".en.past_tense.should == 're-sold'
	end

	it "conjugates 're-sell' in first person as 're-sold'" do
		"re-sell".en.past_tense( :first_person ).should == 're-sold'
	end

	it "conjugates 're-sell' in third person as 're-sold'" do
		"re-sell".en.past_tense( :third_person ).should == 're-sold'
	end

	it "conjugates 're-tell' as 're-told'" do
		"re-tell".en.past_tense.should == 're-told'
	end

	it "conjugates 're-tell' in first person as 're-told'" do
		"re-tell".en.past_tense( :first_person ).should == 're-told'
	end

	it "conjugates 're-tell' in third person as 're-told'" do
		"re-tell".en.past_tense( :third_person ).should == 're-told'
	end

	it "conjugates 'read' as 'read'" do
		"read".en.past_tense.should == 'read'
	end

	it "conjugates 'rebid' as 'rebid'" do
		"rebid".en.past_tense.should == 'rebid'
	end

	it "conjugates 'rebind' as 'rebound'" do
		"rebind".en.past_tense.should == 'rebound'
	end

	it "conjugates 'rebroadcast' as 'rebroadcast'" do
		"rebroadcast".en.past_tense.should == 'rebroadcast'
	end

	it "conjugates 'rebuild' as 'rebuilt'" do
		"rebuild".en.past_tense.should == 'rebuilt'
	end

	it "conjugates 'recast' as 'recast'" do
		"recast".en.past_tense.should == 'recast'
	end

	it "conjugates 'recut' as 'recut'" do
		"recut".en.past_tense.should == 'recut'
	end

	it "conjugates 'redeal' as 'redealt'" do
		"redeal".en.past_tense.should == 'redealt'
	end

	it "conjugates 'redo' as 'redid'" do
		"redo".en.past_tense.should == 'redid'
	end

	it "conjugates 'redraw' as 'redrew'" do
		"redraw".en.past_tense.should == 'redrew'
	end

	it "conjugates 'refit' as 'refit'" do
		"refit".en.past_tense.should == 'refit'
	end

	it "conjugates 'regrind' as 'reground'" do
		"regrind".en.past_tense.should == 'reground'
	end

	it "conjugates 'regrow' as 'regrew'" do
		"regrow".en.past_tense.should == 'regrew'
	end

	it "conjugates 'rehang' as 'rehung'" do
		"rehang".en.past_tense.should == 'rehung'
	end

	it "conjugates 'rehear' as 'reheard'" do
		"rehear".en.past_tense.should == 'reheard'
	end

	it "conjugates 'reknit' as 'reknitted'" do
		"reknit".en.past_tense.should == 'reknitted'
	end

	it "conjugates 'relay' as 'relaid'" do
		"relay".en.past_tense.should == 'relaid'
	end

	it "conjugates 'remake' as 'remade'" do
		"remake".en.past_tense.should == 'remade'
	end

	it "conjugates 'repay' as 'repaid'" do
		"repay".en.past_tense.should == 'repaid'
	end

	it "conjugates 'rerun' as 'reran'" do
		"rerun".en.past_tense.should == 'reran'
	end

	it "conjugates 'resell' as 'resold'" do
		"resell".en.past_tense.should == 'resold'
	end

	it "conjugates 'resend' as 'resent'" do
		"resend".en.past_tense.should == 'resent'
	end

	it "conjugates 'reset' as 'reset'" do
		"reset".en.past_tense.should == 'reset'
	end

	it "conjugates 'resew' as 'resewed'" do
		"resew".en.past_tense.should == 'resewed'
	end

	it "conjugates 'retake' as 'retook'" do
		"retake".en.past_tense.should == 'retook'
	end

	it "conjugates 'reteach' as 'retaught'" do
		"reteach".en.past_tense.should == 'retaught'
	end

	it "conjugates 'retear' as 'retore'" do
		"retear".en.past_tense.should == 'retore'
	end

	it "conjugates 'retell' as 'retold'" do
		"retell".en.past_tense.should == 'retold'
	end

	it "conjugates 'rethink' as 'rethought'" do
		"rethink".en.past_tense.should == 'rethought'
	end

	it "conjugates 'retread' as 'retrod'" do
		"retread".en.past_tense.should == 'retrod'
	end

	it "conjugates 'retrofit' as 'retrofit'" do
		"retrofit".en.past_tense.should == 'retrofit'
	end

	it "conjugates 'reweave' as 'rewove'" do
		"reweave".en.past_tense.should == 'rewove'
	end

	it "conjugates 'rewed' as 'rewed'" do
		"rewed".en.past_tense.should == 'rewed'
	end

	it "conjugates 'rewet' as 'rewet'" do
		"rewet".en.past_tense.should == 'rewet'
	end

	it "conjugates 'rewin' as 'rewon'" do
		"rewin".en.past_tense.should == 'rewon'
	end

	it "conjugates 'rewind' as 'rewound'" do
		"rewind".en.past_tense.should == 'rewound'
	end

	it "conjugates 'rewrite' as 'rewrote'" do
		"rewrite".en.past_tense.should == 'rewrote'
	end

	it "conjugates 'rid' as 'rid'" do
		"rid".en.past_tense.should == 'rid'
	end

	it "conjugates 'ride' as 'rode'" do
		"ride".en.past_tense.should == 'rode'
	end

	it "conjugates 'ring' as 'rang'" do
		"ring".en.past_tense.should == 'rang'
	end

	it "conjugates 'rise' as 'rose'" do
		"rise".en.past_tense.should == 'rose'
	end

	it "conjugates 'run' as 'ran'" do
		"run".en.past_tense.should == 'ran'
	end

	it "conjugates 'sand-cast' as 'sand-cast'" do
		"sand-cast".en.past_tense.should == 'sand-cast'
	end

	it "conjugates 'sand-cast' in first person as 'sand-cast'" do
		"sand-cast".en.past_tense( :first_person ).should == 'sand-cast'
	end

	it "conjugates 'sand-cast' in third person as 'sand-cast'" do
		"sand-cast".en.past_tense( :third_person ).should == 'sand-cast'
	end

	it "conjugates 'sandcast' as 'sandcast'" do
		"sandcast".en.past_tense.should == 'sandcast'
	end

	it "conjugates 'say' as 'said'" do
		"say".en.past_tense.should == 'said'
	end

	it "conjugates 'see' as 'saw'" do
		"see".en.past_tense.should == 'saw'
	end

	it "conjugates 'seek' as 'sought'" do
		"seek".en.past_tense.should == 'sought'
	end

	it "conjugates 'self-feed' as 'self-fed'" do
		"self-feed".en.past_tense.should == 'self-fed'
	end

	it "conjugates 'self-feed' in first person as 'self-fed'" do
		"self-feed".en.past_tense( :first_person ).should == 'self-fed'
	end

	it "conjugates 'self-feed' in third person as 'self-fed'" do
		"self-feed".en.past_tense( :third_person ).should == 'self-fed'
	end

	it "conjugates 'selffeed' as 'selffed'" do
		"selffeed".en.past_tense.should == 'selffed'
	end

	it "conjugates 'sell' as 'sold'" do
		"sell".en.past_tense.should == 'sold'
	end

	it "conjugates 'send' as 'sent'" do
		"send".en.past_tense.should == 'sent'
	end

	it "conjugates 'set' as 'set'" do
		"set".en.past_tense.should == 'set'
	end

	it "conjugates 'sew' as 'sewed'" do
		"sew".en.past_tense.should == 'sewed'
	end

	it "conjugates 'shake' as 'shook'" do
		"shake".en.past_tense.should == 'shook'
	end

	it "conjugates 'shear' as 'shore'" do
		"shear".en.past_tense.should == 'shore'
	end

	it "conjugates 'shed' as 'shed'" do
		"shed".en.past_tense.should == 'shed'
	end

	it "conjugates 'shoot' as 'shot'" do
		"shoot".en.past_tense.should == 'shot'
	end

	it "conjugates 'show' as 'showed'" do
		"show".en.past_tense.should == 'showed'
	end

	it "conjugates 'shrink' as 'shrank'" do
		"shrink".en.past_tense.should == 'shrank'
	end

	it "conjugates 'shut' as 'shut'" do
		"shut".en.past_tense.should == 'shut'
	end

	it "conjugates 'sight-read' as 'sight-read'" do
		"sight-read".en.past_tense.should == 'sight-read'
	end

	it "conjugates 'sight-read' in first person as 'sight-read'" do
		"sight-read".en.past_tense( :first_person ).should == 'sight-read'
	end

	it "conjugates 'sight-read' in third person as 'sight-read'" do
		"sight-read".en.past_tense( :third_person ).should == 'sight-read'
	end

	it "conjugates 'sightread' as 'sightread'" do
		"sightread".en.past_tense.should == 'sightread'
	end

	it "conjugates 'sign-on' as 'signed-on'" do
		"sign-on".en.past_tense.should == 'signed-on'
	end

	it "conjugates 'sign-on' in first person as 'signed-on'" do
		"sign-on".en.past_tense( :first_person ).should == 'signed-on'
	end

	it "conjugates 'sign-on' in third person as 'signed-on'" do
		"sign-on".en.past_tense( :third_person ).should == 'signed-on'
	end

	it "conjugates 'sing' as 'sang'" do
		"sing".en.past_tense.should == 'sang'
	end

	it "conjugates 'sink' as 'sank'" do
		"sink".en.past_tense.should == 'sank'
	end

	it "conjugates 'sit' as 'sat'" do
		"sit".en.past_tense.should == 'sat'
	end

	it "conjugates 'skywrite' as 'skywrote'" do
		"skywrite".en.past_tense.should == 'skywrote'
	end

	it "conjugates 'slay' as 'slew'" do
		"slay".en.past_tense.should == 'slew'
	end

	it "conjugates 'sleep' as 'slept'" do
		"sleep".en.past_tense.should == 'slept'
	end

	it "conjugates 'slide' as 'slid'" do
		"slide".en.past_tense.should == 'slid'
	end

	it "conjugates 'sling' as 'slung'" do
		"sling".en.past_tense.should == 'slung'
	end

	it "conjugates 'slit' as 'slit'" do
		"slit".en.past_tense.should == 'slit'
	end

	it "conjugates 'smite' as 'smote'" do
		"smite".en.past_tense.should == 'smote'
	end

	it "conjugates 'speak' as 'spoke'" do
		"speak".en.past_tense.should == 'spoke'
	end

	it "conjugates 'speed' as 'sped'" do
		"speed".en.past_tense.should == 'sped'
	end

	it "conjugates 'spend' as 'spent'" do
		"spend".en.past_tense.should == 'spent'
	end

	it "conjugates 'spin' as 'spun'" do
		"spin".en.past_tense.should == 'spun'
	end

	it "conjugates 'spit' as 'spat'" do
		"spit".en.past_tense.should == 'spat'
	end

	it "conjugates 'split' as 'split'" do
		"split".en.past_tense.should == 'split'
	end

	it "conjugates 'spoon-feed' as 'spoon-fed'" do
		"spoon-feed".en.past_tense.should == 'spoon-fed'
	end

	it "conjugates 'spoon-feed' in first person as 'spoon-fed'" do
		"spoon-feed".en.past_tense( :first_person ).should == 'spoon-fed'
	end

	it "conjugates 'spoon-feed' in third person as 'spoon-fed'" do
		"spoon-feed".en.past_tense( :third_person ).should == 'spoon-fed'
	end

	it "conjugates 'spoonfeed' as 'spoonfed'" do
		"spoonfeed".en.past_tense.should == 'spoonfed'
	end

	it "conjugates 'spread' as 'spread'" do
		"spread".en.past_tense.should == 'spread'
	end

	it "conjugates 'spring' as 'sprang'" do
		"spring".en.past_tense.should == 'sprang'
	end

	it "conjugates 'stall-feed' as 'stall-fed'" do
		"stall-feed".en.past_tense.should == 'stall-fed'
	end

	it "conjugates 'stall-feed' in first person as 'stall-fed'" do
		"stall-feed".en.past_tense( :first_person ).should == 'stall-fed'
	end

	it "conjugates 'stall-feed' in third person as 'stall-fed'" do
		"stall-feed".en.past_tense( :third_person ).should == 'stall-fed'
	end

	it "conjugates 'stallfeed' as 'stallfed'" do
		"stallfeed".en.past_tense.should == 'stallfed'
	end

	it "conjugates 'stand' as 'stood'" do
		"stand".en.past_tense.should == 'stood'
	end

	it "conjugates 'steal' as 'stole'" do
		"steal".en.past_tense.should == 'stole'
	end

	it "conjugates 'step-up' as 'stepped-up'" do
		"step-up".en.past_tense.should == 'stepped-up'
	end

	it "conjugates 'step-up' in first person as 'stepped-up'" do
		"step-up".en.past_tense( :first_person ).should == 'stepped-up'
	end

	it "conjugates 'step-up' in third person as 'stepped-up'" do
		"step-up".en.past_tense( :third_person ).should == 'stepped-up'
	end

	it "conjugates 'stepup' as 'steppedup'" do
		"stepup".en.past_tense.should == 'steppedup'
	end

	it "conjugates 'stick' as 'stuck'" do
		"stick".en.past_tense.should == 'stuck'
	end

	it "conjugates 'sting' as 'stung'" do
		"sting".en.past_tense.should == 'stung'
	end

	it "conjugates 'stink' as 'stank'" do
		"stink".en.past_tense.should == 'stank'
	end

	it "conjugates 'stride' as 'strode'" do
		"stride".en.past_tense.should == 'strode'
	end

	it "conjugates 'strike' as 'struck'" do
		"strike".en.past_tense.should == 'struck'
	end

	it "conjugates 'string' as 'strung'" do
		"string".en.past_tense.should == 'strung'
	end

	it "conjugates 'strive' as 'strove'" do
		"strive".en.past_tense.should == 'strove'
	end

	it "conjugates 'sub-let' as 'sub-let'" do
		"sub-let".en.past_tense.should == 'sub-let'
	end

	it "conjugates 'sub-let' in first person as 'sub-let'" do
		"sub-let".en.past_tense( :first_person ).should == 'sub-let'
	end

	it "conjugates 'sub-let' in third person as 'sub-let'" do
		"sub-let".en.past_tense( :third_person ).should == 'sub-let'
	end

	it "conjugates 'sublet' as 'sublet'" do
		"sublet".en.past_tense.should == 'sublet'
	end

	it "conjugates 'swear' as 'swore'" do
		"swear".en.past_tense.should == 'swore'
	end

	it "conjugates 'sweep' as 'swept'" do
		"sweep".en.past_tense.should == 'swept'
	end

	it "conjugates 'swell' as 'swelled'" do
		"swell".en.past_tense.should == 'swelled'
	end

	it "conjugates 'swim' as 'swam'" do
		"swim".en.past_tense.should == 'swam'
	end

	it "conjugates 'swing' as 'swung'" do
		"swing".en.past_tense.should == 'swung'
	end

	it "conjugates 'take' as 'took'" do
		"take".en.past_tense.should == 'took'
	end

	it "conjugates 'teach' as 'taught'" do
		"teach".en.past_tense.should == 'taught'
	end

	it "conjugates 'tear' as 'tore'" do
		"tear".en.past_tense.should == 'tore'
	end

	it "conjugates 'telecast' as 'telecast'" do
		"telecast".en.past_tense.should == 'telecast'
	end

	it "conjugates 'tell' as 'told'" do
		"tell".en.past_tense.should == 'told'
	end

	it "conjugates 'test-drive' as 'test-drove'" do
		"test-drive".en.past_tense.should == 'test-drove'
	end

	it "conjugates 'test-drive' in first person as 'test-drove'" do
		"test-drive".en.past_tense( :first_person ).should == 'test-drove'
	end

	it "conjugates 'test-drive' in third person as 'test-drove'" do
		"test-drive".en.past_tense( :third_person ).should == 'test-drove'
	end

	it "conjugates 'test-fly' as 'test-flew'" do
		"test-fly".en.past_tense.should == 'test-flew'
	end

	it "conjugates 'test-fly' in first person as 'test-flew'" do
		"test-fly".en.past_tense( :first_person ).should == 'test-flew'
	end

	it "conjugates 'test-fly' in third person as 'test-flew'" do
		"test-fly".en.past_tense( :third_person ).should == 'test-flew'
	end

	it "conjugates 'testdrive' as 'testdrove'" do
		"testdrive".en.past_tense.should == 'testdrove'
	end

	it "conjugates 'testfly' as 'testflew'" do
		"testfly".en.past_tense.should == 'testflew'
	end

	it "conjugates 'think' as 'thought'" do
		"think".en.past_tense.should == 'thought'
	end

	it "conjugates 'thring' as 'throng'" do
		"thring".en.past_tense.should == 'throng'
	end

	it "conjugates 'throw' as 'threw'" do
		"throw".en.past_tense.should == 'threw'
	end

	it "conjugates 'thrust' as 'thrust'" do
		"thrust".en.past_tense.should == 'thrust'
	end

	it "conjugates 'trail-off' as 'trailed-off'" do
		"trail-off".en.past_tense.should == 'trailed-off'
	end

	it "conjugates 'trail-off' in first person as 'trailed-off'" do
		"trail-off".en.past_tense( :first_person ).should == 'trailed-off'
	end

	it "conjugates 'trail-off' in third person as 'trailed-off'" do
		"trail-off".en.past_tense( :third_person ).should == 'trailed-off'
	end

	it "conjugates 'tread' as 'trod'" do
		"tread".en.past_tense.should == 'trod'
	end

	it "conjugates 'troubleshoot' as 'troubleshot'" do
		"troubleshoot".en.past_tense.should == 'troubleshot'
	end

	it "conjugates 'typecast' as 'typecast'" do
		"typecast".en.past_tense.should == 'typecast'
	end

	it "conjugates 'typewrite' as 'typewrote'" do
		"typewrite".en.past_tense.should == 'typewrote'
	end

	it "conjugates 'under-write' as 'under-wrote'" do
		"under-write".en.past_tense.should == 'under-wrote'
	end

	it "conjugates 'under-write' in first person as 'under-wrote'" do
		"under-write".en.past_tense( :first_person ).should == 'under-wrote'
	end

	it "conjugates 'under-write' in third person as 'under-wrote'" do
		"under-write".en.past_tense( :third_person ).should == 'under-wrote'
	end

	it "conjugates 'underbid' as 'underbid'" do
		"underbid".en.past_tense.should == 'underbid'
	end

	it "conjugates 'underbuy' as 'underbought'" do
		"underbuy".en.past_tense.should == 'underbought'
	end

	it "conjugates 'undercut' as 'undercut'" do
		"undercut".en.past_tense.should == 'undercut'
	end

	it "conjugates 'underfeed' as 'underfed'" do
		"underfeed".en.past_tense.should == 'underfed'
	end

	it "conjugates 'undergo' as 'underwent'" do
		"undergo".en.past_tense.should == 'underwent'
	end

	it "conjugates 'underrun' as 'underran'" do
		"underrun".en.past_tense.should == 'underran'
	end

	it "conjugates 'undersell' as 'undersold'" do
		"undersell".en.past_tense.should == 'undersold'
	end

	it "conjugates 'undershoot' as 'undershot'" do
		"undershoot".en.past_tense.should == 'undershot'
	end

	it "conjugates 'underspend' as 'underspent'" do
		"underspend".en.past_tense.should == 'underspent'
	end

	it "conjugates 'understand' as 'understood'" do
		"understand".en.past_tense.should == 'understood'
	end

	it "conjugates 'undertake' as 'undertook'" do
		"undertake".en.past_tense.should == 'undertook'
	end

	it "conjugates 'underthrust' as 'underthrust'" do
		"underthrust".en.past_tense.should == 'underthrust'
	end

	it "conjugates 'underwrite' as 'underwrote'" do
		"underwrite".en.past_tense.should == 'underwrote'
	end

	it "conjugates 'undo' as 'undid'" do
		"undo".en.past_tense.should == 'undid'
	end

	it "conjugates 'undraw' as 'undrew'" do
		"undraw".en.past_tense.should == 'undrew'
	end

	it "conjugates 'unfreeze' as 'unfroze'" do
		"unfreeze".en.past_tense.should == 'unfroze'
	end

	it "conjugates 'unhang' as 'unhung'" do
		"unhang".en.past_tense.should == 'unhung'
	end

	it "conjugates 'unhide' as 'unhid'" do
		"unhide".en.past_tense.should == 'unhid'
	end

	it "conjugates 'unhold' as 'unheld'" do
		"unhold".en.past_tense.should == 'unheld'
	end

	it "conjugates 'unknit' as 'unknitted'" do
		"unknit".en.past_tense.should == 'unknitted'
	end

	it "conjugates 'unlay' as 'unlaid'" do
		"unlay".en.past_tense.should == 'unlaid'
	end

	it "conjugates 'unmake' as 'unmade'" do
		"unmake".en.past_tense.should == 'unmade'
	end

	it "conjugates 'unsay' as 'unsaid'" do
		"unsay".en.past_tense.should == 'unsaid'
	end

	it "conjugates 'unsew' as 'unsewed'" do
		"unsew".en.past_tense.should == 'unsewed'
	end

	it "conjugates 'unsling' as 'unslung'" do
		"unsling".en.past_tense.should == 'unslung'
	end

	it "conjugates 'unspin' as 'unspun'" do
		"unspin".en.past_tense.should == 'unspun'
	end

	it "conjugates 'unstick' as 'unstuck'" do
		"unstick".en.past_tense.should == 'unstuck'
	end

	it "conjugates 'unstring' as 'unstrung'" do
		"unstring".en.past_tense.should == 'unstrung'
	end

	it "conjugates 'unswear' as 'unswore'" do
		"unswear".en.past_tense.should == 'unswore'
	end

	it "conjugates 'unteach' as 'untaught'" do
		"unteach".en.past_tense.should == 'untaught'
	end

	it "conjugates 'unthink' as 'unthought'" do
		"unthink".en.past_tense.should == 'unthought'
	end

	it "conjugates 'unweave' as 'unwove'" do
		"unweave".en.past_tense.should == 'unwove'
	end

	it "conjugates 'unwind' as 'unwound'" do
		"unwind".en.past_tense.should == 'unwound'
	end

	it "conjugates 'unwrite' as 'unwrote'" do
		"unwrite".en.past_tense.should == 'unwrote'
	end

	it "conjugates 'uphold' as 'upheld'" do
		"uphold".en.past_tense.should == 'upheld'
	end

	it "conjugates 'upset' as 'upset'" do
		"upset".en.past_tense.should == 'upset'
	end

	it "conjugates 'use up' as 'used up'" do
		pending "figuring out how this is supposed to work" do
			"use up".en.past_tense.should == 'used up'
		end
	end

	it "conjugates 'use up' in first person as 'used up'" do
		pending "figuring out how this is supposed to work" do
			"use up".en.past_tense( :first_person ).should == 'used up'
		end
	end

	it "conjugates 'use up' in third person as 'used up'" do
		pending "figuring out how this is supposed to work" do
			"use up".en.past_tense( :third_person ).should == 'used up'
		end
	end

	it "conjugates 'wake' as 'woke'" do
		"wake".en.past_tense.should == 'woke'
	end

	it "conjugates 'waylay' as 'waylaid'" do
		"waylay".en.past_tense.should == 'waylaid'
	end

	it "conjugates 'wear' as 'wore'" do
		"wear".en.past_tense.should == 'wore'
	end

	it "conjugates 'weave' as 'wove'" do
		"weave".en.past_tense.should == 'wove'
	end

	it "conjugates 'wed' as 'wed'" do
		"wed".en.past_tense.should == 'wed'
	end

	it "conjugates 'weep' as 'wept'" do
		"weep".en.past_tense.should == 'wept'
	end

	it "conjugates 'welcome' as 'welcomed'" do
		"welcome".en.past_tense.should == 'welcomed'
	end

	it "conjugates 'wet' as 'wet'" do
		"wet".en.past_tense.should == 'wet'
	end

	it "conjugates 'win' as 'won'" do
		"win".en.past_tense.should == 'won'
	end

	it "conjugates 'wind' as 'wound'" do
		"wind".en.past_tense.should == 'wound'
	end

	it "conjugates 'withdraw' as 'withdrew'" do
		"withdraw".en.past_tense.should == 'withdrew'
	end

	it "conjugates 'withhold' as 'withheld'" do
		"withhold".en.past_tense.should == 'withheld'
	end

	it "conjugates 'withstand' as 'withstood'" do
		"withstand".en.past_tense.should == 'withstood'
	end

	it "conjugates 'wring' as 'wrung'" do
		"wring".en.past_tense.should == 'wrung'
	end

	it "conjugates 'write' as 'wrote'" do
		"write".en.past_tense.should == 'wrote'
	end

	it "conjugates 'take' as 'taking'" do
		"take".en.present_participle.should == 'taking'
	end

	it "conjugates 'die' as 'dying'" do
		"die".en.present_participle.should == 'dying'
	end

end

