#!/usr/bin/env rspec -cfd

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
require 'linguistics/en'
require 'linguistics/en/articles'


describe Linguistics::EN::Articles do

	before( :all ) do
		setup_logging()
		Linguistics.use( :en )
	end

	after( :all ) do
		reset_logging()
	end

	it "adds EN::Articles to the list of English language modules" do
		Linguistics::EN.should have_extension( :articles )
	end


	describe "in monkeypatch mode" do

		let( :monkeypatched_class ) do
			Class.new do
				def to_s; "antelope"; end
			end
		end
		let( :monkeypatched_object ) do
			Linguistics.use( :en, classes: monkeypatched_class, monkeypatch: true )
			monkeypatched_class.new
		end


		it "uses the stringified receiver as the object which should get the article" do
			monkeypatched_object.a.should == 'an antelope'
		end

		it "uses correct pluralization to form the negative article" do
			monkeypatched_object.no.should == 'no antelopes'
		end

	end


	it "uses 'an' as the indefinite article for 'A.B.C'" do
		"A.B.C".en.a.should == "an A.B.C"
	end

	it "uses 'an' as the indefinite article for 'AI'" do
		"AI".en.a.should == "an AI"
	end

	it "uses 'an' as the indefinite article for 'AGE'" do
		"AGE".en.a.should == "an AGE"
	end

	it "uses 'an' as the indefinite article for 'agendum'" do
		"agendum".en.a.should == "an agendum"
	end

	it "uses 'an' as the indefinite article for 'aide-de-camp'" do
		"aide-de-camp".en.a.should == "an aide-de-camp"
	end

	it "uses 'an' as the indefinite article for 'albino'" do
		"albino".en.a.should == "an albino"
	end

	it "uses 'a' as the indefinite article for 'B.L.T. sandwich'" do
		"B.L.T. sandwich".en.a.should == "a B.L.T. sandwich"
	end

	it "uses 'a' as the indefinite article for 'BMW'" do
		"BMW".en.a.should == "a BMW"
	end

	it "uses 'a' as the indefinite article for 'BLANK'" do
		"BLANK".en.a.should == "a BLANK"
	end

	it "uses 'a' as the indefinite article for 'bacterium'" do
		"bacterium".en.a.should == "a bacterium"
	end

	it "uses 'a' as the indefinite article for 'Burmese restaurant'" do
		"Burmese restaurant".en.a.should == "a Burmese restaurant"
	end

	it "uses 'a' as the indefinite article for 'C.O.'" do
		"C.O.".en.a.should == "a C.O."
	end

	it "uses 'a' as the indefinite article for 'CCD'" do
		"CCD".en.a.should == "a CCD"
	end

	it "uses 'a' as the indefinite article for 'COLON'" do
		"COLON".en.a.should == "a COLON"
	end

	it "uses 'a' as the indefinite article for 'cameo'" do
		"cameo".en.a.should == "a cameo"
	end

	it "uses 'a' as the indefinite article for 'CAPITAL'" do
		"CAPITAL".en.a.should == "a CAPITAL"
	end

	it "uses 'a' as the indefinite article for 'D.S.M.'" do
		"D.S.M.".en.a.should == "a D.S.M."
	end

	it "uses 'a' as the indefinite article for 'DNR'" do
		"DNR".en.a.should == "a DNR"
	end

	it "uses 'a' as the indefinite article for 'DINNER'" do
		"DINNER".en.a.should == "a DINNER"
	end

	it "uses 'a' as the indefinite article for 'dynamo'" do
		"dynamo".en.a.should == "a dynamo"
	end

	it "uses 'an' as the indefinite article for 'E.K.G.'" do
		"E.K.G.".en.a.should == "an E.K.G."
	end

	it "uses 'an' as the indefinite article for 'ECG'" do
		"ECG".en.a.should == "an ECG"
	end

	it "uses 'an' as the indefinite article for 'EGG'" do
		"EGG".en.a.should == "an EGG"
	end

	it "uses 'an' as the indefinite article for 'embryo'" do
		"embryo".en.a.should == "an embryo"
	end

	it "uses 'an' as the indefinite article for 'erratum'" do
		"erratum".en.a.should == "an erratum"
	end

	it "uses 'a' as the indefinite article for 'eucalyptus'" do
		"eucalyptus".en.a.should == "a eucalyptus"
	end

	it "uses 'an' as the indefinite article for 'Euler number'" do
		"Euler number".en.a.should == "an Euler number"
	end

	it "uses 'a' as the indefinite article for 'eulogy'" do
		"eulogy".en.a.should == "a eulogy"
	end

	it "uses 'a' as the indefinite article for 'euphemism'" do
		"euphemism".en.a.should == "a euphemism"
	end

	it "uses 'a' as the indefinite article for 'euphoria'" do
		"euphoria".en.a.should == "a euphoria"
	end

	it "uses 'a' as the indefinite article for 'ewe'" do
		"ewe".en.a.should == "a ewe"
	end

	it "uses 'a' as the indefinite article for 'ewer'" do
		"ewer".en.a.should == "a ewer"
	end

	it "uses 'an' as the indefinite article for 'extremum'" do
		"extremum".en.a.should == "an extremum"
	end

	it "uses 'an' as the indefinite article for 'eye'" do
		"eye".en.a.should == "an eye"
	end

	it "uses 'an' as the indefinite article for 'F.B.I. agent'" do
		"F.B.I. agent".en.a.should == "an F.B.I. agent"
	end

	it "uses 'an' as the indefinite article for 'FSM'" do
		"FSM".en.a.should == "an FSM"
	end

	it "uses 'a' as the indefinite article for 'FACT'" do
		"FACT".en.a.should == "a FACT"
	end

	it "uses 'a' as the indefinite article for 'FAQ'" do
		"FAQ".en.a.should == "a FAQ"
	end

	it "uses 'an' as the indefinite article for 'F.A.Q.'" do
		"F.A.Q.".en.a.should == "an F.A.Q."
	end

	it "uses 'a' as the indefinite article for 'fish'" do
		"fish".en.a.should == "a fish"
	end

	it "uses 'a' as the indefinite article for 'G-string'" do
		"G-string".en.a.should == "a G-string"
	end

	it "uses 'a' as the indefinite article for 'GSM phone'" do
		"GSM phone".en.a.should == "a GSM phone"
	end

	it "uses 'a' as the indefinite article for 'GOD'" do
		"GOD".en.a.should == "a GOD"
	end

	it "uses 'a' as the indefinite article for 'genus'" do
		"genus".en.a.should == "a genus"
	end

	it "uses 'a' as the indefinite article for 'Governor General'" do
		"Governor General".en.a.should == "a Governor General"
	end

	it "uses 'an' as the indefinite article for 'H-Bomb'" do
		"H-Bomb".en.a.should == "an H-Bomb"
	end

	it "uses 'an' as the indefinite article for 'H.M.S Ark Royal'" do
		"H.M.S Ark Royal".en.a.should == "an H.M.S Ark Royal"
	end

	it "uses 'an' as the indefinite article for 'HSL colour space'" do
		"HSL colour space".en.a.should == "an HSL colour space"
	end

	it "uses 'a' as the indefinite article for 'HAL 9000'" do
		"HAL 9000".en.a.should == "a HAL 9000"
	end

	it "uses 'an' as the indefinite article for 'H.A.L. 9000'" do
		"H.A.L. 9000".en.a.should == "an H.A.L. 9000"
	end

	it "uses 'a' as the indefinite article for 'has-been'" do
		"has-been".en.a.should == "a has-been"
	end

	it "uses 'a' as the indefinite article for 'height'" do
		"height".en.a.should == "a height"
	end

	it "uses 'an' as the indefinite article for 'heir'" do
		"heir".en.a.should == "an heir"
	end

	it "uses 'a' as the indefinite article for 'honed blade'" do
		"honed blade".en.a.should == "a honed blade"
	end

	it "uses 'an' as the indefinite article for 'honest man'" do
		"honest man".en.a.should == "an honest man"
	end

	it "uses 'a' as the indefinite article for 'honeymoon'" do
		"honeymoon".en.a.should == "a honeymoon"
	end

	it "uses 'an' as the indefinite article for 'honorarium'" do
		"honorarium".en.a.should == "an honorarium"
	end

	it "uses 'an' as the indefinite article for 'honorary degree'" do
		"honorary degree".en.a.should == "an honorary degree"
	end

	it "uses 'an' as the indefinite article for 'honoree'" do
		"honoree".en.a.should == "an honoree"
	end

	it "uses 'an' as the indefinite article for 'honorific'" do
		"honorific".en.a.should == "an honorific"
	end

	it "uses 'a' as the indefinite article for 'Hough transform'" do
		"Hough transform".en.a.should == "a Hough transform"
	end

	it "uses 'a' as the indefinite article for 'hound'" do
		"hound".en.a.should == "a hound"
	end

	it "uses 'an' as the indefinite article for 'hour'" do
		"hour".en.a.should == "an hour"
	end

	it "uses 'an' as the indefinite article for 'hourglass'" do
		"hourglass".en.a.should == "an hourglass"
	end

	it "uses 'a' as the indefinite article for 'houri'" do
		"houri".en.a.should == "a houri"
	end

	it "uses 'a' as the indefinite article for 'house'" do
		"house".en.a.should == "a house"
	end

	it "uses 'an' as the indefinite article for 'I.O.U.'" do
		"I.O.U.".en.a.should == "an I.O.U."
	end

	it "uses 'an' as the indefinite article for 'IQ'" do
		"IQ".en.a.should == "an IQ"
	end

	it "uses 'an' as the indefinite article for 'IDEA'" do
		"IDEA".en.a.should == "an IDEA"
	end

	it "uses 'an' as the indefinite article for 'inferno'" do
		"inferno".en.a.should == "an inferno"
	end

	it "uses 'an' as the indefinite article for 'Inspector General'" do
		"Inspector General".en.a.should == "an Inspector General"
	end

	it "uses 'a' as the indefinite article for 'jumbo'" do
		"jumbo".en.a.should == "a jumbo"
	end

	it "uses 'a' as the indefinite article for 'knife'" do
		"knife".en.a.should == "a knife"
	end

	it "uses 'an' as the indefinite article for 'L.E.D.'" do
		"L.E.D.".en.a.should == "an L.E.D."
	end

	it "uses 'a' as the indefinite article for 'LED'" do
		"LED".en.a.should == "a LED"
	end

	it "uses 'an' as the indefinite article for 'LCD'" do
		"LCD".en.a.should == "an LCD"
	end

	it "uses 'a' as the indefinite article for 'lady in waiting'" do
		"lady in waiting".en.a.should == "a lady in waiting"
	end

	it "uses 'a' as the indefinite article for 'leaf'" do
		"leaf".en.a.should == "a leaf"
	end

	it "uses 'an' as the indefinite article for 'M.I.A.'" do
		"M.I.A.".en.a.should == "an M.I.A."
	end

	it "uses 'a' as the indefinite article for 'MIASMA'" do
		"MIASMA".en.a.should == "a MIASMA"
	end

	it "uses 'an' as the indefinite article for 'MTV channel'" do
		"MTV channel".en.a.should == "an MTV channel"
	end

	it "uses 'a' as the indefinite article for 'Major General'" do
		"Major General".en.a.should == "a Major General"
	end

	it "uses 'an' as the indefinite article for 'N.C.O.'" do
		"N.C.O.".en.a.should == "an N.C.O."
	end

	it "uses 'an' as the indefinite article for 'NCO'" do
		"NCO".en.a.should == "an NCO"
	end

	it "uses 'a' as the indefinite article for 'NATO country'" do
		"NATO country".en.a.should == "a NATO country"
	end

	it "uses 'a' as the indefinite article for 'note'" do
		"note".en.a.should == "a note"
	end

	it "uses 'an' as the indefinite article for 'O.K.'" do
		"O.K.".en.a.should == "an O.K."
	end

	it "uses 'an' as the indefinite article for 'OK'" do
		"OK".en.a.should == "an OK"
	end

	it "uses 'an' as the indefinite article for 'OLE'" do
		"OLE".en.a.should == "an OLE"
	end

	it "uses 'an' as the indefinite article for 'octavo'" do
		"octavo".en.a.should == "an octavo"
	end

	it "uses 'an' as the indefinite article for 'octopus'" do
		"octopus".en.a.should == "an octopus"
	end

	it "uses 'an' as the indefinite article for 'okay'" do
		"okay".en.a.should == "an okay"
	end

	it "uses 'a' as the indefinite article for 'once-and-future-king'" do
		"once-and-future-king".en.a.should == "a once-and-future-king"
	end

	it "uses 'an' as the indefinite article for 'oncologist'" do
		"oncologist".en.a.should == "an oncologist"
	end

	it "uses 'a' as the indefinite article for 'one night stand'" do
		"one night stand".en.a.should == "a one night stand"
	end

	it "uses 'an' as the indefinite article for 'onerous task'" do
		"onerous task".en.a.should == "an onerous task"
	end

	it "uses 'an' as the indefinite article for 'opera'" do
		"opera".en.a.should == "an opera"
	end

	it "uses 'an' as the indefinite article for 'optimum'" do
		"optimum".en.a.should == "an optimum"
	end

	it "uses 'an' as the indefinite article for 'opus'" do
		"opus".en.a.should == "an opus"
	end

	it "uses 'an' as the indefinite article for 'ox'" do
		"ox".en.a.should == "an ox"
	end

	it "uses 'a' as the indefinite article for 'Ph.D.'" do
		"Ph.D.".en.a.should == "a Ph.D."
	end

	it "uses 'a' as the indefinite article for 'PET'" do
		"PET".en.a.should == "a PET"
	end

	it "uses 'a' as the indefinite article for 'P.E.T. scan'" do
		"P.E.T. scan".en.a.should == "a P.E.T. scan"
	end

	it "uses 'a' as the indefinite article for 'plateau'" do
		"plateau".en.a.should == "a plateau"
	end

	it "uses 'a' as the indefinite article for 'quantum'" do
		"quantum".en.a.should == "a quantum"
	end

	it "uses 'an' as the indefinite article for 'R.S.V.P.'" do
		"R.S.V.P.".en.a.should == "an R.S.V.P."
	end

	it "uses 'an' as the indefinite article for 'RSVP'" do
		"RSVP".en.a.should == "an RSVP"
	end

	it "uses 'a' as the indefinite article for 'REST'" do
		"REST".en.a.should == "a REST"
	end

	it "uses 'a' as the indefinite article for 'reindeer'" do
		"reindeer".en.a.should == "a reindeer"
	end

	it "uses 'an' as the indefinite article for 'S.O.S.'" do
		"S.O.S.".en.a.should == "an S.O.S."
	end

	it "uses 'a' as the indefinite article for 'SUM'" do
		"SUM".en.a.should == "a SUM"
	end

	it "uses 'an' as the indefinite article for 'SST'" do
		"SST".en.a.should == "an SST"
	end

	it "uses 'a' as the indefinite article for 'salmon'" do
		"salmon".en.a.should == "a salmon"
	end

	it "uses 'a' as the indefinite article for 'T.N.T. bomb'" do
		"T.N.T. bomb".en.a.should == "a T.N.T. bomb"
	end

	it "uses 'a' as the indefinite article for 'TNT bomb'" do
		"TNT bomb".en.a.should == "a TNT bomb"
	end

	it "uses 'a' as the indefinite article for 'TENT'" do
		"TENT".en.a.should == "a TENT"
	end

	it "uses 'a' as the indefinite article for 'thought'" do
		"thought".en.a.should == "a thought"
	end

	it "uses 'a' as the indefinite article for 'tomato'" do
		"tomato".en.a.should == "a tomato"
	end

	it "uses 'a' as the indefinite article for 'U-boat'" do
		"U-boat".en.a.should == "a U-boat"
	end

	it "uses 'a' as the indefinite article for 'U.F.O.'" do
		"U.F.O.".en.a.should == "a U.F.O."
	end

	it "uses 'a' as the indefinite article for 'UFO'" do
		"UFO".en.a.should == "a UFO"
	end

	it "uses 'a' as the indefinite article for 'ubiquity'" do
		"ubiquity".en.a.should == "a ubiquity"
	end

	it "uses 'a' as the indefinite article for 'unicorn'" do
		"unicorn".en.a.should == "a unicorn"
	end

	it "uses 'an' as the indefinite article for 'unidentified flying object'" do
		"unidentified flying object".en.a.should == "an unidentified flying object"
	end

	it "uses 'a' as the indefinite article for 'uniform'" do
		"uniform".en.a.should == "a uniform"
	end

	it "uses 'a' as the indefinite article for 'unimodal system'" do
		"unimodal system".en.a.should == "a unimodal system"
	end

	it "uses 'an' as the indefinite article for 'unimpressive record'" do
		"unimpressive record".en.a.should == "an unimpressive record"
	end

	it "uses 'an' as the indefinite article for 'uninformed opinion'" do
		"uninformed opinion".en.a.should == "an uninformed opinion"
	end

	it "uses 'an' as the indefinite article for 'uninvited guest'" do
		"uninvited guest".en.a.should == "an uninvited guest"
	end

	it "uses 'a' as the indefinite article for 'union'" do
		"union".en.a.should == "a union"
	end

	it "uses 'a' as the indefinite article for 'uniplex'" do
		"uniplex".en.a.should == "a uniplex"
	end

	it "uses 'a' as the indefinite article for 'uniprocessor'" do
		"uniprocessor".en.a.should == "a uniprocessor"
	end

	it "uses 'a' as the indefinite article for 'unique opportunity'" do
		"unique opportunity".en.a.should == "a unique opportunity"
	end

	it "uses 'a' as the indefinite article for 'unisex hairdresser'" do
		"unisex hairdresser".en.a.should == "a unisex hairdresser"
	end

	it "uses 'a' as the indefinite article for 'unison'" do
		"unison".en.a.should == "a unison"
	end

	it "uses 'a' as the indefinite article for 'unit'" do
		"unit".en.a.should == "a unit"
	end

	it "uses 'a' as the indefinite article for 'unitarian'" do
		"unitarian".en.a.should == "a unitarian"
	end

	it "uses 'a' as the indefinite article for 'united front'" do
		"united front".en.a.should == "a united front"
	end

	it "uses 'a' as the indefinite article for 'unity'" do
		"unity".en.a.should == "a unity"
	end

	it "uses 'a' as the indefinite article for 'univalent bond'" do
		"univalent bond".en.a.should == "a univalent bond"
	end

	it "uses 'a' as the indefinite article for 'univariate statistic'" do
		"univariate statistic".en.a.should == "a univariate statistic"
	end

	it "uses 'a' as the indefinite article for 'universe'" do
		"universe".en.a.should == "a universe"
	end

	it "uses 'an' as the indefinite article for 'unordered meal'" do
		"unordered meal".en.a.should == "an unordered meal"
	end

	it "uses 'a' as the indefinite article for 'uranium atom'" do
		"uranium atom".en.a.should == "a uranium atom"
	end

	it "uses 'an' as the indefinite article for 'urban myth'" do
		"urban myth".en.a.should == "an urban myth"
	end

	it "uses 'an' as the indefinite article for 'urbane miss'" do
		"urbane miss".en.a.should == "an urbane miss"
	end

	it "uses 'an' as the indefinite article for 'urchin'" do
		"urchin".en.a.should == "an urchin"
	end

	it "uses 'a' as the indefinite article for 'urea detector'" do
		"urea detector".en.a.should == "a urea detector"
	end

	it "uses 'a' as the indefinite article for 'urethane monomer'" do
		"urethane monomer".en.a.should == "a urethane monomer"
	end

	it "uses 'an' as the indefinite article for 'urge'" do
		"urge".en.a.should == "an urge"
	end

	it "uses 'an' as the indefinite article for 'urgency'" do
		"urgency".en.a.should == "an urgency"
	end

	it "uses 'a' as the indefinite article for 'urinal'" do
		"urinal".en.a.should == "a urinal"
	end

	it "uses 'an' as the indefinite article for 'urn'" do
		"urn".en.a.should == "an urn"
	end

	it "uses 'a' as the indefinite article for 'usage'" do
		"usage".en.a.should == "a usage"
	end

	it "uses 'a' as the indefinite article for 'use'" do
		"use".en.a.should == "a use"
	end

	it "uses 'an' as the indefinite article for 'usher'" do
		"usher".en.a.should == "an usher"
	end

	it "uses 'a' as the indefinite article for 'usual suspect'" do
		"usual suspect".en.a.should == "a usual suspect"
	end

	it "uses 'a' as the indefinite article for 'usurer'" do
		"usurer".en.a.should == "a usurer"
	end

	it "uses 'a' as the indefinite article for 'usurper'" do
		"usurper".en.a.should == "a usurper"
	end

	it "uses 'a' as the indefinite article for 'utensil'" do
		"utensil".en.a.should == "a utensil"
	end

	it "uses 'a' as the indefinite article for 'utility'" do
		"utility".en.a.should == "a utility"
	end

	it "uses 'an' as the indefinite article for 'utmost urgency'" do
		"utmost urgency".en.a.should == "an utmost urgency"
	end

	it "uses 'a' as the indefinite article for 'utopia'" do
		"utopia".en.a.should == "a utopia"
	end

	it "uses 'an' as the indefinite article for 'utterance'" do
		"utterance".en.a.should == "an utterance"
	end

	it "uses 'a' as the indefinite article for 'V.I.P.'" do
		"V.I.P.".en.a.should == "a V.I.P."
	end

	it "uses 'a' as the indefinite article for 'VIPER'" do
		"VIPER".en.a.should == "a VIPER"
	end

	it "uses 'a' as the indefinite article for 'viper'" do
		"viper".en.a.should == "a viper"
	end

	it "uses 'an' as the indefinite article for 'X-ray'" do
		"X-ray".en.a.should == "an X-ray"
	end

	it "uses 'an' as the indefinite article for 'X.O.'" do
		"X.O.".en.a.should == "an X.O."
	end

	it "uses 'a' as the indefinite article for 'XYLAPHONE'" do
		"XYLAPHONE".en.a.should == "a XYLAPHONE"
	end

	it "uses 'an' as the indefinite article for 'XY chromosome'" do
		"XY chromosome".en.a.should == "an XY chromosome"
	end

	it "uses 'a' as the indefinite article for 'xenophobe'" do
		"xenophobe".en.a.should == "a xenophobe"
	end

	it "uses 'a' as the indefinite article for 'Y-shaped pipe'" do
		"Y-shaped pipe".en.a.should == "a Y-shaped pipe"
	end

	it "uses 'a' as the indefinite article for 'Y.Z. plane'" do
		"Y.Z. plane".en.a.should == "a Y.Z. plane"
	end

	it "uses 'a' as the indefinite article for 'YMCA'" do
		"YMCA".en.a.should == "a YMCA"
	end

	it "uses 'an' as the indefinite article for 'YBLENT eye'" do
		"YBLENT eye".en.a.should == "an YBLENT eye"
	end

	it "uses 'an' as the indefinite article for 'yblent eye'" do
		"yblent eye".en.a.should == "an yblent eye"
	end

	it "uses 'an' as the indefinite article for 'yclad body'" do
		"yclad body".en.a.should == "an yclad body"
	end

	it "uses 'a' as the indefinite article for 'yellowing'" do
		"yellowing".en.a.should == "a yellowing"
	end

	it "uses 'a' as the indefinite article for 'yield'" do
		"yield".en.a.should == "a yield"
	end

	it "uses 'a' as the indefinite article for 'youth'" do
		"youth".en.a.should == "a youth"
	end

	it "uses 'a' as the indefinite article for 'youth'" do
		"youth".en.a.should == "a youth"
	end

	it "uses 'an' as the indefinite article for 'ypsiliform junction'" do
		"ypsiliform junction".en.a.should == "an ypsiliform junction"
	end

	it "uses 'an' as the indefinite article for 'yttrium atom'" do
		"yttrium atom".en.a.should == "an yttrium atom"
	end

	it "uses 'a' as the indefinite article for 'zoo'" do
		"zoo".en.a.should == "a zoo"
	end


	it "uses correct pluralization to form the negative article" do
		"mouse".en.no.should == "no mice"
	end

	it "uses currect pluralization for noun phrases to form the negative article" do
		"univariate statistic".en.no.should == "no univariate statistics"
	end

	it "uses the correct pluralization for 'Secretary of State' to form the negative article" do
		"Secretary of State".en.no.should == "no Secretaries of State"
	end


	context "lprintf formatters" do

		it "registers the :A lprintf formatter" do
			Linguistics::EN.lprintf_formatters.should include( :A )
		end

		it "registers the :AN lprintf formatter" do
			Linguistics::EN.lprintf_formatters.should include( :AN )
		end

		it "adds an indefinite article to the argument to %A" do
			"You pick up %A.".en.lprintf( "umbrella" ).
				should == "You pick up an umbrella."
		end

		it "adds an indefinite article to the argument to %AN" do
			"You pick up %AN.".en.lprintf( "chocolate bar" ).
				should == "You pick up a chocolate bar."
		end

	end

end

