#!/usr/bin/env rspec -cfd

require_relative '../../helpers'

require 'rspec'

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
		expect( Linguistics::EN ).to have_extension( :articles )
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
			expect( monkeypatched_object.a ).to eq( 'an antelope' )
		end

		it "uses correct pluralization to form the negative article" do
			expect( monkeypatched_object.no ).to eq( 'no antelopes' )
		end

	end


	it "uses 'an' as the indefinite article for 'A.B.C'" do
		expect( "A.B.C".en.a ).to eq( "an A.B.C" )
	end

	it "uses 'an' as the indefinite article for 'AI'" do
		expect( "AI".en.a ).to eq( "an AI" )
	end

	it "uses 'an' as the indefinite article for 'AGE'" do
		expect( "AGE".en.a ).to eq( "an AGE" )
	end

	it "uses 'an' as the indefinite article for 'agendum'" do
		expect( "agendum".en.a ).to eq( "an agendum" )
	end

	it "uses 'an' as the indefinite article for 'aide-de-camp'" do
		expect( "aide-de-camp".en.a ).to eq( "an aide-de-camp" )
	end

	it "uses 'an' as the indefinite article for 'albino'" do
		expect( "albino".en.a ).to eq( "an albino" )
	end

	it "uses 'a' as the indefinite article for 'B.L.T. sandwich'" do
		expect( "B.L.T. sandwich".en.a ).to eq( "a B.L.T. sandwich" )
	end

	it "uses 'a' as the indefinite article for 'BMW'" do
		expect( "BMW".en.a ).to eq( "a BMW" )
	end

	it "uses 'a' as the indefinite article for 'BLANK'" do
		expect( "BLANK".en.a ).to eq( "a BLANK" )
	end

	it "uses 'a' as the indefinite article for 'bacterium'" do
		expect( "bacterium".en.a ).to eq( "a bacterium" )
	end

	it "uses 'a' as the indefinite article for 'Burmese restaurant'" do
		expect( "Burmese restaurant".en.a ).to eq( "a Burmese restaurant" )
	end

	it "uses 'a' as the indefinite article for 'C.O.'" do
		expect( "C.O.".en.a ).to eq( "a C.O." )
	end

	it "uses 'a' as the indefinite article for 'CCD'" do
		expect( "CCD".en.a ).to eq( "a CCD" )
	end

	it "uses 'a' as the indefinite article for 'COLON'" do
		expect( "COLON".en.a ).to eq( "a COLON" )
	end

	it "uses 'a' as the indefinite article for 'cameo'" do
		expect( "cameo".en.a ).to eq( "a cameo" )
	end

	it "uses 'a' as the indefinite article for 'CAPITAL'" do
		expect( "CAPITAL".en.a ).to eq( "a CAPITAL" )
	end

	it "uses 'a' as the indefinite article for 'D.S.M.'" do
		expect( "D.S.M.".en.a ).to eq( "a D.S.M." )
	end

	it "uses 'a' as the indefinite article for 'DNR'" do
		expect( "DNR".en.a ).to eq( "a DNR" )
	end

	it "uses 'a' as the indefinite article for 'DINNER'" do
		expect( "DINNER".en.a ).to eq( "a DINNER" )
	end

	it "uses 'a' as the indefinite article for 'dynamo'" do
		expect( "dynamo".en.a ).to eq( "a dynamo" )
	end

	it "uses 'an' as the indefinite article for 'E.K.G.'" do
		expect( "E.K.G.".en.a ).to eq( "an E.K.G." )
	end

	it "uses 'an' as the indefinite article for 'ECG'" do
		expect( "ECG".en.a ).to eq( "an ECG" )
	end

	it "uses 'an' as the indefinite article for 'EGG'" do
		expect( "EGG".en.a ).to eq( "an EGG" )
	end

	it "uses 'an' as the indefinite article for 'embryo'" do
		expect( "embryo".en.a ).to eq( "an embryo" )
	end

	it "uses 'an' as the indefinite article for 'erratum'" do
		expect( "erratum".en.a ).to eq( "an erratum" )
	end

	it "uses 'a' as the indefinite article for 'eucalyptus'" do
		expect( "eucalyptus".en.a ).to eq( "a eucalyptus" )
	end

	it "uses 'an' as the indefinite article for 'Euler number'" do
		expect( "Euler number".en.a ).to eq( "an Euler number" )
	end

	it "uses 'a' as the indefinite article for 'eulogy'" do
		expect( "eulogy".en.a ).to eq( "a eulogy" )
	end

	it "uses 'a' as the indefinite article for 'euphemism'" do
		expect( "euphemism".en.a ).to eq( "a euphemism" )
	end

	it "uses 'a' as the indefinite article for 'euphoria'" do
		expect( "euphoria".en.a ).to eq( "a euphoria" )
	end

	it "uses 'a' as the indefinite article for 'ewe'" do
		expect( "ewe".en.a ).to eq( "a ewe" )
	end

	it "uses 'a' as the indefinite article for 'ewer'" do
		expect( "ewer".en.a ).to eq( "a ewer" )
	end

	it "uses 'an' as the indefinite article for 'extremum'" do
		expect( "extremum".en.a ).to eq( "an extremum" )
	end

	it "uses 'an' as the indefinite article for 'eye'" do
		expect( "eye".en.a ).to eq( "an eye" )
	end

	it "uses 'an' as the indefinite article for 'F.B.I. agent'" do
		expect( "F.B.I. agent".en.a ).to eq( "an F.B.I. agent" )
	end

	it "uses 'an' as the indefinite article for 'FSM'" do
		expect( "FSM".en.a ).to eq( "an FSM" )
	end

	it "uses 'a' as the indefinite article for 'FACT'" do
		expect( "FACT".en.a ).to eq( "a FACT" )
	end

	it "uses 'a' as the indefinite article for 'FAQ'" do
		expect( "FAQ".en.a ).to eq( "a FAQ" )
	end

	it "uses 'an' as the indefinite article for 'F.A.Q.'" do
		expect( "F.A.Q.".en.a ).to eq( "an F.A.Q." )
	end

	it "uses 'a' as the indefinite article for 'fish'" do
		expect( "fish".en.a ).to eq( "a fish" )
	end

	it "uses 'a' as the indefinite article for 'G-string'" do
		expect( "G-string".en.a ).to eq( "a G-string" )
	end

	it "uses 'a' as the indefinite article for 'GSM phone'" do
		expect( "GSM phone".en.a ).to eq( "a GSM phone" )
	end

	it "uses 'a' as the indefinite article for 'GOD'" do
		expect( "GOD".en.a ).to eq( "a GOD" )
	end

	it "uses 'a' as the indefinite article for 'genus'" do
		expect( "genus".en.a ).to eq( "a genus" )
	end

	it "uses 'a' as the indefinite article for 'Governor General'" do
		expect( "Governor General".en.a ).to eq( "a Governor General" )
	end

	it "uses 'an' as the indefinite article for 'H-Bomb'" do
		expect( "H-Bomb".en.a ).to eq( "an H-Bomb" )
	end

	it "uses 'an' as the indefinite article for 'H.M.S Ark Royal'" do
		expect( "H.M.S Ark Royal".en.a ).to eq( "an H.M.S Ark Royal" )
	end

	it "uses 'an' as the indefinite article for 'HSL colour space'" do
		expect( "HSL colour space".en.a ).to eq( "an HSL colour space" )
	end

	it "uses 'a' as the indefinite article for 'HAL 9000'" do
		expect( "HAL 9000".en.a ).to eq( "a HAL 9000" )
	end

	it "uses 'an' as the indefinite article for 'H.A.L. 9000'" do
		expect( "H.A.L. 9000".en.a ).to eq( "an H.A.L. 9000" )
	end

	it "uses 'a' as the indefinite article for 'has-been'" do
		expect( "has-been".en.a ).to eq( "a has-been" )
	end

	it "uses 'a' as the indefinite article for 'height'" do
		expect( "height".en.a ).to eq( "a height" )
	end

	it "uses 'an' as the indefinite article for 'heir'" do
		expect( "heir".en.a ).to eq( "an heir" )
	end

	it "uses 'a' as the indefinite article for 'honed blade'" do
		expect( "honed blade".en.a ).to eq( "a honed blade" )
	end

	it "uses 'an' as the indefinite article for 'honest man'" do
		expect( "honest man".en.a ).to eq( "an honest man" )
	end

	it "uses 'a' as the indefinite article for 'honeymoon'" do
		expect( "honeymoon".en.a ).to eq( "a honeymoon" )
	end

	it "uses 'an' as the indefinite article for 'honorarium'" do
		expect( "honorarium".en.a ).to eq( "an honorarium" )
	end

	it "uses 'an' as the indefinite article for 'honorary degree'" do
		expect( "honorary degree".en.a ).to eq( "an honorary degree" )
	end

	it "uses 'an' as the indefinite article for 'honoree'" do
		expect( "honoree".en.a ).to eq( "an honoree" )
	end

	it "uses 'an' as the indefinite article for 'honorific'" do
		expect( "honorific".en.a ).to eq( "an honorific" )
	end

	it "uses 'a' as the indefinite article for 'Hough transform'" do
		expect( "Hough transform".en.a ).to eq( "a Hough transform" )
	end

	it "uses 'a' as the indefinite article for 'hound'" do
		expect( "hound".en.a ).to eq( "a hound" )
	end

	it "uses 'an' as the indefinite article for 'hour'" do
		expect( "hour".en.a ).to eq( "an hour" )
	end

	it "uses 'an' as the indefinite article for 'hourglass'" do
		expect( "hourglass".en.a ).to eq( "an hourglass" )
	end

	it "uses 'a' as the indefinite article for 'houri'" do
		expect( "houri".en.a ).to eq( "a houri" )
	end

	it "uses 'a' as the indefinite article for 'house'" do
		expect( "house".en.a ).to eq( "a house" )
	end

	it "uses 'an' as the indefinite article for 'I.O.U.'" do
		expect( "I.O.U.".en.a ).to eq( "an I.O.U." )
	end

	it "uses 'an' as the indefinite article for 'IQ'" do
		expect( "IQ".en.a ).to eq( "an IQ" )
	end

	it "uses 'an' as the indefinite article for 'IDEA'" do
		expect( "IDEA".en.a ).to eq( "an IDEA" )
	end

	it "uses 'an' as the indefinite article for 'inferno'" do
		expect( "inferno".en.a ).to eq( "an inferno" )
	end

	it "uses 'an' as the indefinite article for 'Inspector General'" do
		expect( "Inspector General".en.a ).to eq( "an Inspector General" )
	end

	it "uses 'a' as the indefinite article for 'jumbo'" do
		expect( "jumbo".en.a ).to eq( "a jumbo" )
	end

	it "uses 'a' as the indefinite article for 'knife'" do
		expect( "knife".en.a ).to eq( "a knife" )
	end

	it "uses 'an' as the indefinite article for 'L.E.D.'" do
		expect( "L.E.D.".en.a ).to eq( "an L.E.D." )
	end

	it "uses 'a' as the indefinite article for 'LED'" do
		expect( "LED".en.a ).to eq( "a LED" )
	end

	it "uses 'an' as the indefinite article for 'LCD'" do
		expect( "LCD".en.a ).to eq( "an LCD" )
	end

	it "uses 'a' as the indefinite article for 'lady in waiting'" do
		expect( "lady in waiting".en.a ).to eq( "a lady in waiting" )
	end

	it "uses 'a' as the indefinite article for 'leaf'" do
		expect( "leaf".en.a ).to eq( "a leaf" )
	end

	it "uses 'an' as the indefinite article for 'M.I.A.'" do
		expect( "M.I.A.".en.a ).to eq( "an M.I.A." )
	end

	it "uses 'a' as the indefinite article for 'MIASMA'" do
		expect( "MIASMA".en.a ).to eq( "a MIASMA" )
	end

	it "uses 'an' as the indefinite article for 'MTV channel'" do
		expect( "MTV channel".en.a ).to eq( "an MTV channel" )
	end

	it "uses 'a' as the indefinite article for 'Major General'" do
		expect( "Major General".en.a ).to eq( "a Major General" )
	end

	it "uses 'an' as the indefinite article for 'N.C.O.'" do
		expect( "N.C.O.".en.a ).to eq( "an N.C.O." )
	end

	it "uses 'an' as the indefinite article for 'NCO'" do
		expect( "NCO".en.a ).to eq( "an NCO" )
	end

	it "uses 'a' as the indefinite article for 'NATO country'" do
		expect( "NATO country".en.a ).to eq( "a NATO country" )
	end

	it "uses 'a' as the indefinite article for 'note'" do
		expect( "note".en.a ).to eq( "a note" )
	end

	it "uses 'an' as the indefinite article for 'O.K.'" do
		expect( "O.K.".en.a ).to eq( "an O.K." )
	end

	it "uses 'an' as the indefinite article for 'OK'" do
		expect( "OK".en.a ).to eq( "an OK" )
	end

	it "uses 'an' as the indefinite article for 'OLE'" do
		expect( "OLE".en.a ).to eq( "an OLE" )
	end

	it "uses 'an' as the indefinite article for 'octavo'" do
		expect( "octavo".en.a ).to eq( "an octavo" )
	end

	it "uses 'an' as the indefinite article for 'octopus'" do
		expect( "octopus".en.a ).to eq( "an octopus" )
	end

	it "uses 'an' as the indefinite article for 'okay'" do
		expect( "okay".en.a ).to eq( "an okay" )
	end

	it "uses 'a' as the indefinite article for 'once-and-future-king'" do
		expect( "once-and-future-king".en.a ).to eq( "a once-and-future-king" )
	end

	it "uses 'an' as the indefinite article for 'oncologist'" do
		expect( "oncologist".en.a ).to eq( "an oncologist" )
	end

	it "uses 'a' as the indefinite article for 'one night stand'" do
		expect( "one night stand".en.a ).to eq( "a one night stand" )
	end

	it "uses 'an' as the indefinite article for 'onerous task'" do
		expect( "onerous task".en.a ).to eq( "an onerous task" )
	end

	it "uses 'an' as the indefinite article for 'opera'" do
		expect( "opera".en.a ).to eq( "an opera" )
	end

	it "uses 'an' as the indefinite article for 'optimum'" do
		expect( "optimum".en.a ).to eq( "an optimum" )
	end

	it "uses 'an' as the indefinite article for 'opus'" do
		expect( "opus".en.a ).to eq( "an opus" )
	end

	it "uses 'an' as the indefinite article for 'ox'" do
		expect( "ox".en.a ).to eq( "an ox" )
	end

	it "uses 'a' as the indefinite article for 'Ph.D.'" do
		expect( "Ph.D.".en.a ).to eq( "a Ph.D." )
	end

	it "uses 'a' as the indefinite article for 'PET'" do
		expect( "PET".en.a ).to eq( "a PET" )
	end

	it "uses 'a' as the indefinite article for 'P.E.T. scan'" do
		expect( "P.E.T. scan".en.a ).to eq( "a P.E.T. scan" )
	end

	it "uses 'a' as the indefinite article for 'plateau'" do
		expect( "plateau".en.a ).to eq( "a plateau" )
	end

	it "uses 'a' as the indefinite article for 'quantum'" do
		expect( "quantum".en.a ).to eq( "a quantum" )
	end

	it "uses 'an' as the indefinite article for 'R.S.V.P.'" do
		expect( "R.S.V.P.".en.a ).to eq( "an R.S.V.P." )
	end

	it "uses 'an' as the indefinite article for 'RSVP'" do
		expect( "RSVP".en.a ).to eq( "an RSVP" )
	end

	it "uses 'a' as the indefinite article for 'REST'" do
		expect( "REST".en.a ).to eq( "a REST" )
	end

	it "uses 'a' as the indefinite article for 'reindeer'" do
		expect( "reindeer".en.a ).to eq( "a reindeer" )
	end

	it "uses 'an' as the indefinite article for 'S.O.S.'" do
		expect( "S.O.S.".en.a ).to eq( "an S.O.S." )
	end

	it "uses 'a' as the indefinite article for 'SUM'" do
		expect( "SUM".en.a ).to eq( "a SUM" )
	end

	it "uses 'an' as the indefinite article for 'SST'" do
		expect( "SST".en.a ).to eq( "an SST" )
	end

	it "uses 'a' as the indefinite article for 'salmon'" do
		expect( "salmon".en.a ).to eq( "a salmon" )
	end

	it "uses 'a' as the indefinite article for 'T.N.T. bomb'" do
		expect( "T.N.T. bomb".en.a ).to eq( "a T.N.T. bomb" )
	end

	it "uses 'a' as the indefinite article for 'TNT bomb'" do
		expect( "TNT bomb".en.a ).to eq( "a TNT bomb" )
	end

	it "uses 'a' as the indefinite article for 'TENT'" do
		expect( "TENT".en.a ).to eq( "a TENT" )
	end

	it "uses 'a' as the indefinite article for 'thought'" do
		expect( "thought".en.a ).to eq( "a thought" )
	end

	it "uses 'a' as the indefinite article for 'tomato'" do
		expect( "tomato".en.a ).to eq( "a tomato" )
	end

	it "uses 'a' as the indefinite article for 'U-boat'" do
		expect( "U-boat".en.a ).to eq( "a U-boat" )
	end

	it "uses 'a' as the indefinite article for 'U.F.O.'" do
		expect( "U.F.O.".en.a ).to eq( "a U.F.O." )
	end

	it "uses 'a' as the indefinite article for 'UFO'" do
		expect( "UFO".en.a ).to eq( "a UFO" )
	end

	it "uses 'a' as the indefinite article for 'ubiquity'" do
		expect( "ubiquity".en.a ).to eq( "a ubiquity" )
	end

	it "uses 'a' as the indefinite article for 'unicorn'" do
		expect( "unicorn".en.a ).to eq( "a unicorn" )
	end

	it "uses 'an' as the indefinite article for 'unidentified flying object'" do
		expect( "unidentified flying object".en.a ).to eq( "an unidentified flying object" )
	end

	it "uses 'a' as the indefinite article for 'uniform'" do
		expect( "uniform".en.a ).to eq( "a uniform" )
	end

	it "uses 'a' as the indefinite article for 'unimodal system'" do
		expect( "unimodal system".en.a ).to eq( "a unimodal system" )
	end

	it "uses 'an' as the indefinite article for 'unimpressive record'" do
		expect( "unimpressive record".en.a ).to eq( "an unimpressive record" )
	end

	it "uses 'an' as the indefinite article for 'uninformed opinion'" do
		expect( "uninformed opinion".en.a ).to eq( "an uninformed opinion" )
	end

	it "uses 'an' as the indefinite article for 'uninvited guest'" do
		expect( "uninvited guest".en.a ).to eq( "an uninvited guest" )
	end

	it "uses 'a' as the indefinite article for 'union'" do
		expect( "union".en.a ).to eq( "a union" )
	end

	it "uses 'a' as the indefinite article for 'uniplex'" do
		expect( "uniplex".en.a ).to eq( "a uniplex" )
	end

	it "uses 'a' as the indefinite article for 'uniprocessor'" do
		expect( "uniprocessor".en.a ).to eq( "a uniprocessor" )
	end

	it "uses 'a' as the indefinite article for 'unique opportunity'" do
		expect( "unique opportunity".en.a ).to eq( "a unique opportunity" )
	end

	it "uses 'a' as the indefinite article for 'unisex hairdresser'" do
		expect( "unisex hairdresser".en.a ).to eq( "a unisex hairdresser" )
	end

	it "uses 'a' as the indefinite article for 'unison'" do
		expect( "unison".en.a ).to eq( "a unison" )
	end

	it "uses 'a' as the indefinite article for 'unit'" do
		expect( "unit".en.a ).to eq( "a unit" )
	end

	it "uses 'a' as the indefinite article for 'unitarian'" do
		expect( "unitarian".en.a ).to eq( "a unitarian" )
	end

	it "uses 'a' as the indefinite article for 'united front'" do
		expect( "united front".en.a ).to eq( "a united front" )
	end

	it "uses 'a' as the indefinite article for 'unity'" do
		expect( "unity".en.a ).to eq( "a unity" )
	end

	it "uses 'a' as the indefinite article for 'univalent bond'" do
		expect( "univalent bond".en.a ).to eq( "a univalent bond" )
	end

	it "uses 'a' as the indefinite article for 'univariate statistic'" do
		expect( "univariate statistic".en.a ).to eq( "a univariate statistic" )
	end

	it "uses 'a' as the indefinite article for 'universe'" do
		expect( "universe".en.a ).to eq( "a universe" )
	end

	it "uses 'an' as the indefinite article for 'unordered meal'" do
		expect( "unordered meal".en.a ).to eq( "an unordered meal" )
	end

	it "uses 'a' as the indefinite article for 'uranium atom'" do
		expect( "uranium atom".en.a ).to eq( "a uranium atom" )
	end

	it "uses 'an' as the indefinite article for 'urban myth'" do
		expect( "urban myth".en.a ).to eq( "an urban myth" )
	end

	it "uses 'an' as the indefinite article for 'urbane miss'" do
		expect( "urbane miss".en.a ).to eq( "an urbane miss" )
	end

	it "uses 'an' as the indefinite article for 'urchin'" do
		expect( "urchin".en.a ).to eq( "an urchin" )
	end

	it "uses 'a' as the indefinite article for 'urea detector'" do
		expect( "urea detector".en.a ).to eq( "a urea detector" )
	end

	it "uses 'a' as the indefinite article for 'urethane monomer'" do
		expect( "urethane monomer".en.a ).to eq( "a urethane monomer" )
	end

	it "uses 'an' as the indefinite article for 'urge'" do
		expect( "urge".en.a ).to eq( "an urge" )
	end

	it "uses 'an' as the indefinite article for 'urgency'" do
		expect( "urgency".en.a ).to eq( "an urgency" )
	end

	it "uses 'a' as the indefinite article for 'urinal'" do
		expect( "urinal".en.a ).to eq( "a urinal" )
	end

	it "uses 'an' as the indefinite article for 'urn'" do
		expect( "urn".en.a ).to eq( "an urn" )
	end

	it "uses 'a' as the indefinite article for 'usage'" do
		expect( "usage".en.a ).to eq( "a usage" )
	end

	it "uses 'a' as the indefinite article for 'use'" do
		expect( "use".en.a ).to eq( "a use" )
	end

	it "uses 'an' as the indefinite article for 'usher'" do
		expect( "usher".en.a ).to eq( "an usher" )
	end

	it "uses 'a' as the indefinite article for 'usual suspect'" do
		expect( "usual suspect".en.a ).to eq( "a usual suspect" )
	end

	it "uses 'a' as the indefinite article for 'usurer'" do
		expect( "usurer".en.a ).to eq( "a usurer" )
	end

	it "uses 'a' as the indefinite article for 'usurper'" do
		expect( "usurper".en.a ).to eq( "a usurper" )
	end

	it "uses 'a' as the indefinite article for 'utensil'" do
		expect( "utensil".en.a ).to eq( "a utensil" )
	end

	it "uses 'a' as the indefinite article for 'utility'" do
		expect( "utility".en.a ).to eq( "a utility" )
	end

	it "uses 'an' as the indefinite article for 'utmost urgency'" do
		expect( "utmost urgency".en.a ).to eq( "an utmost urgency" )
	end

	it "uses 'a' as the indefinite article for 'utopia'" do
		expect( "utopia".en.a ).to eq( "a utopia" )
	end

	it "uses 'an' as the indefinite article for 'utterance'" do
		expect( "utterance".en.a ).to eq( "an utterance" )
	end

	it "uses 'a' as the indefinite article for 'V.I.P.'" do
		expect( "V.I.P.".en.a ).to eq( "a V.I.P." )
	end

	it "uses 'a' as the indefinite article for 'VIPER'" do
		expect( "VIPER".en.a ).to eq( "a VIPER" )
	end

	it "uses 'a' as the indefinite article for 'viper'" do
		expect( "viper".en.a ).to eq( "a viper" )
	end

	it "uses 'an' as the indefinite article for 'X-ray'" do
		expect( "X-ray".en.a ).to eq( "an X-ray" )
	end

	it "uses 'an' as the indefinite article for 'X.O.'" do
		expect( "X.O.".en.a ).to eq( "an X.O." )
	end

	it "uses 'a' as the indefinite article for 'XYLAPHONE'" do
		expect( "XYLAPHONE".en.a ).to eq( "a XYLAPHONE" )
	end

	it "uses 'an' as the indefinite article for 'XY chromosome'" do
		expect( "XY chromosome".en.a ).to eq( "an XY chromosome" )
	end

	it "uses 'a' as the indefinite article for 'xenophobe'" do
		expect( "xenophobe".en.a ).to eq( "a xenophobe" )
	end

	it "uses 'a' as the indefinite article for 'Y-shaped pipe'" do
		expect( "Y-shaped pipe".en.a ).to eq( "a Y-shaped pipe" )
	end

	it "uses 'a' as the indefinite article for 'Y.Z. plane'" do
		expect( "Y.Z. plane".en.a ).to eq( "a Y.Z. plane" )
	end

	it "uses 'a' as the indefinite article for 'YMCA'" do
		expect( "YMCA".en.a ).to eq( "a YMCA" )
	end

	it "uses 'an' as the indefinite article for 'YBLENT eye'" do
		expect( "YBLENT eye".en.a ).to eq( "an YBLENT eye" )
	end

	it "uses 'an' as the indefinite article for 'yblent eye'" do
		expect( "yblent eye".en.a ).to eq( "an yblent eye" )
	end

	it "uses 'an' as the indefinite article for 'yclad body'" do
		expect( "yclad body".en.a ).to eq( "an yclad body" )
	end

	it "uses 'a' as the indefinite article for 'yellowing'" do
		expect( "yellowing".en.a ).to eq( "a yellowing" )
	end

	it "uses 'a' as the indefinite article for 'yield'" do
		expect( "yield".en.a ).to eq( "a yield" )
	end

	it "uses 'a' as the indefinite article for 'youth'" do
		expect( "youth".en.a ).to eq( "a youth" )
	end

	it "uses 'a' as the indefinite article for 'youth'" do
		expect( "youth".en.a ).to eq( "a youth" )
	end

	it "uses 'an' as the indefinite article for 'ypsiliform junction'" do
		expect( "ypsiliform junction".en.a ).to eq( "an ypsiliform junction" )
	end

	it "uses 'an' as the indefinite article for 'yttrium atom'" do
		expect( "yttrium atom".en.a ).to eq( "an yttrium atom" )
	end

	it "uses 'a' as the indefinite article for 'zoo'" do
		expect( "zoo".en.a ).to eq( "a zoo" )
	end


	it "uses correct pluralization to form the negative article" do
		expect( "mouse".en.no ).to eq( "no mice" )
	end

	it "uses currect pluralization for noun phrases to form the negative article" do
		expect( "univariate statistic".en.no ).to eq( "no univariate statistics" )
	end

	it "uses the correct pluralization for 'Secretary of State' to form the negative article" do
		expect( "Secretary of State".en.no ).to eq( "no Secretaries of State" )
	end


	context "lprintf formatters" do

		it "registers the :A lprintf formatter" do
			expect( Linguistics::EN.lprintf_formatters ).to include( :A )
		end

		it "registers the :AN lprintf formatter" do
			expect( Linguistics::EN.lprintf_formatters ).to include( :AN )
		end

		it "adds an indefinite article to the argument to %A" do
			expect(
				"You pick up %A.".en.lprintf( "umbrella" )
			).to eq( "You pick up an umbrella." )
		end

		it "adds an indefinite article to the argument to %AN" do
			expect(
				"You pick up %AN.".en.lprintf( "chocolate bar" )
			).to eq( "You pick up a chocolate bar." )
		end

	end

end

