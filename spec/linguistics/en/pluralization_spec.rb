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


describe Linguistics::EN::Pluralization do
	include Linguistics::SpecHelpers

	before( :all ) do
		setup_logging( :fatal )
		Linguistics.use( :en )
	end

	after( :all ) do
		reset_logging()
	end


	it "pluralizes 'a' as 'some'" do
		'a'.en.plural.should == 'some'
	end

	# NOUN FORM
	it "pluralizes 'a' (as a noun) as 'as'" do
		'a'.en.plural_noun.should == 'as'
	end

	it "pluralizes 'A.C.R.O.N.Y.M.' as 'A.C.R.O.N.Y.M.s'" do
		'A.C.R.O.N.Y.M.'.en.plural.should == 'A.C.R.O.N.Y.M.s' # 
	end

	it "pluralizes 'abscissa' as 'abscissas'" do
		'abscissa'.en.plural.should == 'abscissas'
	end

	it "pluralizes 'abscissa' as 'abscissae' in classical mode" do
		Linguistics::EN.in_classical_mode do
			'abscissa'.en.plural.should == 'abscissae'
		end
	end

	it "pluralizes 'Achinese' as 'Achinese'" do
		'Achinese'.en.plural.should == 'Achinese' # 
	end

	it "pluralizes 'acropolis' as 'acropolises'" do
		'acropolis'.en.plural.should == 'acropolises' # 
	end

	it "pluralizes 'adieu' as 'adieus'" do
		'adieu'.en.plural.should == 'adieus'
	end

	it "pluralizes 'adieu' as 'adieux' in classical mode" do
		Linguistics::EN.in_classical_mode do
			'adieu'.en.plural.should == 'adieux'
		end
	end

	it "pluralizes 'adjutant general' as 'adjutant generals'" do
		'adjutant general'.en.plural.should == 'adjutant generals' # 
	end

	it "pluralizes 'aegis' as 'aegises'" do
		'aegis'.en.plural.should == 'aegises' # 
	end

	it "pluralizes 'afflatus' as 'afflatuses'" do
		'afflatus'.en.plural.should == 'afflatuses' # 
	end

	it "pluralizes 'afreet' as 'afreets'" do
		'afreet'.en.plural.should == 'afreets'
	end

	it "pluralizes 'afreet' as 'afreeti' in classical mode" do
		Linguistics::EN.in_classical_mode do
			'afreet'.en.plural.should == 'afreeti'
		end
	end

	it "pluralizes 'afrit' as 'afrits'" do
		'afrit'.en.plural.should == 'afrits'
	end

	it "pluralizes 'afrit' as 'afriti' in classical mode" do
		Linguistics::EN.in_classical_mode do
			'afrit'.en.plural.should == 'afriti'
		end
	end

	it "pluralizes 'agendum' as 'agenda'" do
		'agendum'.en.plural.should == 'agenda' # 
	end

	it "pluralizes 'aide-de-camp' as 'aides-de-camp'" do
		'aide-de-camp'.en.plural.should == 'aides-de-camp' # 
	end

	it "pluralizes 'Alabaman' as 'Alabamans'" do
		'Alabaman'.en.plural.should == 'Alabamans' # 
	end

	it "pluralizes 'albino' as 'albinos'" do
		'albino'.en.plural.should == 'albinos' # 
	end

	it "pluralizes 'album' as 'albums'" do
		'album'.en.plural.should == 'albums' # 
	end

	it "pluralizes 'Alfurese' as 'Alfurese'" do
		'Alfurese'.en.plural.should == 'Alfurese' # 
	end

	it "pluralizes 'alga' as 'algae'" do
		'alga'.en.plural.should == 'algae' # 
	end

	it "pluralizes 'alias' as 'aliases'" do
		'alias'.en.plural.should == 'aliases' # 
	end

	it "pluralizes 'alto' as 'altos'" do
		'alto'.en.plural.should == 'altos'
	end

	it "pluralizes 'alto' as 'alti' in classical mode" do
		Linguistics::EN.in_classical_mode do
			'alto'.en.plural.should == 'alti'
		end
	end

	it "pluralizes 'alumna' as 'alumnae'" do
		'alumna'.en.plural.should == 'alumnae' # 
	end

	it "pluralizes 'alumnus' as 'alumni'" do
		'alumnus'.en.plural.should == 'alumni' # 
	end

	it "pluralizes 'alveolus' as 'alveoli'" do
		'alveolus'.en.plural.should == 'alveoli' # 
	end

	it "pluralizes 'am' as 'are'" do
		'am'.en.plural.should == 'are' # 
	end

	it "pluralizes 'am going' as 'are going'" do
		'am going'.en.plural.should == 'are going' # 
	end

	it "pluralizes 'ambassador-at-large' as 'ambassadors-at-large'" do
		'ambassador-at-large'.en.plural.should == 'ambassadors-at-large' # 
	end

	it "pluralizes 'Amboinese' as 'Amboinese'" do
		'Amboinese'.en.plural.should == 'Amboinese' # 
	end

	it "pluralizes 'Americanese' as 'Americanese'" do
		'Americanese'.en.plural.should == 'Americanese' # 
	end

	it "pluralizes 'amoeba' as 'amoebas'" do
		'amoeba'.en.plural.should == 'amoebas'
	end

	it "pluralizes 'amoeba' as 'amoebae' in classical mode" do
		Linguistics::EN.in_classical_mode do
			'amoeba'.en.plural.should == 'amoebae'
		end
	end

	it "pluralizes 'Amoyese' as 'Amoyese'" do
		'Amoyese'.en.plural.should == 'Amoyese' # 
	end

	# INDEFINITE ARTICLE
	it "pluralizes 'an' as 'some'" do
		'an'.en.plural.should == 'some' # 
	end

	it "pluralizes 'analysis' as 'analyses'" do
		'analysis'.en.plural.should == 'analyses' # 
	end

	it "pluralizes 'anathema' as 'anathemas'" do
		'anathema'.en.plural.should == 'anathemas'
	end

	it "pluralizes 'anathema' as 'anathemata' in classical mode" do
		Linguistics::EN.in_classical_mode do
			'anathema'.en.plural.should == 'anathemata'
		end
	end

	it "pluralizes 'Andamanese' as 'Andamanese'" do
		'Andamanese'.en.plural.should == 'Andamanese' # 
	end

	it "pluralizes 'Angolese' as 'Angolese'" do
		'Angolese'.en.plural.should == 'Angolese' # 
	end

	it "pluralizes 'Annamese' as 'Annamese'" do
		'Annamese'.en.plural.should == 'Annamese' # 
	end

	it "pluralizes 'antenna' as 'antennas'" do
		'antenna'.en.plural.should == 'antennas'
	end

	it "pluralizes 'antenna' as 'antennae' in classical mode" do
		Linguistics::EN.in_classical_mode do
			'antenna'.en.plural.should == 'antennae'
		end
	end

	it "pluralizes 'anus' as 'anuses'" do
		'anus'.en.plural.should == 'anuses' # 
	end

	it "pluralizes 'apex' as 'apexes'" do
		'apex'.en.plural.should == 'apexes'
	end

	it "pluralizes 'apex' as 'apices' in classical mode" do
		Linguistics::EN.in_classical_mode do
			'apex'.en.plural.should == 'apices'
		end
	end

	# POSSESSIVE FORM
	it "pluralizes 'apex's' as 'apexes''" do
		"apex's".en.plural.should == "apexes'" # apices'
	end

	it "pluralizes 'aphelion' as 'aphelia'" do
		'aphelion'.en.plural.should == 'aphelia' # 
	end

	it "pluralizes 'apparatus' as 'apparatuses'" do
		'apparatus'.en.plural.should == 'apparatuses'
	end

	it "pluralizes 'apparatus' as 'apparatus' in classical mode" do
		Linguistics::EN.in_classical_mode do
			'apparatus'.en.plural.should == 'apparatus'
		end
	end

	it "pluralizes 'appendix' as 'appendixes'" do
		'appendix'.en.plural.should == 'appendixes'
	end

	it "pluralizes 'appendix' as 'appendices' in classical mode" do
		Linguistics::EN.in_classical_mode do
			'appendix'.en.plural.should == 'appendices'
		end
	end

	it "pluralizes 'apple' as 'apples'" do
		'apple'.en.plural.should == 'apples' # 
	end

	it "pluralizes 'aquarium' as 'aquariums'" do
		'aquarium'.en.plural.should == 'aquariums'
	end

	it "pluralizes 'aquarium' as 'aquaria' in classical mode" do
		Linguistics::EN.in_classical_mode do
			'aquarium'.en.plural.should == 'aquaria'
		end
	end

	it "pluralizes 'Aragonese' as 'Aragonese'" do
		'Aragonese'.en.plural.should == 'Aragonese' # 
	end

	it "pluralizes 'Arakanese' as 'Arakanese'" do
		'Arakanese'.en.plural.should == 'Arakanese' # 
	end

	it "pluralizes 'archipelago' as 'archipelagos'" do
		'archipelago'.en.plural.should == 'archipelagos' # 
	end

	it "pluralizes 'are' as 'are'" do
		'are'.en.plural.should == 'are' # 
	end

	it "pluralizes 'are made' as 'are made'" do
		'are made'.en.plural.should == 'are made' # 
	end

	it "pluralizes 'armadillo' as 'armadillos'" do
		'armadillo'.en.plural.should == 'armadillos' # 
	end

	it "pluralizes 'arpeggio' as 'arpeggios'" do
		'arpeggio'.en.plural.should == 'arpeggios' # 
	end

	it "pluralizes 'arthritis' as 'arthritises'" do
		'arthritis'.en.plural.should == 'arthritises' # 
	end

	it "pluralizes 'asbestos' as 'asbestoses'" do
		'asbestos'.en.plural.should == 'asbestoses' # 
	end

	it "pluralizes 'asparagus' as 'asparaguses'" do
		'asparagus'.en.plural.should == 'asparaguses' # 
	end

	it "pluralizes 'ass' as 'asses'" do
		'ass'.en.plural.should == 'asses' # 
	end

	it "pluralizes 'Assamese' as 'Assamese'" do
		'Assamese'.en.plural.should == 'Assamese' # 
	end

	it "pluralizes 'asylum' as 'asylums'" do
		'asylum'.en.plural.should == 'asylums' # 
	end

	it "pluralizes 'asyndeton' as 'asyndeta'" do
		'asyndeton'.en.plural.should == 'asyndeta' # 
	end

	# ACCUSATIVE
	it "pluralizes 'at it' as 'at them'" do
		'at it'.en.plural.should == 'at them' # 
	end

	it "pluralizes 'ate' as 'ate'" do
		'ate'.en.plural.should == 'ate' # 
	end

	it "pluralizes 'atlas' as 'atlases'" do
		'atlas'.en.plural.should == 'atlases' # 
	end

	it "pluralizes 'attorney general' as 'attorneys general'" do
		'attorney general'.en.plural.should == 'attorneys general' # 
	end
	it "pluralizes 'attorney of record' as 'attorneys of record'" do
		'attorney of record'.en.plural.should == 'attorneys of record' # 
	end


	it "pluralizes 'aurora' as 'auroras'" do
		'aurora'.en.plural.should == 'auroras'
	end

	it "pluralizes 'aurora' as 'aurorae' in classical mode" do
		Linguistics::EN.in_classical_mode do
			'aurora'.en.plural.should == 'aurorae'
		end
	end


	it "pluralizes 'aviatrix' as 'aviatrixes'" do
		'aviatrix'.en.plural.should == 'aviatrixes'
	end

	it "pluralizes 'aviatrix' as 'aviatrices' in classical mode" do
		Linguistics::EN.in_classical_mode do
			'aviatrix'.en.plural.should == 'aviatrices'
		end
	end


	it "pluralizes 'aviatrix's' as 'aviatrixes''" do
		"aviatrix's".en.plural.should == "aviatrixes'" # aviatrices'
	end


	it "pluralizes 'Avignonese' as 'Avignonese'" do
		'Avignonese'.en.plural.should == 'Avignonese' # 
	end


	it "pluralizes 'axe' as 'axes'" do
		'axe'.en.plural.should == 'axes' # 
	end


	it "pluralizes 'axis' as 'axes'" do
		'axis'.en.plural.should == 'axes' # 
	end


	it "pluralizes 'Azerbaijanese' as 'Azerbaijanese'" do
		'Azerbaijanese'.en.plural.should == 'Azerbaijanese' # 
	end


	it "pluralizes 'bacillus' as 'bacilli'" do
		'bacillus'.en.plural.should == 'bacilli' # 
	end


	it "pluralizes 'bacterium' as 'bacteria'" do
		'bacterium'.en.plural.should == 'bacteria' # 
	end


	it "pluralizes 'Bahaman' as 'Bahamans'" do
		'Bahaman'.en.plural.should == 'Bahamans' # 
	end


	it "pluralizes 'Balinese' as 'Balinese'" do
		'Balinese'.en.plural.should == 'Balinese' # 
	end


	it "pluralizes 'bamboo' as 'bamboos'" do
		'bamboo'.en.plural.should == 'bamboos' # 
	end


	it "pluralizes 'banjo' as 'banjoes'" do
		'banjo'.en.plural.should == 'banjoes' # 
	end


	# INSTRUMENT, NOT FISH
	it "pluralizes 'bass' as 'basses'" do
		'bass'.en.plural.should == 'basses' # 
	end


	it "pluralizes 'basso' as 'bassos'" do
		'basso'.en.plural.should == 'bassos'
	end

	it "pluralizes 'basso' as 'bassi' in classical mode" do
		Linguistics::EN.in_classical_mode do
			'basso'.en.plural.should == 'bassi'
		end
	end


	it "pluralizes 'bathos' as 'bathoses'" do
		'bathos'.en.plural.should == 'bathoses' # 
	end


	it "pluralizes 'beau' as 'beaus'" do
		'beau'.en.plural.should == 'beaus'
	end

	it "pluralizes 'beau' as 'beaux' in classical mode" do
		Linguistics::EN.in_classical_mode do
			'beau'.en.plural.should == 'beaux'
		end
	end


	it "pluralizes 'beef' as 'beefs'" do
		'beef'.en.plural.should == 'beefs'
	end

	it "pluralizes 'beef' as 'beeves' in classical mode" do
		Linguistics::EN.in_classical_mode do
			'beef'.en.plural.should == 'beeves'
		end
	end


	# ACCUSATIVE
	it "pluralizes 'beneath it' as 'beneath them'" do
		'beneath it'.en.plural.should == 'beneath them' # 
	end


	it "pluralizes 'Bengalese' as 'Bengalese'" do
		'Bengalese'.en.plural.should == 'Bengalese' # 
	end


	# VERB FORM
	it "pluralizes 'bent' (as a verb) as 'bent'" do
		'bent'.en.plural_verb.should == 'bent' # 
	end


	# NOUN FORM
	it "pluralizes 'bent' as 'bents'" do
		'bent'.en.plural.should == 'bents' # 
	end


	it "pluralizes 'Bernese' as 'Bernese'" do
		'Bernese'.en.plural.should == 'Bernese' # 
	end


	it "pluralizes 'Bhutanese' as 'Bhutanese'" do
		'Bhutanese'.en.plural.should == 'Bhutanese' # 
	end


	it "pluralizes 'bias' as 'biases'" do
		'bias'.en.plural.should == 'biases' # 
	end


	it "pluralizes 'biceps' as 'biceps'" do
		'biceps'.en.plural.should == 'biceps' # 
	end


	it "pluralizes 'bison' as 'bisons'" do
		'bison'.en.plural.should == 'bisons'
	end

	it "pluralizes 'bison' as 'bison' in classical mode" do
		Linguistics::EN.in_classical_mode do
			'bison'.en.plural.should == 'bison'
		end
	end


	it "pluralizes 'Bolognese' as 'Bolognese'" do
		'Bolognese'.en.plural.should == 'Bolognese' # 
	end


	it "pluralizes 'bonus' as 'bonuses'" do
		'bonus'.en.plural.should == 'bonuses' # 
	end


	it "pluralizes 'Borghese' as 'Borghese'" do
		'Borghese'.en.plural.should == 'Borghese' # 
	end


	it "pluralizes 'boss' as 'bosses'" do
		'boss'.en.plural.should == 'bosses' # 
	end


	it "pluralizes 'Bostonese' as 'Bostonese'" do
		'Bostonese'.en.plural.should == 'Bostonese' # 
	end


	it "pluralizes 'box' as 'boxes'" do
		'box'.en.plural.should == 'boxes' # 
	end


	it "pluralizes 'boy' as 'boys'" do
		'boy'.en.plural.should == 'boys' # 
	end


	it "pluralizes 'bravo' as 'bravoes'" do
		'bravo'.en.plural.should == 'bravoes' # 
	end


	it "pluralizes 'bream' as 'bream'" do
		'bream'.en.plural.should == 'bream' # 
	end


	it "pluralizes 'breeches' as 'breeches'" do
		'breeches'.en.plural.should == 'breeches' # 
	end


	it "pluralizes 'bride-to-be' as 'brides-to-be'" do
		'bride-to-be'.en.plural.should == 'brides-to-be' # 
	end


	it "pluralizes 'britches' as 'britches'" do
		'britches'.en.plural.should == 'britches' # 
	end


	it "pluralizes 'bronchitis' as 'bronchitises'" do
		'bronchitis'.en.plural.should == 'bronchitises' # 
	end


	it "pluralizes 'bronchus' as 'bronchi'" do
		'bronchus'.en.plural.should == 'bronchi' # 
	end


	it "pluralizes 'brother' as 'brothers'" do
		'brother'.en.plural.should == 'brothers'
	end

	it "pluralizes 'brother' as 'brethren' in classical mode" do
		Linguistics::EN.in_classical_mode do
			'brother'.en.plural.should == 'brethren'
		end
	end


	it "pluralizes 'brother's' as 'brothers''" do
		"brother's".en.plural.should == "brothers'" # brethren's
	end


	it "pluralizes 'buffalo' as 'buffaloes'" do
		'buffalo'.en.plural.should == 'buffaloes'
	end

	it "pluralizes 'buffalo' as 'buffalo' in classical mode" do
		Linguistics::EN.in_classical_mode do
			'buffalo'.en.plural.should == 'buffalo'
		end
	end


	it "pluralizes 'Buginese' as 'Buginese'" do
		'Buginese'.en.plural.should == 'Buginese' # 
	end


	it "pluralizes 'buoy' as 'buoys'" do
		'buoy'.en.plural.should == 'buoys' # 
	end


	it "pluralizes 'bureau' as 'bureaus'" do
		'bureau'.en.plural.should == 'bureaus'
	end

	it "pluralizes 'bureau' as 'bureaux' in classical mode" do
		Linguistics::EN.in_classical_mode do
			'bureau'.en.plural.should == 'bureaux'
		end
	end


	it "pluralizes 'Burman' as 'Burmans'" do
		'Burman'.en.plural.should == 'Burmans' # 
	end


	it "pluralizes 'Burmese' as 'Burmese'" do
		'Burmese'.en.plural.should == 'Burmese' # 
	end


	it "pluralizes 'bursitis' as 'bursitises'" do
		'bursitis'.en.plural.should == 'bursitises' # 
	end


	it "pluralizes 'bus' as 'buses'" do
		'bus'.en.plural.should == 'buses' # 
	end


	it "pluralizes 'buzz' as 'buzzes'" do
		'buzz'.en.plural.should == 'buzzes' # 
	end


	# VERB FORM
	it "pluralizes 'buzzes' as 'buzz'" do
		'buzzes'.en.plural.should == 'buzz' # 
	end


	# ACCUSATIVE
	it "pluralizes 'by it' as 'by them'" do
		'by it'.en.plural.should == 'by them' # 
	end


	it "pluralizes 'caddis' as 'caddises'" do
		'caddis'.en.plural.should == 'caddises' # 
	end


	it "pluralizes 'cake' as 'cakes'" do
		'cake'.en.plural.should == 'cakes' # 
	end


	it "pluralizes 'Calabrese' as 'Calabrese'" do
		'Calabrese'.en.plural.should == 'Calabrese' # 
	end


	it "pluralizes 'calf' as 'calves'" do
		'calf'.en.plural.should == 'calves' # 
	end


	it "pluralizes 'callus' as 'calluses'" do
		'callus'.en.plural.should == 'calluses' # 
	end


	it "pluralizes 'Camaldolese' as 'Camaldolese'" do
		'Camaldolese'.en.plural.should == 'Camaldolese' # 
	end


	it "pluralizes 'cameo' as 'cameos'" do
		'cameo'.en.plural.should == 'cameos' # 
	end


	it "pluralizes 'campus' as 'campuses'" do
		'campus'.en.plural.should == 'campuses' # 
	end


	# NOUN FORM
	it "pluralizes 'can' as 'cans'" do
		'can'.en.plural.should == 'cans' # 
	end


	# VERB FORM (all pers.)
	it "pluralizes 'can' (as a verb) as 'can'" do
		'can'.en.plural_verb.should == 'can' # 
	end


	it "pluralizes 'candelabrum' as 'candelabra'" do
		'candelabrum'.en.plural.should == 'candelabra' # 
	end


	it "pluralizes 'cannabis' as 'cannabises'" do
		'cannabis'.en.plural.should == 'cannabises' # 
	end


	it "pluralizes 'canto' as 'cantos'" do
		'canto'.en.plural.should == 'cantos' # 
	end


	it "pluralizes 'Cantonese' as 'Cantonese'" do
		'Cantonese'.en.plural.should == 'Cantonese' # 
	end


	it "pluralizes 'cantus' as 'cantus'" do
		'cantus'.en.plural.should == 'cantus' # 
	end


	it "pluralizes 'canvas' as 'canvases'" do
		'canvas'.en.plural.should == 'canvases' # 
	end


	it "pluralizes 'CAPITAL' as 'CAPITALS'" do
		'CAPITAL'.en.plural.should == 'CAPITALS' # 
	end


	it "pluralizes 'carcinoma' as 'carcinomas'" do
		'carcinoma'.en.plural.should == 'carcinomas'
	end

	it "pluralizes 'carcinoma' as 'carcinomata' in classical mode" do
		Linguistics::EN.in_classical_mode do
			'carcinoma'.en.plural.should == 'carcinomata'
		end
	end


	it "pluralizes 'care' as 'cares'" do
		'care'.en.plural.should == 'cares' # 
	end


	it "pluralizes 'cargo' as 'cargoes'" do
		'cargo'.en.plural.should == 'cargoes' # 
	end


	it "pluralizes 'Carlylese' as 'Carlylese'" do
		'Carlylese'.en.plural.should == 'Carlylese' # 
	end


	it "pluralizes 'carp' as 'carp'" do
		'carp'.en.plural.should == 'carp' # 
	end


	it "pluralizes 'Cassinese' as 'Cassinese'" do
		'Cassinese'.en.plural.should == 'Cassinese' # 
	end


	it "pluralizes 'cat' as 'cats'" do
		'cat'.en.plural.should == 'cats' # 
	end


	it "pluralizes 'catfish' as 'catfish'" do
		'catfish'.en.plural.should == 'catfish' # 
	end


	it "pluralizes 'Celanese' as 'Celanese'" do
		'Celanese'.en.plural.should == 'Celanese' # 
	end


	it "pluralizes 'Ceylonese' as 'Ceylonese'" do
		'Ceylonese'.en.plural.should == 'Ceylonese' # 
	end


	it "pluralizes 'chairman' as 'chairmen'" do
		'chairman'.en.plural.should == 'chairmen' # 
	end


	it "pluralizes 'chamois' as 'chamois'" do
		'chamois'.en.plural.should == 'chamois' # 
	end


	it "pluralizes 'chaos' as 'chaoses'" do
		'chaos'.en.plural.should == 'chaoses' # 
	end


	it "pluralizes 'chapeau' as 'chapeaus'" do
		'chapeau'.en.plural.should == 'chapeaus'
	end

	it "pluralizes 'chapeau' as 'chapeaux' in classical mode" do
		Linguistics::EN.in_classical_mode do
			'chapeau'.en.plural.should == 'chapeaux'
		end
	end


	it "pluralizes 'charisma' as 'charismas'" do
		'charisma'.en.plural.should == 'charismas'
	end

	it "pluralizes 'charisma' as 'charismata' in classical mode" do
		Linguistics::EN.in_classical_mode do
			'charisma'.en.plural.should == 'charismata'
		end
	end


	it "pluralizes 'chases' as 'chase'" do
		'chases'.en.plural.should == 'chase' # 
	end


	it "pluralizes 'chassis' as 'chassis'" do
		'chassis'.en.plural.should == 'chassis' # 
	end


	it "pluralizes 'chateau' as 'chateaus'" do
		'chateau'.en.plural.should == 'chateaus'
	end

	it "pluralizes 'chateau' as 'chateaux' in classical mode" do
		Linguistics::EN.in_classical_mode do
			'chateau'.en.plural.should == 'chateaux'
		end
	end


	it "pluralizes 'cherub' as 'cherubs'" do
		'cherub'.en.plural.should == 'cherubs'
	end

	it "pluralizes 'cherub' as 'cherubim' in classical mode" do
		Linguistics::EN.in_classical_mode do
			'cherub'.en.plural.should == 'cherubim'
		end
	end


	it "pluralizes 'chickenpox' as 'chickenpox'" do
		'chickenpox'.en.plural.should == 'chickenpox' # 
	end


	it "pluralizes 'chief' as 'chiefs'" do
		'chief'.en.plural.should == 'chiefs' # 
	end


	it "pluralizes 'child' as 'children'" do
		'child'.en.plural.should == 'children' # 
	end


	it "pluralizes 'Chinese' as 'Chinese'" do
		'Chinese'.en.plural.should == 'Chinese' # 
	end


	it "pluralizes 'chorus' as 'choruses'" do
		'chorus'.en.plural.should == 'choruses' # 
	end


	it "pluralizes 'church' as 'churches'" do
		'church'.en.plural.should == 'churches' # 
	end


	it "pluralizes 'cicatrix' as 'cicatrixes'" do
		'cicatrix'.en.plural.should == 'cicatrixes'
	end

	it "pluralizes 'cicatrix' as 'cicatrices' in classical mode" do
		Linguistics::EN.in_classical_mode do
			'cicatrix'.en.plural.should == 'cicatrices'
		end
	end


	it "pluralizes 'circus' as 'circuses'" do
		'circus'.en.plural.should == 'circuses' # 
	end


	it "pluralizes 'class' as 'classes'" do
		'class'.en.plural.should == 'classes' # 
	end


	# VERB FORM
	it "pluralizes 'classes' as 'class'" do
		'classes'.en.plural.should == 'class' # 
	end


	it "pluralizes 'clippers' as 'clippers'" do
		'clippers'.en.plural.should == 'clippers' # 
	end


	it "pluralizes 'clitoris' as 'clitorises'" do
		'clitoris'.en.plural.should == 'clitorises'
	end

	it "pluralizes 'clitoris' as 'clitorides' in classical mode" do
		Linguistics::EN.in_classical_mode do
			'clitoris'.en.plural.should == 'clitorides'
		end
	end


	it "pluralizes 'cod' as 'cod'" do
		'cod'.en.plural.should == 'cod' # 
	end


	it "pluralizes 'codex' as 'codices'" do
		'codex'.en.plural.should == 'codices' # 
	end


	it "pluralizes 'coitus' as 'coitus'" do
		'coitus'.en.plural.should == 'coitus' # 
	end


	it "pluralizes 'commando' as 'commandos'" do
		'commando'.en.plural.should == 'commandos' # 
	end


	it "pluralizes 'compendium' as 'compendiums'" do
		'compendium'.en.plural.should == 'compendiums'
	end

	it "pluralizes 'compendium' as 'compendia' in classical mode" do
		Linguistics::EN.in_classical_mode do
			'compendium'.en.plural.should == 'compendia'
		end
	end


	it "pluralizes 'Congoese' as 'Congoese'" do
		'Congoese'.en.plural.should == 'Congoese' # 
	end


	it "pluralizes 'Congolese' as 'Congolese'" do
		'Congolese'.en.plural.should == 'Congolese' # 
	end


	it "pluralizes 'conspectus' as 'conspectuses'" do
		'conspectus'.en.plural.should == 'conspectuses' # 
	end


	it "pluralizes 'contralto' as 'contraltos'" do
		'contralto'.en.plural.should == 'contraltos'
	end

	it "pluralizes 'contralto' as 'contralti' in classical mode" do
		Linguistics::EN.in_classical_mode do
			'contralto'.en.plural.should == 'contralti'
		end
	end


	it "pluralizes 'contretemps' as 'contretemps'" do
		'contretemps'.en.plural.should == 'contretemps' # 
	end


	it "pluralizes 'conundrum' as 'conundrums'" do
		'conundrum'.en.plural.should == 'conundrums' # 
	end


	it "pluralizes 'corps' as 'corps'" do
		'corps'.en.plural.should == 'corps' # 
	end


	it "pluralizes 'corpus' as 'corpuses'" do
		'corpus'.en.plural.should == 'corpuses'
	end

	it "pluralizes 'corpus' as 'corpora' in classical mode" do
		Linguistics::EN.in_classical_mode do
			'corpus'.en.plural.should == 'corpora'
		end
	end


	it "pluralizes 'cortex' as 'cortexes'" do
		'cortex'.en.plural.should == 'cortexes'
	end

	it "pluralizes 'cortex' as 'cortices' in classical mode" do
		Linguistics::EN.in_classical_mode do
			'cortex'.en.plural.should == 'cortices'
		end
	end


	it "pluralizes 'cosmos' as 'cosmoses'" do
		'cosmos'.en.plural.should == 'cosmoses' # 
	end


	it "pluralizes 'court martial' as 'courts martial'" do
		'court martial'.en.plural.should == 'courts martial' # 
	end


	it "pluralizes 'cow' as 'cows'" do
		'cow'.en.plural.should == 'cows'
	end

	it "pluralizes 'cow' as 'kine' in classical mode" do
		Linguistics::EN.in_classical_mode do
			'cow'.en.plural.should == 'kine'
		end
	end


	it "pluralizes 'cranium' as 'craniums'" do
		'cranium'.en.plural.should == 'craniums'
	end

	it "pluralizes 'cranium' as 'crania' in classical mode" do
		Linguistics::EN.in_classical_mode do
			'cranium'.en.plural.should == 'crania'
		end
	end


	it "pluralizes 'crescendo' as 'crescendos'" do
		'crescendo'.en.plural.should == 'crescendos' # 
	end


	it "pluralizes 'criterion' as 'criteria'" do
		'criterion'.en.plural.should == 'criteria' # 
	end


	it "pluralizes 'curriculum' as 'curriculums'" do
		'curriculum'.en.plural.should == 'curriculums'
	end

	it "pluralizes 'curriculum' as 'curricula' in classical mode" do
		Linguistics::EN.in_classical_mode do
			'curriculum'.en.plural.should == 'curricula'
		end
	end


	it "pluralizes 'dais' as 'daises'" do
		'dais'.en.plural.should == 'daises' # 
	end


	it "pluralizes 'data point' as 'data points'" do
		'data point'.en.plural.should == 'data points' # 
	end


	it "pluralizes 'datum' as 'data'" do
		'datum'.en.plural.should == 'data' # 
	end


	it "pluralizes 'debris' as 'debris'" do
		'debris'.en.plural.should == 'debris' # 
	end


	it "pluralizes 'decorum' as 'decorums'" do
		'decorum'.en.plural.should == 'decorums' # 
	end


	it "pluralizes 'deer' as 'deer'" do
		'deer'.en.plural.should == 'deer' # 
	end


	it "pluralizes 'delphinium' as 'delphiniums'" do
		'delphinium'.en.plural.should == 'delphiniums' # 
	end


	it "pluralizes 'desideratum' as 'desiderata'" do
		'desideratum'.en.plural.should == 'desiderata' # 
	end


	it "pluralizes 'diabetes' as 'diabetes'" do
		'diabetes'.en.plural.should == 'diabetes' # 
	end


	it "pluralizes 'dictum' as 'dictums'" do
		'dictum'.en.plural.should == 'dictums'
	end

	it "pluralizes 'dictum' as 'dicta' in classical mode" do
		Linguistics::EN.in_classical_mode do
			'dictum'.en.plural.should == 'dicta'
		end
	end


	it "pluralizes 'did' as 'did'" do
		'did'.en.plural.should == 'did' # 
	end


	it "pluralizes 'did need' as 'did need'" do
		'did need'.en.plural.should == 'did need' # 
	end


	it "pluralizes 'digitalis' as 'digitalises'" do
		'digitalis'.en.plural.should == 'digitalises' # 
	end


	it "pluralizes 'dingo' as 'dingoes'" do
		'dingo'.en.plural.should == 'dingoes' # 
	end


	it "pluralizes 'diploma' as 'diplomas'" do
		'diploma'.en.plural.should == 'diplomas'
	end

	it "pluralizes 'diploma' as 'diplomata' in classical mode" do
		Linguistics::EN.in_classical_mode do
			'diploma'.en.plural.should == 'diplomata'
		end
	end


	it "pluralizes 'discus' as 'discuses'" do
		'discus'.en.plural.should == 'discuses' # 
	end


	it "pluralizes 'dish' as 'dishes'" do
		'dish'.en.plural.should == 'dishes' # 
	end


	it "pluralizes 'ditto' as 'dittos'" do
		'ditto'.en.plural.should == 'dittos' # 
	end


	it "pluralizes 'djinn' as 'djinn'" do
		'djinn'.en.plural.should == 'djinn' # 
	end


	it "pluralizes 'does' as 'do'" do
		'does'.en.plural.should == 'do' # 
	end


	it "pluralizes 'dog' as 'dogs'" do
		'dog'.en.plural.should == 'dogs' # 
	end


	it "pluralizes 'dogma' as 'dogmas'" do
		'dogma'.en.plural.should == 'dogmas'
	end

	it "pluralizes 'dogma' as 'dogmata' in classical mode" do
		Linguistics::EN.in_classical_mode do
			'dogma'.en.plural.should == 'dogmata'
		end
	end


	it "pluralizes 'dominatrix' as 'dominatrixes'" do
		'dominatrix'.en.plural.should == 'dominatrixes'
	end

	it "pluralizes 'dominatrix' as 'dominatrices' in classical mode" do
		Linguistics::EN.in_classical_mode do
			'dominatrix'.en.plural.should == 'dominatrices'
		end
	end


	it "pluralizes 'domino' as 'dominoes'" do
		'domino'.en.plural.should == 'dominoes' # 
	end


	it "pluralizes 'Dongolese' as 'Dongolese'" do
		'Dongolese'.en.plural.should == 'Dongolese' # 
	end


	it "pluralizes 'drama' as 'dramas'" do
		'drama'.en.plural.should == 'dramas'
	end

	it "pluralizes 'drama' as 'dramata' in classical mode" do
		Linguistics::EN.in_classical_mode do
			'drama'.en.plural.should == 'dramata'
		end
	end


	it "pluralizes 'drum' as 'drums'" do
		'drum'.en.plural.should == 'drums' # 
	end


	it "pluralizes 'dwarf' as 'dwarves'" do
		'dwarf'.en.plural.should == 'dwarves' # 
	end


	it "pluralizes 'dynamo' as 'dynamos'" do
		'dynamo'.en.plural.should == 'dynamos' # 
	end


	it "pluralizes 'edema' as 'edemas'" do
		'edema'.en.plural.should == 'edemas'
	end

	it "pluralizes 'edema' as 'edemata' in classical mode" do
		Linguistics::EN.in_classical_mode do
			'edema'.en.plural.should == 'edemata'
		end
	end


	it "pluralizes 'eland' as 'elands'" do
		'eland'.en.plural.should == 'elands'
	end

	it "pluralizes 'eland' as 'eland' in classical mode" do
		Linguistics::EN.in_classical_mode do
			'eland'.en.plural.should == 'eland'
		end
	end


	it "pluralizes 'elf' as 'elves'" do
		'elf'.en.plural.should == 'elves' # 
	end


	it "pluralizes 'elk' as 'elks'" do
		'elk'.en.plural.should == 'elks'
	end

	it "pluralizes 'elk' as 'elk' in classical mode" do
		Linguistics::EN.in_classical_mode do
			'elk'.en.plural.should == 'elk'
		end
	end


	it "pluralizes 'embryo' as 'embryos'" do
		'embryo'.en.plural.should == 'embryos' # 
	end


	it "pluralizes 'emporium' as 'emporiums'" do
		'emporium'.en.plural.should == 'emporiums'
	end

	it "pluralizes 'emporium' as 'emporia' in classical mode" do
		Linguistics::EN.in_classical_mode do
			'emporium'.en.plural.should == 'emporia'
		end
	end


	it "pluralizes 'encephalitis' as 'encephalitises'" do
		'encephalitis'.en.plural.should == 'encephalitises' # 
	end


	it "pluralizes 'enconium' as 'enconiums'" do
		'enconium'.en.plural.should == 'enconiums'
	end

	it "pluralizes 'enconium' as 'enconia' in classical mode" do
		Linguistics::EN.in_classical_mode do
			'enconium'.en.plural.should == 'enconia'
		end
	end


	it "pluralizes 'enema' as 'enemas'" do
		'enema'.en.plural.should == 'enemas'
	end

	it "pluralizes 'enema' as 'enemata' in classical mode" do
		Linguistics::EN.in_classical_mode do
			'enema'.en.plural.should == 'enemata'
		end
	end


	it "pluralizes 'enigma' as 'enigmas'" do
		'enigma'.en.plural.should == 'enigmas'
	end

	it "pluralizes 'enigma' as 'enigmata' in classical mode" do
		Linguistics::EN.in_classical_mode do
			'enigma'.en.plural.should == 'enigmata'
		end
	end


	it "pluralizes 'ephemeris' as 'ephemerides'" do
		'ephemeris'.en.plural.should == 'ephemerides' # 
	end


	it "pluralizes 'epidermis' as 'epidermises'" do
		'epidermis'.en.plural.should == 'epidermises' # 
	end


	it "pluralizes 'erratum' as 'errata'" do
		'erratum'.en.plural.should == 'errata' # 
	end


	it "pluralizes 'ethos' as 'ethoses'" do
		'ethos'.en.plural.should == 'ethoses' # 
	end


	it "pluralizes 'eucalyptus' as 'eucalyptuses'" do
		'eucalyptus'.en.plural.should == 'eucalyptuses' # 
	end


	it "pluralizes 'extremum' as 'extrema'" do
		'extremum'.en.plural.should == 'extrema' # 
	end


	it "pluralizes 'eyas' as 'eyases'" do
		'eyas'.en.plural.should == 'eyases' # 
	end


	it "pluralizes 'factotum' as 'factotums'" do
		'factotum'.en.plural.should == 'factotums' # 
	end


	it "pluralizes 'Faroese' as 'Faroese'" do
		'Faroese'.en.plural.should == 'Faroese' # 
	end


	it "pluralizes 'fauna' as 'faunas'" do
		'fauna'.en.plural.should == 'faunas'
	end

	it "pluralizes 'fauna' as 'faunae' in classical mode" do
		Linguistics::EN.in_classical_mode do
			'fauna'.en.plural.should == 'faunae'
		end
	end


	it "pluralizes 'fax' as 'faxes'" do
		'fax'.en.plural.should == 'faxes' # 
	end


	it "pluralizes 'Ferrarese' as 'Ferrarese'" do
		'Ferrarese'.en.plural.should == 'Ferrarese' # 
	end


	it "pluralizes 'ferry' as 'ferries'" do
		'ferry'.en.plural.should == 'ferries' # 
	end


	it "pluralizes 'fetus' as 'fetuses'" do
		'fetus'.en.plural.should == 'fetuses' # 
	end


	it "pluralizes 'fiance' as 'fiances'" do
		'fiance'.en.plural.should == 'fiances' # 
	end


	it "pluralizes 'fiancee' as 'fiancees'" do
		'fiancee'.en.plural.should == 'fiancees' # 
	end


	it "pluralizes 'fiasco' as 'fiascos'" do
		'fiasco'.en.plural.should == 'fiascos' # 
	end


	it "pluralizes 'fish' as 'fish'" do
		'fish'.en.plural.should == 'fish' # 
	end


	it "pluralizes 'fizz' as 'fizzes'" do
		'fizz'.en.plural.should == 'fizzes' # 
	end


	it "pluralizes 'flamingo' as 'flamingoes'" do
		'flamingo'.en.plural.should == 'flamingoes' # 
	end


	it "pluralizes 'flora' as 'floras'" do
		'flora'.en.plural.should == 'floras'
	end

	it "pluralizes 'flora' as 'florae' in classical mode" do
		Linguistics::EN.in_classical_mode do
			'flora'.en.plural.should == 'florae'
		end
	end


	it "pluralizes 'flounder' as 'flounder'" do
		'flounder'.en.plural.should == 'flounder' # 
	end


	it "pluralizes 'focus' as 'focuses'" do
		'focus'.en.plural.should == 'focuses'
	end

	it "pluralizes 'focus' as 'foci' in classical mode" do
		Linguistics::EN.in_classical_mode do
			'focus'.en.plural.should == 'foci'
		end
	end


	it "pluralizes 'foetus' as 'foetuses'" do
		'foetus'.en.plural.should == 'foetuses' # 
	end


	it "pluralizes 'folio' as 'folios'" do
		'folio'.en.plural.should == 'folios' # 
	end


	it "pluralizes 'Foochowese' as 'Foochowese'" do
		'Foochowese'.en.plural.should == 'Foochowese' # 
	end


	it "pluralizes 'foot' as 'feet'" do
		'foot'.en.plural.should == 'feet' # 
	end


	# POSSESSIVE FORM
	it "pluralizes 'foot's' as 'feet's'" do
		"foot's".en.plural.should == "feet's" # 
	end


	it "pluralizes 'foramen' as 'foramens'" do
		'foramen'.en.plural.should == 'foramens'
	end

	it "pluralizes 'foramen' as 'foramina' in classical mode" do
		Linguistics::EN.in_classical_mode do
			'foramen'.en.plural.should == 'foramina'
		end
	end


	it "pluralizes 'formula' as 'formulas'" do
		'formula'.en.plural.should == 'formulas'
	end

	it "pluralizes 'formula' as 'formulae' in classical mode" do
		Linguistics::EN.in_classical_mode do
			'formula'.en.plural.should == 'formulae'
		end
	end


	it "pluralizes 'forum' as 'forums'" do
		'forum'.en.plural.should == 'forums' # 
	end


	it "pluralizes 'fought' as 'fought'" do
		'fought'.en.plural.should == 'fought' # 
	end


	it "pluralizes 'fox' as 'foxes'" do
		'fox'.en.plural.should == 'foxes' # 
	end


	it "pluralizes 'from him' as 'from them'" do
		'from him'.en.plural.should == 'from them' # 
	end


	# ACCUSATIVE
	it "pluralizes 'from it' as 'from them'" do
		'from it'.en.plural.should == 'from them' # 
	end


	it "pluralizes 'fungus' as 'funguses'" do
		'fungus'.en.plural.should == 'funguses'
	end

	it "pluralizes 'fungus' as 'fungi' in classical mode" do
		Linguistics::EN.in_classical_mode do
			'fungus'.en.plural.should == 'fungi'
		end
	end


	it "pluralizes 'Gabunese' as 'Gabunese'" do
		'Gabunese'.en.plural.should == 'Gabunese' # 
	end


	it "pluralizes 'gallows' as 'gallows'" do
		'gallows'.en.plural.should == 'gallows' # 
	end


	it "pluralizes 'ganglion' as 'ganglions'" do
		'ganglion'.en.plural.should == 'ganglions'
	end

	it "pluralizes 'ganglion' as 'ganglia' in classical mode" do
		Linguistics::EN.in_classical_mode do
			'ganglion'.en.plural.should == 'ganglia'
		end
	end


	it "pluralizes 'gas' as 'gases'" do
		'gas'.en.plural.should == 'gases' # 
	end


	it "pluralizes 'gateau' as 'gateaus'" do
		'gateau'.en.plural.should == 'gateaus'
	end

	it "pluralizes 'gateau' as 'gateaux' in classical mode" do
		Linguistics::EN.in_classical_mode do
			'gateau'.en.plural.should == 'gateaux'
		end
	end


	it "pluralizes 'gave' as 'gave'" do
		'gave'.en.plural.should == 'gave' # 
	end


	it "pluralizes 'generalissimo' as 'generalissimos'" do
		'generalissimo'.en.plural.should == 'generalissimos' # 
	end


	it "pluralizes 'Genevese' as 'Genevese'" do
		'Genevese'.en.plural.should == 'Genevese' # 
	end


	it "pluralizes 'genie' as 'genies'" do
		'genie'.en.plural.should == 'genies'
	end

	it "pluralizes 'genie' as 'genii' in classical mode" do
		Linguistics::EN.in_classical_mode do
			'genie'.en.plural.should == 'genii'
		end
	end


	it "pluralizes 'genius' as 'geniuses'" do
		'genius'.en.plural.should == 'geniuses'
	end

	it "pluralizes 'genius' as 'genii' in classical mode" do
		Linguistics::EN.in_classical_mode do
			'genius'.en.plural.should == 'genii'
		end
	end


	it "pluralizes 'Genoese' as 'Genoese'" do
		'Genoese'.en.plural.should == 'Genoese' # 
	end


	it "pluralizes 'genus' as 'genera'" do
		'genus'.en.plural.should == 'genera' # 
	end


	it "pluralizes 'German' as 'Germans'" do
		'German'.en.plural.should == 'Germans' # 
	end


	it "pluralizes 'ghetto' as 'ghettos'" do
		'ghetto'.en.plural.should == 'ghettos' # 
	end


	it "pluralizes 'Gilbertese' as 'Gilbertese'" do
		'Gilbertese'.en.plural.should == 'Gilbertese' # 
	end


	it "pluralizes 'glottis' as 'glottises'" do
		'glottis'.en.plural.should == 'glottises' # 
	end


	it "pluralizes 'Goanese' as 'Goanese'" do
		'Goanese'.en.plural.should == 'Goanese' # 
	end


	it "pluralizes 'goose' as 'geese'" do
		'goose'.en.plural.should == 'geese' # 
	end


	it "pluralizes 'Governor General' as 'Governors General'" do
		'Governor General'.en.plural.should == 'Governors General' # 
	end


	it "pluralizes 'goy' as 'goys'" do
		'goy'.en.plural.should == 'goys'
	end

	it "pluralizes 'goy' as 'goyim' in classical mode" do
		Linguistics::EN.in_classical_mode do
			'goy'.en.plural.should == 'goyim'
		end
	end


	it "pluralizes 'graffiti' as 'graffiti'" do
		'graffiti'.en.plural.should == 'graffiti' # 
	end


	it "pluralizes 'graffito' as 'graffiti'" do
		'graffito'.en.plural.should == 'graffiti' # 
	end


	it "pluralizes 'guano' as 'guanos'" do
		'guano'.en.plural.should == 'guanos' # 
	end


	it "pluralizes 'guardsman' as 'guardsmen'" do
		'guardsman'.en.plural.should == 'guardsmen' # 
	end


	it "pluralizes 'Guianese' as 'Guianese'" do
		'Guianese'.en.plural.should == 'Guianese' # 
	end


	it "pluralizes 'gumma' as 'gummas'" do
		'gumma'.en.plural.should == 'gummas'
	end

	it "pluralizes 'gumma' as 'gummata' in classical mode" do
		Linguistics::EN.in_classical_mode do
			'gumma'.en.plural.should == 'gummata'
		end
	end


	it "pluralizes 'gymnasium' as 'gymnasiums'" do
		'gymnasium'.en.plural.should == 'gymnasiums'
	end

	it "pluralizes 'gymnasium' as 'gymnasia' in classical mode" do
		Linguistics::EN.in_classical_mode do
			'gymnasium'.en.plural.should == 'gymnasia'
		end
	end


	it "pluralizes 'had' as 'had'" do
		'had'.en.plural.should == 'had' # 
	end


	it "pluralizes 'had thought' as 'had thought'" do
		'had thought'.en.plural.should == 'had thought' # 
	end


	it "pluralizes 'Hainanese' as 'Hainanese'" do
		'Hainanese'.en.plural.should == 'Hainanese' # 
	end


	it "pluralizes 'handkerchief' as 'handkerchiefs'" do
		'handkerchief'.en.plural.should == 'handkerchiefs' # 
	end


	it "pluralizes 'Hararese' as 'Hararese'" do
		'Hararese'.en.plural.should == 'Hararese' # 
	end


	it "pluralizes 'Harlemese' as 'Harlemese'" do
		'Harlemese'.en.plural.should == 'Harlemese' # 
	end


	it "pluralizes 'harmonium' as 'harmoniums'" do
		'harmonium'.en.plural.should == 'harmoniums' # 
	end


	it "pluralizes 'has' as 'have'" do
		'has'.en.plural.should == 'have' # 
	end


	it "pluralizes 'has become' as 'have become'" do
		'has become'.en.plural.should == 'have become' # 
	end


	it "pluralizes 'has been' as 'have been'" do
		'has been'.en.plural.should == 'have been' # 
	end


	it "pluralizes 'has-been' as 'has-beens'" do
		'has-been'.en.plural.should == 'has-beens' # 
	end


	it "pluralizes 'Havanese' as 'Havanese'" do
		'Havanese'.en.plural.should == 'Havanese' # 
	end


	it "pluralizes 'have' as 'have'" do
		'have'.en.plural.should == 'have' # 
	end


	it "pluralizes 'have conceded' as 'have conceded'" do
		'have conceded'.en.plural.should == 'have conceded' # 
	end


	it "pluralizes 'he' as 'they'" do
		'he'.en.plural.should == 'they' # 
	end


	it "pluralizes 'headquarters' as 'headquarters'" do
		'headquarters'.en.plural.should == 'headquarters' # 
	end


	it "pluralizes 'Heavenese' as 'Heavenese'" do
		'Heavenese'.en.plural.should == 'Heavenese' # 
	end


	it "pluralizes 'helix' as 'helices'" do
		'helix'.en.plural.should == 'helices' # 
	end


	it "pluralizes 'hepatitis' as 'hepatitises'" do
		'hepatitis'.en.plural.should == 'hepatitises' # 
	end


	# PRONOUN
	it "pluralizes 'her' (as a pronoun) as 'them'" do
		'her'.en.plural_noun.should == 'them' # 
	end


	# POSSESSIVE ADJ
	it "pluralizes 'her' as 'their'" do
		'her'.en.plural.should == 'their' # 
	end


	it "pluralizes 'hero' as 'heroes'" do
		'hero'.en.plural.should == 'heroes' # 
	end


	it "pluralizes 'herpes' as 'herpes'" do
		'herpes'.en.plural.should == 'herpes' # 
	end


	# POSSESSIVE NOUN
	it "pluralizes 'hers' (as a noun) as 'theirs'" do
		'hers'.en.plural_noun.should == 'theirs' # 
	end


	it "pluralizes 'herself' as 'themselves'" do
		'herself'.en.plural.should == 'themselves' # 
	end


	it "pluralizes 'hiatus' as 'hiatuses'" do
		'hiatus'.en.plural.should == 'hiatuses'
	end

	it "pluralizes 'hiatus' as 'hiatus' in classical mode" do
		Linguistics::EN.in_classical_mode do
			'hiatus'.en.plural.should == 'hiatus'
		end
	end


	it "pluralizes 'highlight' as 'highlights'" do
		'highlight'.en.plural.should == 'highlights' # 
	end


	it "pluralizes 'hijinks' as 'hijinks'" do
		'hijinks'.en.plural.should == 'hijinks' # 
	end


	it "pluralizes 'him' as 'them'" do
		'him'.en.plural.should == 'them' # 
	end


	it "pluralizes 'himself' as 'themselves'" do
		'himself'.en.plural.should == 'themselves' # 
	end


	it "pluralizes 'hippopotamus' as 'hippopotamuses'" do
		'hippopotamus'.en.plural.should == 'hippopotamuses'
	end

	it "pluralizes 'hippopotamus' as 'hippopotami' in classical mode" do
		Linguistics::EN.in_classical_mode do
			'hippopotamus'.en.plural.should == 'hippopotami'
		end
	end


	it "pluralizes 'Hiroshiman' as 'Hiroshimans'" do
		'Hiroshiman'.en.plural.should == 'Hiroshimans' # 
	end


	# POSSESSIVE ADJ
	it "pluralizes 'his' as 'their'" do
		'his'.en.plural.should == 'their' # 
	end


	# POSSESSIVE NOUN
	it "pluralizes 'his' (as a noun) as 'theirs'" do
		'his'.en.plural_noun.should == 'theirs' # 
	end


	it "pluralizes 'honorarium' as 'honorariums'" do
		'honorarium'.en.plural.should == 'honorariums'
	end

	it "pluralizes 'honorarium' as 'honoraria' in classical mode" do
		Linguistics::EN.in_classical_mode do
			'honorarium'.en.plural.should == 'honoraria'
		end
	end


	it "pluralizes 'hoof' as 'hoofs'" do
		'hoof'.en.plural.should == 'hoofs'
	end

	it "pluralizes 'hoof' as 'hooves' in classical mode" do
		Linguistics::EN.in_classical_mode do
			'hoof'.en.plural.should == 'hooves'
		end
	end


	it "pluralizes 'Hoosierese' as 'Hoosierese'" do
		'Hoosierese'.en.plural.should == 'Hoosierese' # 
	end


	it "pluralizes 'Hottentotese' as 'Hottentotese'" do
		'Hottentotese'.en.plural.should == 'Hottentotese' # 
	end


	it "pluralizes 'house' as 'houses'" do
		'house'.en.plural.should == 'houses' # 
	end


	it "pluralizes 'housewife' as 'housewives'" do
		'housewife'.en.plural.should == 'housewives' # 
	end


	it "pluralizes 'hubris' as 'hubrises'" do
		'hubris'.en.plural.should == 'hubrises' # 
	end


	it "pluralizes 'human' as 'humans'" do
		'human'.en.plural.should == 'humans' # 
	end


	it "pluralizes 'Hunanese' as 'Hunanese'" do
		'Hunanese'.en.plural.should == 'Hunanese' # 
	end


	it "pluralizes 'hydra' as 'hydras'" do
		'hydra'.en.plural.should == 'hydras'
	end

	it "pluralizes 'hydra' as 'hydrae' in classical mode" do
		Linguistics::EN.in_classical_mode do
			'hydra'.en.plural.should == 'hydrae'
		end
	end


	it "pluralizes 'hyperbaton' as 'hyperbata'" do
		'hyperbaton'.en.plural.should == 'hyperbata' # 
	end


	it "pluralizes 'hyperbola' as 'hyperbolas'" do
		'hyperbola'.en.plural.should == 'hyperbolas'
	end

	it "pluralizes 'hyperbola' as 'hyperbolae' in classical mode" do
		Linguistics::EN.in_classical_mode do
			'hyperbola'.en.plural.should == 'hyperbolae'
		end
	end


	it "pluralizes 'I' as 'we'" do
		'I'.en.plural.should == 'we' # 
	end


	it "pluralizes 'ibis' as 'ibises'" do
		'ibis'.en.plural.should == 'ibises' # 
	end


	it "pluralizes 'ignoramus' as 'ignoramuses'" do
		'ignoramus'.en.plural.should == 'ignoramuses' # 
	end


	it "pluralizes 'impetus' as 'impetuses'" do
		'impetus'.en.plural.should == 'impetuses'
	end

	it "pluralizes 'impetus' as 'impetus' in classical mode" do
		Linguistics::EN.in_classical_mode do
			'impetus'.en.plural.should == 'impetus'
		end
	end


	it "pluralizes 'incubus' as 'incubuses'" do
		'incubus'.en.plural.should == 'incubuses'
	end

	it "pluralizes 'incubus' as 'incubi' in classical mode" do
		Linguistics::EN.in_classical_mode do
			'incubus'.en.plural.should == 'incubi'
		end
	end


	it "pluralizes 'index' as 'indexes'" do
		'index'.en.plural.should == 'indexes'
	end

	it "pluralizes 'index' as 'indices' in classical mode" do
		Linguistics::EN.in_classical_mode do
			'index'.en.plural.should == 'indices'
		end
	end


	it "pluralizes 'Indochinese' as 'Indochinese'" do
		'Indochinese'.en.plural.should == 'Indochinese' # 
	end


	it "pluralizes 'inferno' as 'infernos'" do
		'inferno'.en.plural.should == 'infernos' # 
	end


	it "pluralizes 'innings' as 'innings'" do
		'innings'.en.plural.should == 'innings' # 
	end


	it "pluralizes 'Inspector General' as 'Inspectors General'" do
		'Inspector General'.en.plural.should == 'Inspectors General' # 
	end


	it "pluralizes 'interregnum' as 'interregnums'" do
		'interregnum'.en.plural.should == 'interregnums'
	end

	it "pluralizes 'interregnum' as 'interregna' in classical mode" do
		Linguistics::EN.in_classical_mode do
			'interregnum'.en.plural.should == 'interregna'
		end
	end


	it "pluralizes 'iris' as 'irises'" do
		'iris'.en.plural.should == 'irises'
	end

	it "pluralizes 'iris' as 'irides' in classical mode" do
		Linguistics::EN.in_classical_mode do
			'iris'.en.plural.should == 'irides'
		end
	end


	it "pluralizes 'is' as 'are'" do
		'is'.en.plural.should == 'are' # 
	end


	it "pluralizes 'is eaten' as 'are eaten'" do
		'is eaten'.en.plural.should == 'are eaten' # 
	end


	# NOMINATIVE
	it "pluralizes 'it' as 'they'" do
		'it'.en.plural.should == 'they' # 
	end


	# POSSESSIVE FORM
	it "pluralizes 'its' as 'their'" do
		'its'.en.plural.should == 'their' # 
	end


	it "pluralizes 'itself' as 'themselves'" do
		'itself'.en.plural.should == 'themselves' # 
	end


	it "pluralizes 'jackanapes' as 'jackanapes'" do
		'jackanapes'.en.plural.should == 'jackanapes' # 
	end


	it "pluralizes 'Japanese' as 'Japanese'" do
		'Japanese'.en.plural.should == 'Japanese' # 
	end


	it "pluralizes 'Javanese' as 'Javanese'" do
		'Javanese'.en.plural.should == 'Javanese' # 
	end


	it "pluralizes 'Jerry' as 'Jerrys'" do
		'Jerry'.en.plural.should == 'Jerrys' # 
	end


	it "pluralizes 'jerry' as 'jerries'" do
		'jerry'.en.plural.should == 'jerries' # 
	end


	it "pluralizes 'jinx' as 'jinxes'" do
		'jinx'.en.plural.should == 'jinxes' # 
	end


	# VERB FORM
	it "pluralizes 'jinxes' as 'jinx'" do
		'jinxes'.en.plural.should == 'jinx' # 
	end


	it "pluralizes 'Johnsonese' as 'Johnsonese'" do
		'Johnsonese'.en.plural.should == 'Johnsonese' # 
	end


	it "pluralizes 'Jones' as 'Joneses'" do
		'Jones'.en.plural.should == 'Joneses' # 
	end


	it "pluralizes 'jumbo' as 'jumbos'" do
		'jumbo'.en.plural.should == 'jumbos' # 
	end


	it "pluralizes 'Kanarese' as 'Kanarese'" do
		'Kanarese'.en.plural.should == 'Kanarese' # 
	end


	it "pluralizes 'Kiplingese' as 'Kiplingese'" do
		'Kiplingese'.en.plural.should == 'Kiplingese' # 
	end


	# NOUN FORM
	it "pluralizes 'knife' as 'knives'" do
		'knife'.en.plural.should == 'knives' # 
	end


	# VERB FORM (1st/2nd pers.)
	it "pluralizes 'knife' (as a verb) as 'knife'" do
		'knife'.en.plural_verb.should == 'knife' # 
	end


	# VERB FORM (3rd pers.)
	it "pluralizes 'knifes' as 'knife'" do
		'knifes'.en.plural.should == 'knife' # 
	end


	it "pluralizes 'Kongoese' as 'Kongoese'" do
		'Kongoese'.en.plural.should == 'Kongoese' # 
	end


	it "pluralizes 'Kongolese' as 'Kongolese'" do
		'Kongolese'.en.plural.should == 'Kongolese' # 
	end


	it "pluralizes 'lacuna' as 'lacunas'" do
		'lacuna'.en.plural.should == 'lacunas'
	end

	it "pluralizes 'lacuna' as 'lacunae' in classical mode" do
		Linguistics::EN.in_classical_mode do
			'lacuna'.en.plural.should == 'lacunae'
		end
	end


	it "pluralizes 'lady in waiting' as 'ladies in waiting'" do
		'lady in waiting'.en.plural.should == 'ladies in waiting' # 
	end


	it "pluralizes 'Lapponese' as 'Lapponese'" do
		'Lapponese'.en.plural.should == 'Lapponese' # 
	end


	it "pluralizes 'larynx' as 'larynxes'" do
		'larynx'.en.plural.should == 'larynxes'
	end

	it "pluralizes 'larynx' as 'larynges' in classical mode" do
		Linguistics::EN.in_classical_mode do
			'larynx'.en.plural.should == 'larynges'
		end
	end


	it "pluralizes 'latex' as 'latexes'" do
		'latex'.en.plural.should == 'latexes'
	end

	it "pluralizes 'latex' as 'latices' in classical mode" do
		Linguistics::EN.in_classical_mode do
			'latex'.en.plural.should == 'latices'
		end
	end


	# VERB FORM (1st/2nd pers.)
	it "pluralizes 'leaf' (as a verb) as 'leaf'" do
		'leaf'.en.plural_verb.should == 'leaf' # 
	end


	# NOUN FORM
	it "pluralizes 'leaf' as 'leaves'" do
		'leaf'.en.plural.should == 'leaves' # 
	end


	# VERB FORM (3rd pers.)
	it "pluralizes 'leafs' as 'leaf'" do
		'leafs'.en.plural.should == 'leaf' # 
	end


	it "pluralizes 'Lebanese' as 'Lebanese'" do
		'Lebanese'.en.plural.should == 'Lebanese' # 
	end


	it "pluralizes 'lemma' as 'lemmas'" do
		'lemma'.en.plural.should == 'lemmas'
	end

	it "pluralizes 'lemma' as 'lemmata' in classical mode" do
		Linguistics::EN.in_classical_mode do
			'lemma'.en.plural.should == 'lemmata'
		end
	end


	it "pluralizes 'lens' as 'lenses'" do
		'lens'.en.plural.should == 'lenses' # 
	end


	it "pluralizes 'Leonese' as 'Leonese'" do
		'Leonese'.en.plural.should == 'Leonese' # 
	end


	it "pluralizes 'lick of the cat' as 'licks of the cat'" do
		'lick of the cat'.en.plural.should == 'licks of the cat' # 
	end


	it "pluralizes 'Lieutenant General' as 'Lieutenant Generals'" do
		'Lieutenant General'.en.plural.should == 'Lieutenant Generals' # 
	end


	it "pluralizes 'life' as 'lives'" do
		'life'.en.plural.should == 'lives' # 
	end


	it "pluralizes 'Liman' as 'Limans'" do
		'Liman'.en.plural.should == 'Limans' # 
	end


	it "pluralizes 'lingo' as 'lingos'" do
		'lingo'.en.plural.should == 'lingos' # 
	end


	it "pluralizes 'loaf' as 'loaves'" do
		'loaf'.en.plural.should == 'loaves' # 
	end


	it "pluralizes 'locus' as 'loci'" do
		'locus'.en.plural.should == 'loci' # 
	end


	it "pluralizes 'Londonese' as 'Londonese'" do
		'Londonese'.en.plural.should == 'Londonese' # 
	end


	it "pluralizes 'Lorrainese' as 'Lorrainese'" do
		'Lorrainese'.en.plural.should == 'Lorrainese' # 
	end


	it "pluralizes 'lothario' as 'lotharios'" do
		'lothario'.en.plural.should == 'lotharios' # 
	end


	it "pluralizes 'louse' as 'lice'" do
		'louse'.en.plural.should == 'lice' # 
	end


	it "pluralizes 'Lucchese' as 'Lucchese'" do
		'Lucchese'.en.plural.should == 'Lucchese' # 
	end


	it "pluralizes 'lumbago' as 'lumbagos'" do
		'lumbago'.en.plural.should == 'lumbagos' # 
	end


	it "pluralizes 'lumen' as 'lumens'" do
		'lumen'.en.plural.should == 'lumens'
	end

	it "pluralizes 'lumen' as 'lumina' in classical mode" do
		Linguistics::EN.in_classical_mode do
			'lumen'.en.plural.should == 'lumina'
		end
	end


	it "pluralizes 'lustrum' as 'lustrums'" do
		'lustrum'.en.plural.should == 'lustrums'
	end

	it "pluralizes 'lustrum' as 'lustra' in classical mode" do
		Linguistics::EN.in_classical_mode do
			'lustrum'.en.plural.should == 'lustra'
		end
	end


	it "pluralizes 'lyceum' as 'lyceums'" do
		'lyceum'.en.plural.should == 'lyceums' # 
	end


	it "pluralizes 'lymphoma' as 'lymphomas'" do
		'lymphoma'.en.plural.should == 'lymphomas'
	end

	it "pluralizes 'lymphoma' as 'lymphomata' in classical mode" do
		Linguistics::EN.in_classical_mode do
			'lymphoma'.en.plural.should == 'lymphomata'
		end
	end


	it "pluralizes 'lynx' as 'lynxes'" do
		'lynx'.en.plural.should == 'lynxes' # 
	end


	it "pluralizes 'Lyonese' as 'Lyonese'" do
		'Lyonese'.en.plural.should == 'Lyonese' # 
	end


	it "pluralizes 'M.I.A.' as 'M.I.A.s'" do
		'M.I.A.'.en.plural.should == 'M.I.A.s' # 
	end


	it "pluralizes 'Macanese' as 'Macanese'" do
		'Macanese'.en.plural.should == 'Macanese' # 
	end


	it "pluralizes 'Macassarese' as 'Macassarese'" do
		'Macassarese'.en.plural.should == 'Macassarese' # 
	end


	it "pluralizes 'mackerel' as 'mackerel'" do
		'mackerel'.en.plural.should == 'mackerel' # 
	end


	it "pluralizes 'made' as 'made'" do
		'made'.en.plural.should == 'made' # 
	end


	it "pluralizes 'Madurese' as 'Madurese'" do
		'Madurese'.en.plural.should == 'Madurese' # 
	end


	it "pluralizes 'magma' as 'magmas'" do
		'magma'.en.plural.should == 'magmas'
	end

	it "pluralizes 'magma' as 'magmata' in classical mode" do
		Linguistics::EN.in_classical_mode do
			'magma'.en.plural.should == 'magmata'
		end
	end


	it "pluralizes 'magneto' as 'magnetos'" do
		'magneto'.en.plural.should == 'magnetos' # 
	end


	it "pluralizes 'Major General' as 'Major Generals'" do
		'Major General'.en.plural.should == 'Major Generals' # 
	end


	it "pluralizes 'Malabarese' as 'Malabarese'" do
		'Malabarese'.en.plural.should == 'Malabarese' # 
	end


	it "pluralizes 'Maltese' as 'Maltese'" do
		'Maltese'.en.plural.should == 'Maltese' # 
	end


	it "pluralizes 'man' as 'men'" do
		'man'.en.plural.should == 'men' # 
	end


	it "pluralizes 'mandamus' as 'mandamuses'" do
		'mandamus'.en.plural.should == 'mandamuses' # 
	end


	it "pluralizes 'manifesto' as 'manifestos'" do
		'manifesto'.en.plural.should == 'manifestos' # 
	end


	it "pluralizes 'mantis' as 'mantises'" do
		'mantis'.en.plural.should == 'mantises' # 
	end


	it "pluralizes 'marquis' as 'marquises'" do
		'marquis'.en.plural.should == 'marquises' # 
	end


	it "pluralizes 'Mary' as 'Marys'" do
		'Mary'.en.plural.should == 'Marys' # 
	end


	it "pluralizes 'maximum' as 'maximums'" do
		'maximum'.en.plural.should == 'maximums'
	end

	it "pluralizes 'maximum' as 'maxima' in classical mode" do
		Linguistics::EN.in_classical_mode do
			'maximum'.en.plural.should == 'maxima'
		end
	end


	it "pluralizes 'measles' as 'measles'" do
		'measles'.en.plural.should == 'measles' # 
	end


	it "pluralizes 'medico' as 'medicos'" do
		'medico'.en.plural.should == 'medicos' # 
	end


	it "pluralizes 'medium' as 'mediums'" do
		'medium'.en.plural.should == 'mediums'
	end

	it "pluralizes 'medium' as 'media' in classical mode" do
		Linguistics::EN.in_classical_mode do
			'medium'.en.plural.should == 'media'
		end
	end


	it "pluralizes 'medium's' as 'mediums''" do
		"medium's".en.plural.should == "mediums'" # media's
	end


	it "pluralizes 'medusa' as 'medusas'" do
		'medusa'.en.plural.should == 'medusas'
	end

	it "pluralizes 'medusa' as 'medusae' in classical mode" do
		Linguistics::EN.in_classical_mode do
			'medusa'.en.plural.should == 'medusae'
		end
	end


	it "pluralizes 'memorandum' as 'memorandums'" do
		'memorandum'.en.plural.should == 'memorandums'
	end

	it "pluralizes 'memorandum' as 'memoranda' in classical mode" do
		Linguistics::EN.in_classical_mode do
			'memorandum'.en.plural.should == 'memoranda'
		end
	end


	it "pluralizes 'meniscus' as 'menisci'" do
		'meniscus'.en.plural.should == 'menisci' # 
	end


	it "pluralizes 'Messinese' as 'Messinese'" do
		'Messinese'.en.plural.should == 'Messinese' # 
	end


	it "pluralizes 'metamorphosis' as 'metamorphoses'" do
		'metamorphosis'.en.plural.should == 'metamorphoses' # 
	end


	it "pluralizes 'metropolis' as 'metropolises'" do
		'metropolis'.en.plural.should == 'metropolises' # 
	end


	it "pluralizes 'mews' as 'mews'" do
		'mews'.en.plural.should == 'mews' # 
	end


	it "pluralizes 'miasma' as 'miasmas'" do
		'miasma'.en.plural.should == 'miasmas'
	end

	it "pluralizes 'miasma' as 'miasmata' in classical mode" do
		Linguistics::EN.in_classical_mode do
			'miasma'.en.plural.should == 'miasmata'
		end
	end


	it "pluralizes 'Milanese' as 'Milanese'" do
		'Milanese'.en.plural.should == 'Milanese' # 
	end


	it "pluralizes 'milieu' as 'milieus'" do
		'milieu'.en.plural.should == 'milieus'
	end

	it "pluralizes 'milieu' as 'milieux' in classical mode" do
		Linguistics::EN.in_classical_mode do
			'milieu'.en.plural.should == 'milieux'
		end
	end


	it "pluralizes 'millenium' as 'milleniums'" do
		'millenium'.en.plural.should == 'milleniums'
	end

	it "pluralizes 'millenium' as 'millenia' in classical mode" do
		Linguistics::EN.in_classical_mode do
			'millenium'.en.plural.should == 'millenia'
		end
	end


	it "pluralizes 'minimum' as 'minimums'" do
		'minimum'.en.plural.should == 'minimums'
	end

	it "pluralizes 'minimum' as 'minima' in classical mode" do
		Linguistics::EN.in_classical_mode do
			'minimum'.en.plural.should == 'minima'
		end
	end


	it "pluralizes 'minx' as 'minxes'" do
		'minx'.en.plural.should == 'minxes' # 
	end


	# VERB FORM (1st/2nd pers.)
	it "pluralizes 'miss' (as a verb) as 'miss'" do
		'miss'.en.plural_verb.should == 'miss' # 
	end


	# NOUN FORM
	it "pluralizes 'miss' as 'misses'" do
		'miss'.en.plural.should == 'misses' # 
	end


	# VERB FORM (3rd pers.)
	it "pluralizes 'misses' as 'miss'" do
		'misses'.en.plural.should == 'miss' # 
	end


	it "pluralizes 'mittamus' as 'mittamuses'" do
		'mittamus'.en.plural.should == 'mittamuses' # 
	end


	it "pluralizes 'Modenese' as 'Modenese'" do
		'Modenese'.en.plural.should == 'Modenese' # 
	end


	it "pluralizes 'momentum' as 'momentums'" do
		'momentum'.en.plural.should == 'momentums'
	end

	it "pluralizes 'momentum' as 'momenta' in classical mode" do
		Linguistics::EN.in_classical_mode do
			'momentum'.en.plural.should == 'momenta'
		end
	end


	it "pluralizes 'money' as 'monies'" do
		'money'.en.plural.should == 'monies' # 
	end


	it "pluralizes 'mongoose' as 'mongooses'" do
		'mongoose'.en.plural.should == 'mongooses' # 
	end


	it "pluralizes 'moose' as 'mooses'" do
		'moose'.en.plural.should == 'mooses'
	end

	it "pluralizes 'moose' as 'moose' in classical mode" do
		Linguistics::EN.in_classical_mode do
			'moose'.en.plural.should == 'moose'
		end
	end


	it "pluralizes 'mother-in-law' as 'mothers-in-law'" do
		'mother-in-law'.en.plural.should == 'mothers-in-law' # 
	end


	it "pluralizes 'mouse' as 'mice'" do
		'mouse'.en.plural.should == 'mice' # 
	end


	it "pluralizes 'mumps' as 'mumps'" do
		'mumps'.en.plural.should == 'mumps' # 
	end


	it "pluralizes 'Muranese' as 'Muranese'" do
		'Muranese'.en.plural.should == 'Muranese' # 
	end


	it "pluralizes 'murex' as 'murices'" do
		'murex'.en.plural.should == 'murices' # 
	end


	it "pluralizes 'museum' as 'museums'" do
		'museum'.en.plural.should == 'museums' # 
	end


	it "pluralizes 'mustachio' as 'mustachios'" do
		'mustachio'.en.plural.should == 'mustachios' # 
	end


	# POSSESSIVE FORM
	it "pluralizes 'my' as 'our'" do
		'my'.en.plural.should == 'our' # 
	end


	it "pluralizes 'myself' as 'ourselves'" do
		'myself'.en.plural.should == 'ourselves' # 
	end


	it "pluralizes 'mythos' as 'mythoi'" do
		'mythos'.en.plural.should == 'mythoi' # 
	end


	it "pluralizes 'Nakayaman' as 'Nakayamans'" do
		'Nakayaman'.en.plural.should == 'Nakayamans' # 
	end


	it "pluralizes 'Nankingese' as 'Nankingese'" do
		'Nankingese'.en.plural.should == 'Nankingese' # 
	end


	it "pluralizes 'nasturtium' as 'nasturtiums'" do
		'nasturtium'.en.plural.should == 'nasturtiums' # 
	end


	it "pluralizes 'Navarrese' as 'Navarrese'" do
		'Navarrese'.en.plural.should == 'Navarrese' # 
	end


	it "pluralizes 'nebula' as 'nebulas'" do
		'nebula'.en.plural.should == 'nebulas'
	end

	it "pluralizes 'nebula' as 'nebulae' in classical mode" do
		Linguistics::EN.in_classical_mode do
			'nebula'.en.plural.should == 'nebulae'
		end
	end


	it "pluralizes 'Nepalese' as 'Nepalese'" do
		'Nepalese'.en.plural.should == 'Nepalese' # 
	end


	it "pluralizes 'neuritis' as 'neuritises'" do
		'neuritis'.en.plural.should == 'neuritises' # 
	end


	it "pluralizes 'neurosis' as 'neuroses'" do
		'neurosis'.en.plural.should == 'neuroses' # 
	end


	it "pluralizes 'news' as 'news'" do
		'news'.en.plural.should == 'news' # 
	end


	it "pluralizes 'nexus' as 'nexus'" do
		'nexus'.en.plural.should == 'nexus' # 
	end


	it "pluralizes 'Niasese' as 'Niasese'" do
		'Niasese'.en.plural.should == 'Niasese' # 
	end


	it "pluralizes 'Nicobarese' as 'Nicobarese'" do
		'Nicobarese'.en.plural.should == 'Nicobarese' # 
	end


	it "pluralizes 'nimbus' as 'nimbuses'" do
		'nimbus'.en.plural.should == 'nimbuses'
	end

	it "pluralizes 'nimbus' as 'nimbi' in classical mode" do
		Linguistics::EN.in_classical_mode do
			'nimbus'.en.plural.should == 'nimbi'
		end
	end


	it "pluralizes 'Nipponese' as 'Nipponese'" do
		'Nipponese'.en.plural.should == 'Nipponese' # 
	end


	it "pluralizes 'no' as 'noes'" do
		'no'.en.plural.should == 'noes' # 
	end


	it "pluralizes 'nostrum' as 'nostrums'" do
		'nostrum'.en.plural.should == 'nostrums' # 
	end


	it "pluralizes 'noumenon' as 'noumena'" do
		'noumenon'.en.plural.should == 'noumena' # 
	end


	it "pluralizes 'nova' as 'novas'" do
		'nova'.en.plural.should == 'novas'
	end

	it "pluralizes 'nova' as 'novae' in classical mode" do
		Linguistics::EN.in_classical_mode do
			'nova'.en.plural.should == 'novae'
		end
	end


	it "pluralizes 'nucleolus' as 'nucleoluses'" do
		'nucleolus'.en.plural.should == 'nucleoluses'
	end

	it "pluralizes 'nucleolus' as 'nucleoli' in classical mode" do
		Linguistics::EN.in_classical_mode do
			'nucleolus'.en.plural.should == 'nucleoli'
		end
	end


	it "pluralizes 'nucleus' as 'nuclei'" do
		'nucleus'.en.plural.should == 'nuclei' # 
	end


	it "pluralizes 'oaf' as 'oafs'" do
		'oaf'.en.plural.should == 'oafs' # 
	end


	it "pluralizes 'octavo' as 'octavos'" do
		'octavo'.en.plural.should == 'octavos' # 
	end


	it "pluralizes 'octopus' as 'octopuses'" do
		'octopus'.en.plural.should == 'octopuses'
	end

	it "pluralizes 'octopus' as 'octopodes' in classical mode" do
		Linguistics::EN.in_classical_mode do
			'octopus'.en.plural.should == 'octopodes'
		end
	end


	it "pluralizes 'oedema' as 'oedemas'" do
		'oedema'.en.plural.should == 'oedemas'
	end

	it "pluralizes 'oedema' as 'oedemata' in classical mode" do
		Linguistics::EN.in_classical_mode do
			'oedema'.en.plural.should == 'oedemata'
		end
	end


	it "pluralizes 'Oklahoman' as 'Oklahomans'" do
		'Oklahoman'.en.plural.should == 'Oklahomans' # 
	end


	it "pluralizes 'omnibus' as 'omnibuses'" do
		'omnibus'.en.plural.should == 'omnibuses' # 
	end


	# ACCUSATIVE
	it "pluralizes 'on it' as 'on them'" do
		'on it'.en.plural.should == 'on them' # 
	end


	it "pluralizes 'onus' as 'onuses'" do
		'onus'.en.plural.should == 'onuses' # 
	end


	it "pluralizes 'opera' as 'operas'" do
		'opera'.en.plural.should == 'operas' # 
	end


	it "pluralizes 'optimum' as 'optimums'" do
		'optimum'.en.plural.should == 'optimums'
	end

	it "pluralizes 'optimum' as 'optima' in classical mode" do
		Linguistics::EN.in_classical_mode do
			'optimum'.en.plural.should == 'optima'
		end
	end


	it "pluralizes 'opus' as 'opuses'" do
		'opus'.en.plural.should == 'opuses'
	end

	it "pluralizes 'opus' as 'opera' in classical mode" do
		Linguistics::EN.in_classical_mode do
			'opus'.en.plural.should == 'opera'
		end
	end


	it "pluralizes 'organon' as 'organa'" do
		'organon'.en.plural.should == 'organa' # 
	end


	# VERB (UNLIKE bride to be)
	it "pluralizes 'ought to be' as 'ought to be'" do
		'ought to be'.en.plural.should == 'ought to be' # 
	end


	it "pluralizes 'ovum' as 'ova'" do
		'ovum'.en.plural.should == 'ova' # 
	end


	it "pluralizes 'ox' as 'oxen'" do
		'ox'.en.plural.should == 'oxen' # 
	end


	# POSSESSIVE FORM
	it "pluralizes 'ox's' as 'oxen's'" do
		"ox's".en.plural.should == "oxen's" # 
	end


	it "pluralizes 'oxymoron' as 'oxymorons'" do
		'oxymoron'.en.plural.should == 'oxymorons'
	end

	it "pluralizes 'oxymoron' as 'oxymora' in classical mode" do
		Linguistics::EN.in_classical_mode do
			'oxymoron'.en.plural.should == 'oxymora'
		end
	end


	it "pluralizes 'Panaman' as 'Panamans'" do
		'Panaman'.en.plural.should == 'Panamans' # 
	end


	it "pluralizes 'parabola' as 'parabolas'" do
		'parabola'.en.plural.should == 'parabolas'
	end

	it "pluralizes 'parabola' as 'parabolae' in classical mode" do
		Linguistics::EN.in_classical_mode do
			'parabola'.en.plural.should == 'parabolae'
		end
	end


	it "pluralizes 'Parmese' as 'Parmese'" do
		'Parmese'.en.plural.should == 'Parmese' # 
	end


	it "pluralizes 'pathos' as 'pathoses'" do
		'pathos'.en.plural.should == 'pathoses' # 
	end


	it "pluralizes 'pegasus' as 'pegasuses'" do
		'pegasus'.en.plural.should == 'pegasuses' # 
	end


	it "pluralizes 'Pekingese' as 'Pekingese'" do
		'Pekingese'.en.plural.should == 'Pekingese' # 
	end


	it "pluralizes 'pelvis' as 'pelvises'" do
		'pelvis'.en.plural.should == 'pelvises' # 
	end


	it "pluralizes 'pendulum' as 'pendulums'" do
		'pendulum'.en.plural.should == 'pendulums' # 
	end


	it "pluralizes 'penis' as 'penises'" do
		'penis'.en.plural.should == 'penises'
	end

	it "pluralizes 'penis' as 'penes' in classical mode" do
		Linguistics::EN.in_classical_mode do
			'penis'.en.plural.should == 'penes'
		end
	end


	it "pluralizes 'penumbra' as 'penumbras'" do
		'penumbra'.en.plural.should == 'penumbras'
	end

	it "pluralizes 'penumbra' as 'penumbrae' in classical mode" do
		Linguistics::EN.in_classical_mode do
			'penumbra'.en.plural.should == 'penumbrae'
		end
	end


	it "pluralizes 'perihelion' as 'perihelia'" do
		'perihelion'.en.plural.should == 'perihelia' # 
	end


	it "pluralizes 'persona' as 'personae'" do
		'persona'.en.plural.should == 'personae' # 
	end


	it "pluralizes 'petroleum' as 'petroleums'" do
		'petroleum'.en.plural.should == 'petroleums' # 
	end


	it "pluralizes 'phalanx' as 'phalanxes'" do
		'phalanx'.en.plural.should == 'phalanxes'
	end

	it "pluralizes 'phalanx' as 'phalanges' in classical mode" do
		Linguistics::EN.in_classical_mode do
			'phalanx'.en.plural.should == 'phalanges'
		end
	end


	it "pluralizes 'PhD' as 'PhDs'" do
		'PhD'.en.plural.should == 'PhDs' # 
	end


	it "pluralizes 'phenomenon' as 'phenomena'" do
		'phenomenon'.en.plural.should == 'phenomena' # 
	end


	it "pluralizes 'philtrum' as 'philtrums'" do
		'philtrum'.en.plural.should == 'philtrums' # 
	end


	it "pluralizes 'photo' as 'photos'" do
		'photo'.en.plural.should == 'photos' # 
	end


	it "pluralizes 'phylum' as 'phylums'" do
		'phylum'.en.plural.should == 'phylums'
	end

	it "pluralizes 'phylum' as 'phyla' in classical mode" do
		Linguistics::EN.in_classical_mode do
			'phylum'.en.plural.should == 'phyla'
		end
	end


	it "pluralizes 'piano' as 'pianos'" do
		'piano'.en.plural.should == 'pianos'
	end

	it "pluralizes 'piano' as 'piani' in classical mode" do
		Linguistics::EN.in_classical_mode do
			'piano'.en.plural.should == 'piani'
		end
	end


	it "pluralizes 'Piedmontese' as 'Piedmontese'" do
		'Piedmontese'.en.plural.should == 'Piedmontese' # 
	end


	it "pluralizes 'pincer' as 'pincers'" do
		'pincer'.en.plural.should == 'pincers' # 
	end


	it "pluralizes 'pincers' as 'pincers'" do
		'pincers'.en.plural.should == 'pincers' # 
	end


	it "pluralizes 'Pistoiese' as 'Pistoiese'" do
		'Pistoiese'.en.plural.should == 'Pistoiese' # 
	end


	it "pluralizes 'plateau' as 'plateaus'" do
		'plateau'.en.plural.should == 'plateaus'
	end

	it "pluralizes 'plateau' as 'plateaux' in classical mode" do
		Linguistics::EN.in_classical_mode do
			'plateau'.en.plural.should == 'plateaux'
		end
	end


	it "pluralizes 'play' as 'plays'" do
		'play'.en.plural.should == 'plays' # 
	end


	it "pluralizes 'plexus' as 'plexuses'" do
		'plexus'.en.plural.should == 'plexuses'
	end

	it "pluralizes 'plexus' as 'plexus' in classical mode" do
		Linguistics::EN.in_classical_mode do
			'plexus'.en.plural.should == 'plexus'
		end
	end


	it "pluralizes 'pliers' as 'pliers'" do
		'pliers'.en.plural.should == 'pliers' # 
	end


	# VERB FORM
	it "pluralizes 'plies' as 'ply'" do
		'plies'.en.plural.should == 'ply' # 
	end


	it "pluralizes 'polis' as 'polises'" do
		'polis'.en.plural.should == 'polises' # 
	end


	it "pluralizes 'Polonese' as 'Polonese'" do
		'Polonese'.en.plural.should == 'Polonese' # 
	end


	it "pluralizes 'pontifex' as 'pontifexes'" do
		'pontifex'.en.plural.should == 'pontifexes'
	end

	it "pluralizes 'pontifex' as 'pontifices' in classical mode" do
		Linguistics::EN.in_classical_mode do
			'pontifex'.en.plural.should == 'pontifices'
		end
	end


	it "pluralizes 'portmanteau' as 'portmanteaus'" do
		'portmanteau'.en.plural.should == 'portmanteaus'
	end

	it "pluralizes 'portmanteau' as 'portmanteaux' in classical mode" do
		Linguistics::EN.in_classical_mode do
			'portmanteau'.en.plural.should == 'portmanteaux'
		end
	end


	it "pluralizes 'Portuguese' as 'Portuguese'" do
		'Portuguese'.en.plural.should == 'Portuguese' # 
	end


	it "pluralizes 'potato' as 'potatoes'" do
		'potato'.en.plural.should == 'potatoes' # 
	end


	it "pluralizes 'pox' as 'pox'" do
		'pox'.en.plural.should == 'pox' # 
	end


	it "pluralizes 'pragma' as 'pragmas'" do
		'pragma'.en.plural.should == 'pragmas'
	end

	it "pluralizes 'pragma' as 'pragmata' in classical mode" do
		Linguistics::EN.in_classical_mode do
			'pragma'.en.plural.should == 'pragmata'
		end
	end


	it "pluralizes 'premium' as 'premiums'" do
		'premium'.en.plural.should == 'premiums' # 
	end


	it "pluralizes 'prima donna' as 'prima donnas'" do
		'prima donna'.en.plural.should == 'prima donnas'
	end

	it "pluralizes 'prima donna' as 'prime donne' in classical mode" do
		Linguistics::EN.in_classical_mode do
			'prima donna'.en.plural.should == 'prime donne'
		end
	end


	it "pluralizes 'pro' as 'pros'" do
		'pro'.en.plural.should == 'pros' # 
	end


	it "pluralizes 'proceedings' as 'proceedings'" do
		'proceedings'.en.plural.should == 'proceedings' # 
	end


	it "pluralizes 'prolegomenon' as 'prolegomena'" do
		'prolegomenon'.en.plural.should == 'prolegomena' # 
	end


	it "pluralizes 'proof' as 'proofs'" do
		'proof'.en.plural.should == 'proofs' # 
	end


	it "pluralizes 'proof of concept' as 'proofs of concept'" do
		'proof of concept'.en.plural.should == 'proofs of concept' # 
	end


	it "pluralizes 'prosecutrix' as 'prosecutrixes'" do
		'prosecutrix'.en.plural.should == 'prosecutrixes'
	end

	it "pluralizes 'prosecutrix' as 'prosecutrices' in classical mode" do
		Linguistics::EN.in_classical_mode do
			'prosecutrix'.en.plural.should == 'prosecutrices'
		end
	end


	it "pluralizes 'prospectus' as 'prospectuses'" do
		'prospectus'.en.plural.should == 'prospectuses'
	end

	it "pluralizes 'prospectus' as 'prospectus' in classical mode" do
		Linguistics::EN.in_classical_mode do
			'prospectus'.en.plural.should == 'prospectus'
		end
	end


	it "pluralizes 'protozoan' as 'protozoans'" do
		'protozoan'.en.plural.should == 'protozoans' # 
	end


	it "pluralizes 'protozoon' as 'protozoa'" do
		'protozoon'.en.plural.should == 'protozoa' # 
	end


	it "pluralizes 'put' as 'put'" do
		'put'.en.plural.should == 'put' # 
	end


	it "pluralizes 'quantum' as 'quantums'" do
		'quantum'.en.plural.should == 'quantums'
	end

	it "pluralizes 'quantum' as 'quanta' in classical mode" do
		Linguistics::EN.in_classical_mode do
			'quantum'.en.plural.should == 'quanta'
		end
	end


	it "pluralizes 'quartermaster general' as 'quartermasters general'" do
		'quartermaster general'.en.plural.should == 'quartermasters general' # 
	end


	it "pluralizes 'quarto' as 'quartos'" do
		'quarto'.en.plural.should == 'quartos' # 
	end


	it "pluralizes 'quorum' as 'quorums'" do
		'quorum'.en.plural.should == 'quorums' # 
	end


	it "pluralizes 'rabies' as 'rabies'" do
		'rabies'.en.plural.should == 'rabies' # 
	end


	it "pluralizes 'radius' as 'radiuses'" do
		'radius'.en.plural.should == 'radiuses'
	end

	it "pluralizes 'radius' as 'radii' in classical mode" do
		Linguistics::EN.in_classical_mode do
			'radius'.en.plural.should == 'radii'
		end
	end


	it "pluralizes 'radix' as 'radices'" do
		'radix'.en.plural.should == 'radices' # 
	end


	it "pluralizes 'rebus' as 'rebuses'" do
		'rebus'.en.plural.should == 'rebuses' # 
	end


	it "pluralizes 'reindeer' as 'reindeer'" do
		'reindeer'.en.plural.should == 'reindeer' # 
	end


	it "pluralizes 'rhino' as 'rhinos'" do
		'rhino'.en.plural.should == 'rhinos' # 
	end


	it "pluralizes 'rhinoceros' as 'rhinoceroses'" do
		'rhinoceros'.en.plural.should == 'rhinoceroses'
	end

	it "pluralizes 'rhinoceros' as 'rhinoceros' in classical mode" do
		Linguistics::EN.in_classical_mode do
			'rhinoceros'.en.plural.should == 'rhinoceros'
		end
	end


	it "pluralizes 'Romagnese' as 'Romagnese'" do
		'Romagnese'.en.plural.should == 'Romagnese' # 
	end


	it "pluralizes 'Romanese' as 'Romanese'" do
		'Romanese'.en.plural.should == 'Romanese' # 
	end


	it "pluralizes 'romeo' as 'romeos'" do
		'romeo'.en.plural.should == 'romeos' # 
	end


	it "pluralizes 'roof' as 'roofs'" do
		'roof'.en.plural.should == 'roofs' # 
	end


	it "pluralizes 'rostrum' as 'rostrums'" do
		'rostrum'.en.plural.should == 'rostrums'
	end

	it "pluralizes 'rostrum' as 'rostra' in classical mode" do
		Linguistics::EN.in_classical_mode do
			'rostrum'.en.plural.should == 'rostra'
		end
	end


	it "pluralizes 'ruckus' as 'ruckuses'" do
		'ruckus'.en.plural.should == 'ruckuses' # 
	end


	it "pluralizes 'salmon' as 'salmon'" do
		'salmon'.en.plural.should == 'salmon' # 
	end


	it "pluralizes 'Sangirese' as 'Sangirese'" do
		'Sangirese'.en.plural.should == 'Sangirese' # 
	end


	it "pluralizes 'sank' as 'sank'" do
		'sank'.en.plural.should == 'sank' # 
	end


	it "pluralizes 'Sarawakese' as 'Sarawakese'" do
		'Sarawakese'.en.plural.should == 'Sarawakese' # 
	end


	it "pluralizes 'sarcoma' as 'sarcomas'" do
		'sarcoma'.en.plural.should == 'sarcomas'
	end

	it "pluralizes 'sarcoma' as 'sarcomata' in classical mode" do
		Linguistics::EN.in_classical_mode do
			'sarcoma'.en.plural.should == 'sarcomata'
		end
	end


	it "pluralizes 'sassafras' as 'sassafrases'" do
		'sassafras'.en.plural.should == 'sassafrases' # 
	end


	# NOUN FORM
	it "pluralizes 'saw' as 'saws'" do
		'saw'.en.plural.should == 'saws' # 
	end


	# VERB FORM (1st/2nd pers.)
	it "pluralizes 'saw' (as a verb) as 'saw'" do
		'saw'.en.plural_verb.should == 'saw' # 
	end


	# VERB FORM (3rd pers.)
	it "pluralizes 'saws' as 'saw'" do
		'saws'.en.plural.should == 'saw' # 
	end


	it "pluralizes 'scarf' as 'scarves'" do
		'scarf'.en.plural.should == 'scarves' # 
	end


	it "pluralizes 'schema' as 'schemas'" do
		'schema'.en.plural.should == 'schemas'
	end

	it "pluralizes 'schema' as 'schemata' in classical mode" do
		Linguistics::EN.in_classical_mode do
			'schema'.en.plural.should == 'schemata'
		end
	end


	it "pluralizes 'scissors' as 'scissors'" do
		'scissors'.en.plural.should == 'scissors' # 
	end


	it "pluralizes 'Scotsman' as 'Scotsmen'" do
		'Scotsman'.en.plural.should == 'Scotsmen' # 
	end


	it "pluralizes 'sea-bass' as 'sea-bass'" do
		'sea-bass'.en.plural.should == 'sea-bass' # 
	end


	it "pluralizes 'self' as 'selves'" do
		'self'.en.plural.should == 'selves' # 
	end


	it "pluralizes 'Selman' as 'Selmans'" do
		'Selman'.en.plural.should == 'Selmans' # 
	end


	it "pluralizes 'Senegalese' as 'Senegalese'" do
		'Senegalese'.en.plural.should == 'Senegalese' # 
	end


	it "pluralizes 'seraph' as 'seraphs'" do
		'seraph'.en.plural.should == 'seraphs'
	end

	it "pluralizes 'seraph' as 'seraphim' in classical mode" do
		Linguistics::EN.in_classical_mode do
			'seraph'.en.plural.should == 'seraphim'
		end
	end


	it "pluralizes 'series' as 'series'" do
		'series'.en.plural.should == 'series' # 
	end


	it "pluralizes 'shall eat' as 'shall eat'" do
		'shall eat'.en.plural.should == 'shall eat' # 
	end


	it "pluralizes 'Shavese' as 'Shavese'" do
		'Shavese'.en.plural.should == 'Shavese' # 
	end


	it "pluralizes 'Shawanese' as 'Shawanese'" do
		'Shawanese'.en.plural.should == 'Shawanese' # 
	end


	it "pluralizes 'she' as 'they'" do
		'she'.en.plural.should == 'they' # 
	end


	it "pluralizes 'sheaf' as 'sheaves'" do
		'sheaf'.en.plural.should == 'sheaves' # 
	end


	it "pluralizes 'shears' as 'shears'" do
		'shears'.en.plural.should == 'shears' # 
	end


	it "pluralizes 'sheep' as 'sheep'" do
		'sheep'.en.plural.should == 'sheep' # 
	end


	it "pluralizes 'shelf' as 'shelves'" do
		'shelf'.en.plural.should == 'shelves' # 
	end


	it "pluralizes 'should have' as 'should have'" do
		'should have'.en.plural.should == 'should have' # 
	end


	it "pluralizes 'Siamese' as 'Siamese'" do
		'Siamese'.en.plural.should == 'Siamese' # 
	end


	it "pluralizes 'Sienese' as 'Sienese'" do
		'Sienese'.en.plural.should == 'Sienese' # 
	end


	it "pluralizes 'Sikkimese' as 'Sikkimese'" do
		'Sikkimese'.en.plural.should == 'Sikkimese' # 
	end


	it "pluralizes 'silex' as 'silices'" do
		'silex'.en.plural.should == 'silices' # 
	end


	it "pluralizes 'simplex' as 'simplexes'" do
		'simplex'.en.plural.should == 'simplexes'
	end

	it "pluralizes 'simplex' as 'simplices' in classical mode" do
		Linguistics::EN.in_classical_mode do
			'simplex'.en.plural.should == 'simplices'
		end
	end


	it "pluralizes 'Singhalese' as 'Singhalese'" do
		'Singhalese'.en.plural.should == 'Singhalese' # 
	end


	it "pluralizes 'Sinhalese' as 'Sinhalese'" do
		'Sinhalese'.en.plural.should == 'Sinhalese' # 
	end


	it "pluralizes 'sinus' as 'sinuses'" do
		'sinus'.en.plural.should == 'sinuses'
	end

	it "pluralizes 'sinus' as 'sinus' in classical mode" do
		Linguistics::EN.in_classical_mode do
			'sinus'.en.plural.should == 'sinus'
		end
	end


	it "pluralizes 'size' as 'sizes'" do
		'size'.en.plural.should == 'sizes' # 
	end


	# VERB FORM
	it "pluralizes 'sizes' as 'size'" do
		'sizes'.en.plural.should == 'size' # 
	end


	it "pluralizes 'smallpox' as 'smallpox'" do
		'smallpox'.en.plural.should == 'smallpox' # 
	end


	it "pluralizes 'Smith' as 'Smiths'" do
		'Smith'.en.plural.should == 'Smiths' # 
	end


	it "pluralizes 'Sogdianese' as 'Sogdianese'" do
		'Sogdianese'.en.plural.should == 'Sogdianese' # 
	end


	it "pluralizes 'soliloquy' as 'soliloquies'" do
		'soliloquy'.en.plural.should == 'soliloquies' # 
	end


	it "pluralizes 'solo' as 'solos'" do
		'solo'.en.plural.should == 'solos'
	end

	it "pluralizes 'solo' as 'soli' in classical mode" do
		Linguistics::EN.in_classical_mode do
			'solo'.en.plural.should == 'soli'
		end
	end


	it "pluralizes 'soma' as 'somas'" do
		'soma'.en.plural.should == 'somas'
	end

	it "pluralizes 'soma' as 'somata' in classical mode" do
		Linguistics::EN.in_classical_mode do
			'soma'.en.plural.should == 'somata'
		end
	end


	it "pluralizes 'son of a bitch' as 'sons of bitches'" do
		'son of a bitch'.en.plural.should == 'sons of bitches' # 
	end


	it "pluralizes 'Sonaman' as 'Sonamans'" do
		'Sonaman'.en.plural.should == 'Sonamans' # 
	end


	it "pluralizes 'soprano' as 'sopranos'" do
		'soprano'.en.plural.should == 'sopranos'
	end

	it "pluralizes 'soprano' as 'soprani' in classical mode" do
		Linguistics::EN.in_classical_mode do
			'soprano'.en.plural.should == 'soprani'
		end
	end


	it "pluralizes 'sought' as 'sought'" do
		'sought'.en.plural.should == 'sought' # 
	end


	it "pluralizes 'species' as 'species'" do
		'species'.en.plural.should == 'species' # 
	end


	it "pluralizes 'spectrum' as 'spectrums'" do
		'spectrum'.en.plural.should == 'spectrums'
	end

	it "pluralizes 'spectrum' as 'spectra' in classical mode" do
		Linguistics::EN.in_classical_mode do
			'spectrum'.en.plural.should == 'spectra'
		end
	end


	it "pluralizes 'speculum' as 'speculums'" do
		'speculum'.en.plural.should == 'speculums'
	end

	it "pluralizes 'speculum' as 'specula' in classical mode" do
		Linguistics::EN.in_classical_mode do
			'speculum'.en.plural.should == 'specula'
		end
	end


	it "pluralizes 'spent' as 'spent'" do
		'spent'.en.plural.should == 'spent' # 
	end


	it "pluralizes 'spermatozoon' as 'spermatozoa'" do
		'spermatozoon'.en.plural.should == 'spermatozoa' # 
	end


	it "pluralizes 'sphinx' as 'sphinxes'" do
		'sphinx'.en.plural.should == 'sphinxes'
	end

	it "pluralizes 'sphinx' as 'sphinges' in classical mode" do
		Linguistics::EN.in_classical_mode do
			'sphinx'.en.plural.should == 'sphinges'
		end
	end


	it "pluralizes 'stadium' as 'stadiums'" do
		'stadium'.en.plural.should == 'stadiums'
	end

	it "pluralizes 'stadium' as 'stadia' in classical mode" do
		Linguistics::EN.in_classical_mode do
			'stadium'.en.plural.should == 'stadia'
		end
	end


	it "pluralizes 'stamen' as 'stamens'" do
		'stamen'.en.plural.should == 'stamens'
	end

	it "pluralizes 'stamen' as 'stamina' in classical mode" do
		Linguistics::EN.in_classical_mode do
			'stamen'.en.plural.should == 'stamina'
		end
	end


	it "pluralizes 'status' as 'statuses'" do
		'status'.en.plural.should == 'statuses'
	end

	it "pluralizes 'status' as 'status' in classical mode" do
		Linguistics::EN.in_classical_mode do
			'status'.en.plural.should == 'status'
		end
	end


	it "pluralizes 'stereo' as 'stereos'" do
		'stereo'.en.plural.should == 'stereos' # 
	end


	it "pluralizes 'stigma' as 'stigmas'" do
		'stigma'.en.plural.should == 'stigmas'
	end

	it "pluralizes 'stigma' as 'stigmata' in classical mode" do
		Linguistics::EN.in_classical_mode do
			'stigma'.en.plural.should == 'stigmata'
		end
	end


	it "pluralizes 'stimulus' as 'stimuli'" do
		'stimulus'.en.plural.should == 'stimuli' # 
	end


	it "pluralizes 'stoma' as 'stomas'" do
		'stoma'.en.plural.should == 'stomas'
	end

	it "pluralizes 'stoma' as 'stomata' in classical mode" do
		Linguistics::EN.in_classical_mode do
			'stoma'.en.plural.should == 'stomata'
		end
	end


	it "pluralizes 'storey' as 'storeys'" do
		'storey'.en.plural.should == 'storeys' # 
	end


	it "pluralizes 'story' as 'stories'" do
		'story'.en.plural.should == 'stories' # 
	end


	it "pluralizes 'stratum' as 'strata'" do
		'stratum'.en.plural.should == 'strata' # 
	end


	it "pluralizes 'strife' as 'strifes'" do
		'strife'.en.plural.should == 'strifes' # 
	end


	it "pluralizes 'stylo' as 'stylos'" do
		'stylo'.en.plural.should == 'stylos' # 
	end


	it "pluralizes 'stylus' as 'styluses'" do
		'stylus'.en.plural.should == 'styluses'
	end

	it "pluralizes 'stylus' as 'styli' in classical mode" do
		Linguistics::EN.in_classical_mode do
			'stylus'.en.plural.should == 'styli'
		end
	end


	it "pluralizes 'succubus' as 'succubuses'" do
		'succubus'.en.plural.should == 'succubuses'
	end

	it "pluralizes 'succubus' as 'succubi' in classical mode" do
		Linguistics::EN.in_classical_mode do
			'succubus'.en.plural.should == 'succubi'
		end
	end


	it "pluralizes 'Sudanese' as 'Sudanese'" do
		'Sudanese'.en.plural.should == 'Sudanese' # 
	end


	it "pluralizes 'suffix' as 'suffixes'" do
		'suffix'.en.plural.should == 'suffixes' # 
	end


	it "pluralizes 'Sundanese' as 'Sundanese'" do
		'Sundanese'.en.plural.should == 'Sundanese' # 
	end


	it "pluralizes 'superior' as 'superiors'" do
		'superior'.en.plural.should == 'superiors' # 
	end


	it "pluralizes 'Surgeon-General' as 'Surgeons-General'" do
		'Surgeon-General'.en.plural.should == 'Surgeons-General' # 
	end


	it "pluralizes 'surplus' as 'surpluses'" do
		'surplus'.en.plural.should == 'surpluses' # 
	end


	it "pluralizes 'Swahilese' as 'Swahilese'" do
		'Swahilese'.en.plural.should == 'Swahilese' # 
	end


	it "pluralizes 'swine' as 'swines'" do
		'swine'.en.plural.should == 'swines'
	end

	it "pluralizes 'swine' as 'swine' in classical mode" do
		Linguistics::EN.in_classical_mode do
			'swine'.en.plural.should == 'swine'
		end
	end


	it "pluralizes 'syringe' as 'syringes'" do
		'syringe'.en.plural.should == 'syringes' # 
	end


	it "pluralizes 'syrinx' as 'syrinxes'" do
		'syrinx'.en.plural.should == 'syrinxes'
	end

	it "pluralizes 'syrinx' as 'syringes' in classical mode" do
		Linguistics::EN.in_classical_mode do
			'syrinx'.en.plural.should == 'syringes'
		end
	end


	it "pluralizes 'tableau' as 'tableaus'" do
		'tableau'.en.plural.should == 'tableaus'
	end

	it "pluralizes 'tableau' as 'tableaux' in classical mode" do
		Linguistics::EN.in_classical_mode do
			'tableau'.en.plural.should == 'tableaux'
		end
	end


	it "pluralizes 'Tacoman' as 'Tacomans'" do
		'Tacoman'.en.plural.should == 'Tacomans' # 
	end


	it "pluralizes 'tattoo' as 'tattoos'" do
		'tattoo'.en.plural.should == 'tattoos' # 
	end


	it "pluralizes 'tempo' as 'tempos'" do
		'tempo'.en.plural.should == 'tempos'
	end

	it "pluralizes 'tempo' as 'tempi' in classical mode" do
		Linguistics::EN.in_classical_mode do
			'tempo'.en.plural.should == 'tempi'
		end
	end


	it "pluralizes 'Tenggerese' as 'Tenggerese'" do
		'Tenggerese'.en.plural.should == 'Tenggerese' # 
	end


	it "pluralizes 'testatrix' as 'testatrixes'" do
		'testatrix'.en.plural.should == 'testatrixes'
	end

	it "pluralizes 'testatrix' as 'testatrices' in classical mode" do
		Linguistics::EN.in_classical_mode do
			'testatrix'.en.plural.should == 'testatrices'
		end
	end


	it "pluralizes 'testes' as 'testes'" do
		'testes'.en.plural.should == 'testes' # 
	end


	it "pluralizes 'testis' as 'testes'" do
		'testis'.en.plural.should == 'testes' # 
	end


	it "pluralizes 'that' as 'those'" do
		'that'.en.plural.should == 'those' # 
	end


	# POSSESSIVE FORM (GENDER-INCLUSIVE)
	it "pluralizes 'their' as 'their'" do
		'their'.en.plural.should == 'their' # 
	end


	# ugly but gaining currency
	it "pluralizes 'themself' as 'themselves'" do
		'themself'.en.plural.should == 'themselves' # 
	end


	# for indeterminate gender
	it "pluralizes 'they' as 'they'" do
		'they'.en.plural.should == 'they' # 
	end


	it "pluralizes 'this' as 'these'" do
		'this'.en.plural.should == 'these' # 
	end


	# VERB FORM
	it "pluralizes 'thought' (as a verb) as 'thought'" do
		'thought'.en.plural_verb.should == 'thought' # 
	end


	# NOUN FORM
	it "pluralizes 'thought' as 'thoughts'" do
		'thought'.en.plural.should == 'thoughts' # 
	end


	it "pluralizes 'Times' as 'Timeses'" do
		'Times'.en.plural.should == 'Timeses' # 
	end


	it "pluralizes 'Timorese' as 'Timorese'" do
		'Timorese'.en.plural.should == 'Timorese' # 
	end


	it "pluralizes 'Tirolese' as 'Tirolese'" do
		'Tirolese'.en.plural.should == 'Tirolese' # 
	end


	it "pluralizes 'to her' as 'to them'" do
		'to her'.en.plural.should == 'to them' # 
	end


	it "pluralizes 'to herself' as 'to themselves'" do
		'to herself'.en.plural.should == 'to themselves' # 
	end


	it "pluralizes 'to him' as 'to them'" do
		'to him'.en.plural.should == 'to them' # 
	end


	it "pluralizes 'to himself' as 'to themselves'" do
		'to himself'.en.plural.should == 'to themselves' # 
	end


	it "pluralizes 'to it' as 'to them'" do
		'to it'.en.plural.should == 'to them' # 
	end


	# ACCUSATIVE
	it "pluralizes 'to it' as 'to them'" do
		'to it'.en.plural.should == 'to them' # 
	end


	it "pluralizes 'to itself' as 'to themselves'" do
		'to itself'.en.plural.should == 'to themselves' # 
	end


	it "pluralizes 'to me' as 'to us'" do
		'to me'.en.plural.should == 'to us' # 
	end


	it "pluralizes 'to myself' as 'to ourselves'" do
		'to myself'.en.plural.should == 'to ourselves' # 
	end


	# for indeterminate gender
	it "pluralizes 'to them' as 'to them'" do
		'to them'.en.plural.should == 'to them' # 
	end


	# ugly but gaining currency
	it "pluralizes 'to themself' as 'to themselves'" do
		'to themself'.en.plural.should == 'to themselves' # 
	end


	it "pluralizes 'to you' as 'to you'" do
		'to you'.en.plural.should == 'to you' # 
	end


	it "pluralizes 'to yourself' as 'to yourselves'" do
		'to yourself'.en.plural.should == 'to yourselves' # 
	end


	it "pluralizes 'Tocharese' as 'Tocharese'" do
		'Tocharese'.en.plural.should == 'Tocharese' # 
	end


	it "pluralizes 'tomato' as 'tomatoes'" do
		'tomato'.en.plural.should == 'tomatoes' # 
	end


	it "pluralizes 'Tonkinese' as 'Tonkinese'" do
		'Tonkinese'.en.plural.should == 'Tonkinese' # 
	end


	it "pluralizes 'tonsillitis' as 'tonsillitises'" do
		'tonsillitis'.en.plural.should == 'tonsillitises' # 
	end


	it "pluralizes 'tooth' as 'teeth'" do
		'tooth'.en.plural.should == 'teeth' # 
	end


	it "pluralizes 'Torinese' as 'Torinese'" do
		'Torinese'.en.plural.should == 'Torinese' # 
	end


	it "pluralizes 'torus' as 'toruses'" do
		'torus'.en.plural.should == 'toruses'
	end

	it "pluralizes 'torus' as 'tori' in classical mode" do
		Linguistics::EN.in_classical_mode do
			'torus'.en.plural.should == 'tori'
		end
	end


	it "pluralizes 'trapezium' as 'trapeziums'" do
		'trapezium'.en.plural.should == 'trapeziums'
	end

	it "pluralizes 'trapezium' as 'trapezia' in classical mode" do
		Linguistics::EN.in_classical_mode do
			'trapezium'.en.plural.should == 'trapezia'
		end
	end


	it "pluralizes 'trauma' as 'traumas'" do
		'trauma'.en.plural.should == 'traumas'
	end

	it "pluralizes 'trauma' as 'traumata' in classical mode" do
		Linguistics::EN.in_classical_mode do
			'trauma'.en.plural.should == 'traumata'
		end
	end


	it "pluralizes 'travois' as 'travois'" do
		'travois'.en.plural.should == 'travois' # 
	end


	it "pluralizes 'trellis' as 'trellises'" do
		'trellis'.en.plural.should == 'trellises' # 
	end


	it "pluralizes 'tries' as 'try'" do
		'tries'.en.plural.should == 'try' # 
	end


	it "pluralizes 'trilby' as 'trilbys'" do
		'trilby'.en.plural.should == 'trilbys' # 
	end


	it "pluralizes 'trousers' as 'trousers'" do
		'trousers'.en.plural.should == 'trousers' # 
	end


	it "pluralizes 'trousseau' as 'trousseaus'" do
		'trousseau'.en.plural.should == 'trousseaus'
	end

	it "pluralizes 'trousseau' as 'trousseaux' in classical mode" do
		Linguistics::EN.in_classical_mode do
			'trousseau'.en.plural.should == 'trousseaux'
		end
	end


	it "pluralizes 'trout' as 'trout'" do
		'trout'.en.plural.should == 'trout' # 
	end


	it "pluralizes 'try' as 'tries'" do
		'try'.en.plural.should == 'tries' # 
	end


	it "pluralizes 'tuna' as 'tuna'" do
		'tuna'.en.plural.should == 'tuna' # 
	end


	it "pluralizes 'turf' as 'turfs'" do
		'turf'.en.plural.should == 'turfs'
	end

	it "pluralizes 'turf' as 'turves' in classical mode" do
		Linguistics::EN.in_classical_mode do
			'turf'.en.plural.should == 'turves'
		end
	end


	it "pluralizes 'Tyrolese' as 'Tyrolese'" do
		'Tyrolese'.en.plural.should == 'Tyrolese' # 
	end


	it "pluralizes 'ultimatum' as 'ultimatums'" do
		'ultimatum'.en.plural.should == 'ultimatums'
	end

	it "pluralizes 'ultimatum' as 'ultimata' in classical mode" do
		Linguistics::EN.in_classical_mode do
			'ultimatum'.en.plural.should == 'ultimata'
		end
	end


	it "pluralizes 'umbilicus' as 'umbilicuses'" do
		'umbilicus'.en.plural.should == 'umbilicuses'
	end

	it "pluralizes 'umbilicus' as 'umbilici' in classical mode" do
		Linguistics::EN.in_classical_mode do
			'umbilicus'.en.plural.should == 'umbilici'
		end
	end


	it "pluralizes 'umbra' as 'umbras'" do
		'umbra'.en.plural.should == 'umbras'
	end

	it "pluralizes 'umbra' as 'umbrae' in classical mode" do
		Linguistics::EN.in_classical_mode do
			'umbra'.en.plural.should == 'umbrae'
		end
	end


	it "pluralizes 'uterus' as 'uteruses'" do
		'uterus'.en.plural.should == 'uteruses'
	end

	it "pluralizes 'uterus' as 'uteri' in classical mode" do
		Linguistics::EN.in_classical_mode do
			'uterus'.en.plural.should == 'uteri'
		end
	end


	it "pluralizes 'vacuum' as 'vacuums'" do
		'vacuum'.en.plural.should == 'vacuums'
	end

	it "pluralizes 'vacuum' as 'vacua' in classical mode" do
		Linguistics::EN.in_classical_mode do
			'vacuum'.en.plural.should == 'vacua'
		end
	end


	it "pluralizes 'vellum' as 'vellums'" do
		'vellum'.en.plural.should == 'vellums' # 
	end


	it "pluralizes 'velum' as 'velums'" do
		'velum'.en.plural.should == 'velums'
	end

	it "pluralizes 'velum' as 'vela' in classical mode" do
		Linguistics::EN.in_classical_mode do
			'velum'.en.plural.should == 'vela'
		end
	end


	it "pluralizes 'Vermontese' as 'Vermontese'" do
		'Vermontese'.en.plural.should == 'Vermontese' # 
	end


	it "pluralizes 'Veronese' as 'Veronese'" do
		'Veronese'.en.plural.should == 'Veronese' # 
	end


	it "pluralizes 'vertebra' as 'vertebrae'" do
		'vertebra'.en.plural.should == 'vertebrae' # 
	end


	it "pluralizes 'vertex' as 'vertexes'" do
		'vertex'.en.plural.should == 'vertexes'
	end

	it "pluralizes 'vertex' as 'vertices' in classical mode" do
		Linguistics::EN.in_classical_mode do
			'vertex'.en.plural.should == 'vertices'
		end
	end


	it "pluralizes 'Viennese' as 'Viennese'" do
		'Viennese'.en.plural.should == 'Viennese' # 
	end


	it "pluralizes 'Vietnamese' as 'Vietnamese'" do
		'Vietnamese'.en.plural.should == 'Vietnamese' # 
	end


	it "pluralizes 'virus' as 'viruses'" do
		'virus'.en.plural.should == 'viruses' # 
	end


	it "pluralizes 'vixen' as 'vixens'" do
		'vixen'.en.plural.should == 'vixens' # 
	end


	it "pluralizes 'vortex' as 'vortexes'" do
		'vortex'.en.plural.should == 'vortexes'
	end

	it "pluralizes 'vortex' as 'vortices' in classical mode" do
		Linguistics::EN.in_classical_mode do
			'vortex'.en.plural.should == 'vortices'
		end
	end


	it "pluralizes 'walrus' as 'walruses'" do
		'walrus'.en.plural.should == 'walruses' # 
	end


	it "pluralizes 'was' as 'were'" do
		'was'.en.plural.should == 'were' # 
	end


	it "pluralizes 'was faced with' as 'were faced with'" do
		'was faced with'.en.plural.should == 'were faced with' # 
	end


	it "pluralizes 'was hoping' as 'were hoping'" do
		'was hoping'.en.plural.should == 'were hoping' # 
	end


	it "pluralizes 'Wenchowese' as 'Wenchowese'" do
		'Wenchowese'.en.plural.should == 'Wenchowese' # 
	end


	it "pluralizes 'were' as 'were'" do
		'were'.en.plural.should == 'were' # 
	end


	it "pluralizes 'were found' as 'were found'" do
		'were found'.en.plural.should == 'were found' # 
	end


	it "pluralizes 'wharf' as 'wharves'" do
		'wharf'.en.plural.should == 'wharves' # 
	end


	it "pluralizes 'whiting' as 'whiting'" do
		'whiting'.en.plural.should == 'whiting' # 
	end


	it "pluralizes 'Whitmanese' as 'Whitmanese'" do
		'Whitmanese'.en.plural.should == 'Whitmanese' # 
	end


	it "pluralizes 'wife' as 'wives'" do
		'wife'.en.plural.should == 'wives' # 
	end


	it "pluralizes 'wildebeest' as 'wildebeests'" do
		'wildebeest'.en.plural.should == 'wildebeests'
	end

	it "pluralizes 'wildebeest' as 'wildebeest' in classical mode" do
		Linguistics::EN.in_classical_mode do
			'wildebeest'.en.plural.should == 'wildebeest'
		end
	end


	# VERB FORM
	it "pluralizes 'will' (as a verb) as 'will'" do
		'will'.en.plural_verb.should == 'will' # 
	end


	# NOUN FORM
	it "pluralizes 'will' as 'wills'" do
		'will'.en.plural.should == 'wills' # 
	end


	# VERB FORM
	it "pluralizes 'will eat' (as a verb) as 'will eat'" do
		'will eat'.en.plural_verb.should == 'will eat' # 
	end


	# VERB FORM
	it "pluralizes 'wills' as 'will'" do
		'wills'.en.plural.should == 'will' # 
	end


	it "pluralizes 'wish' as 'wishes'" do
		'wish'.en.plural.should == 'wishes' # 
	end


	it "pluralizes 'with him' as 'with them'" do
		'with him'.en.plural.should == 'with them' # 
	end


	# ACCUSATIVE
	it "pluralizes 'with it' as 'with them'" do
		'with it'.en.plural.should == 'with them' # 
	end


	it "pluralizes 'wolf' as 'wolves'" do
		'wolf'.en.plural.should == 'wolves' # 
	end


	it "pluralizes 'woman' as 'women'" do
		'woman'.en.plural.should == 'women' # 
	end


	it "pluralizes 'woman of substance' as 'women of substance'" do
		'woman of substance'.en.plural.should == 'women of substance' # 
	end


	# POSSESSIVE FORM
	it "pluralizes 'woman's' as 'women's'" do
		"woman's".en.plural.should == "women's" # 
	end


	it "pluralizes 'woodlouse' as 'woodlice'" do
		'woodlouse'.en.plural.should == 'woodlice' # 
	end


	it "pluralizes 'Yakiman' as 'Yakimans'" do
		'Yakiman'.en.plural.should == 'Yakimans' # 
	end


	it "pluralizes 'Yengeese' as 'Yengeese'" do
		'Yengeese'.en.plural.should == 'Yengeese' # 
	end


	it "pluralizes 'Yokohaman' as 'Yokohamans'" do
		'Yokohaman'.en.plural.should == 'Yokohamans' # 
	end


	it "pluralizes 'you' as 'you'" do
		'you'.en.plural.should == 'you' # 
	end


	# POSSESSIVE FORM
	it "pluralizes 'your' as 'your'" do
		'your'.en.plural.should == 'your' # 
	end


	it "pluralizes 'yourself' as 'yourselves'" do
		'yourself'.en.plural.should == 'yourselves' # 
	end


	it "pluralizes 'Yuman' as 'Yumans'" do
		'Yuman'.en.plural.should == 'Yumans' # 
	end


	it "pluralizes 'Yunnanese' as 'Yunnanese'" do
		'Yunnanese'.en.plural.should == 'Yunnanese' # 
	end


	it "pluralizes 'zoon' as 'zoa'" do
		'zoon'.en.plural.should == 'zoa' # 
	end


	context "lprintf formatters" do

		it "registers the :PL lprintf formatter" do
			Linguistics::EN.lprintf_formatters.should include( :PL )
		end

		it "pluralizes the argument to %PL" do
			"What's with all the %PL?".en.lprintf( 'mouse' ).
				should == "What's with all the mice?"
		end

	end

end

