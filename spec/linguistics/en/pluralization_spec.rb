#!/usr/bin/env rspec -cfd

require_relative '../../helpers'

require 'rspec'

require 'linguistics'
require 'linguistics/en'
require 'linguistics/en/pluralization'


describe Linguistics::EN::Pluralization do

	before( :all ) do
		Linguistics.use( :en )
	end


	it "pluralizes 'a' as 'some'" do
		expect( 'a'.en.plural ).to eq( 'some' )
	end

	# NOUN FORM
	it "pluralizes 'a' (as a noun) as 'as'" do
		expect( 'a'.en.plural_noun ).to eq( 'as' )
	end

	it "pluralizes 'A.C.R.O.N.Y.M.' as 'A.C.R.O.N.Y.M.s'" do
		expect( 'A.C.R.O.N.Y.M.'.en.plural ).to eq( 'A.C.R.O.N.Y.M.s' )
	end

	it "pluralizes 'abscissa' as 'abscissas'" do
		expect( 'abscissa'.en.plural ).to eq( 'abscissas' )
	end

	it "pluralizes 'abscissa' as 'abscissae' in classical mode" do
		Linguistics::EN.in_classical_mode do
			expect( 'abscissa'.en.plural ).to eq( 'abscissae' )
		end
	end

	it "pluralizes 'Achinese' as 'Achinese'" do
		expect( 'Achinese'.en.plural ).to eq( 'Achinese' )
	end

	it "pluralizes 'acropolis' as 'acropolises'" do
		expect( 'acropolis'.en.plural ).to eq( 'acropolises' )
	end

	it "pluralizes 'adieu' as 'adieus'" do
		expect( 'adieu'.en.plural ).to eq( 'adieus' )
	end

	it "pluralizes 'adieu' as 'adieux' in classical mode" do
		Linguistics::EN.in_classical_mode do
			expect( 'adieu'.en.plural ).to eq( 'adieux' )
		end
	end

	it "pluralizes 'adjutant general' as 'adjutant generals'" do
		expect( 'adjutant general'.en.plural ).to eq( 'adjutant generals' )
	end

	it "pluralizes 'aegis' as 'aegises'" do
		expect( 'aegis'.en.plural ).to eq( 'aegises' )
	end

	it "pluralizes 'afflatus' as 'afflatuses'" do
		expect( 'afflatus'.en.plural ).to eq( 'afflatuses' )
	end

	it "pluralizes 'afreet' as 'afreets'" do
		expect( 'afreet'.en.plural ).to eq( 'afreets' )
	end

	it "pluralizes 'afreet' as 'afreeti' in classical mode" do
		Linguistics::EN.in_classical_mode do
			expect( 'afreet'.en.plural ).to eq( 'afreeti' )
		end
	end

	it "pluralizes 'afrit' as 'afrits'" do
		expect( 'afrit'.en.plural ).to eq( 'afrits' )
	end

	it "pluralizes 'afrit' as 'afriti' in classical mode" do
		Linguistics::EN.in_classical_mode do
			expect( 'afrit'.en.plural ).to eq( 'afriti' )
		end
	end

	it "pluralizes 'agendum' as 'agenda'" do
		expect( 'agendum'.en.plural ).to eq( 'agenda' )
	end

	it "pluralizes 'aide-de-camp' as 'aides-de-camp'" do
		expect( 'aide-de-camp'.en.plural ).to eq( 'aides-de-camp' )
	end

	it "pluralizes 'Alabaman' as 'Alabamans'" do
		expect( 'Alabaman'.en.plural ).to eq( 'Alabamans' )
	end

	it "pluralizes 'albino' as 'albinos'" do
		expect( 'albino'.en.plural ).to eq( 'albinos' )
	end

	it "pluralizes 'album' as 'albums'" do
		expect( 'album'.en.plural ).to eq( 'albums' )
	end

	it "pluralizes 'Alfurese' as 'Alfurese'" do
		expect( 'Alfurese'.en.plural ).to eq( 'Alfurese' )
	end

	it "pluralizes 'alga' as 'algae'" do
		expect( 'alga'.en.plural ).to eq( 'algae' )
	end

	it "pluralizes 'alias' as 'aliases'" do
		expect( 'alias'.en.plural ).to eq( 'aliases' )
	end

	it "pluralizes 'alto' as 'altos'" do
		expect( 'alto'.en.plural ).to eq( 'altos' )
	end

	it "pluralizes 'alto' as 'alti' in classical mode" do
		Linguistics::EN.in_classical_mode do
			expect( 'alto'.en.plural ).to eq( 'alti' )
		end
	end

	it "pluralizes 'alumna' as 'alumnae'" do
		expect( 'alumna'.en.plural ).to eq( 'alumnae' )
	end

	it "pluralizes 'alumnus' as 'alumni'" do
		expect( 'alumnus'.en.plural ).to eq( 'alumni' )
	end

	it "pluralizes 'alveolus' as 'alveoli'" do
		expect( 'alveolus'.en.plural ).to eq( 'alveoli' )
	end

	it "pluralizes 'am' as 'are'" do
		expect( 'am'.en.plural ).to eq( 'are' )
	end

	it "pluralizes 'am going' as 'are going'" do
		expect( 'am going'.en.plural ).to eq( 'are going' )
	end

	it "pluralizes 'ambassador-at-large' as 'ambassadors-at-large'" do
		expect( 'ambassador-at-large'.en.plural ).to eq( 'ambassadors-at-large' )
	end

	it "pluralizes 'Amboinese' as 'Amboinese'" do
		expect( 'Amboinese'.en.plural ).to eq( 'Amboinese' )
	end

	it "pluralizes 'Americanese' as 'Americanese'" do
		expect( 'Americanese'.en.plural ).to eq( 'Americanese' )
	end

	it "pluralizes 'amoeba' as 'amoebas'" do
		expect( 'amoeba'.en.plural ).to eq( 'amoebas' )
	end

	it "pluralizes 'amoeba' as 'amoebae' in classical mode" do
		Linguistics::EN.in_classical_mode do
			expect( 'amoeba'.en.plural ).to eq( 'amoebae' )
		end
	end

	it "pluralizes 'Amoyese' as 'Amoyese'" do
		expect( 'Amoyese'.en.plural ).to eq( 'Amoyese' )
	end

	# INDEFINITE ARTICLE
	it "pluralizes 'an' as 'some'" do
		expect( 'an'.en.plural ).to eq( 'some' )
	end

	it "pluralizes 'analysis' as 'analyses'" do
		expect( 'analysis'.en.plural ).to eq( 'analyses' )
	end

	it "pluralizes 'anathema' as 'anathemas'" do
		expect( 'anathema'.en.plural ).to eq( 'anathemas' )
	end

	it "pluralizes 'anathema' as 'anathemata' in classical mode" do
		Linguistics::EN.in_classical_mode do
			expect( 'anathema'.en.plural ).to eq( 'anathemata' )
		end
	end

	it "pluralizes 'Andamanese' as 'Andamanese'" do
		expect( 'Andamanese'.en.plural ).to eq( 'Andamanese' )
	end

	it "pluralizes 'Angolese' as 'Angolese'" do
		expect( 'Angolese'.en.plural ).to eq( 'Angolese' )
	end

	it "pluralizes 'Annamese' as 'Annamese'" do
		expect( 'Annamese'.en.plural ).to eq( 'Annamese' )
	end

	it "pluralizes 'antenna' as 'antennas'" do
		expect( 'antenna'.en.plural ).to eq( 'antennas' )
	end

	it "pluralizes 'antenna' as 'antennae' in classical mode" do
		Linguistics::EN.in_classical_mode do
			expect( 'antenna'.en.plural ).to eq( 'antennae' )
		end
	end

	it "pluralizes 'anus' as 'anuses'" do
		expect( 'anus'.en.plural ).to eq( 'anuses' )
	end

	it "pluralizes 'apex' as 'apexes'" do
		expect( 'apex'.en.plural ).to eq( 'apexes' )
	end

	it "pluralizes 'apex' as 'apices' in classical mode" do
		Linguistics::EN.in_classical_mode do
			expect( 'apex'.en.plural ).to eq( 'apices' )
		end
	end

	# POSSESSIVE FORM
	it "pluralizes 'apex's' as 'apexes''" do
		expect( "apex's".en.plural ).to eq( "apexes'" ) # apices'
	end

	it "pluralizes 'aphelion' as 'aphelia'" do
		expect( 'aphelion'.en.plural ).to eq( 'aphelia' )
	end

	it "pluralizes 'apparatus' as 'apparatuses'" do
		expect( 'apparatus'.en.plural ).to eq( 'apparatuses' )
	end

	it "pluralizes 'apparatus' as 'apparatus' in classical mode" do
		Linguistics::EN.in_classical_mode do
			expect( 'apparatus'.en.plural ).to eq( 'apparatus' )
		end
	end

	it "pluralizes 'appendix' as 'appendixes'" do
		expect( 'appendix'.en.plural ).to eq( 'appendixes' )
	end

	it "pluralizes 'appendix' as 'appendices' in classical mode" do
		Linguistics::EN.in_classical_mode do
			expect( 'appendix'.en.plural ).to eq( 'appendices' )
		end
	end

	it "pluralizes 'apple' as 'apples'" do
		expect( 'apple'.en.plural ).to eq( 'apples' )
	end

	it "pluralizes 'aquarium' as 'aquariums'" do
		expect( 'aquarium'.en.plural ).to eq( 'aquariums' )
	end

	it "pluralizes 'aquarium' as 'aquaria' in classical mode" do
		Linguistics::EN.in_classical_mode do
			expect( 'aquarium'.en.plural ).to eq( 'aquaria' )
		end
	end

	it "pluralizes 'Aragonese' as 'Aragonese'" do
		expect( 'Aragonese'.en.plural ).to eq( 'Aragonese' )
	end

	it "pluralizes 'Arakanese' as 'Arakanese'" do
		expect( 'Arakanese'.en.plural ).to eq( 'Arakanese' )
	end

	it "pluralizes 'archipelago' as 'archipelagos'" do
		expect( 'archipelago'.en.plural ).to eq( 'archipelagos' )
	end

	it "pluralizes 'are' as 'are'" do
		expect( 'are'.en.plural ).to eq( 'are' )
	end

	it "pluralizes 'are made' as 'are made'" do
		expect( 'are made'.en.plural ).to eq( 'are made' )
	end

	it "pluralizes 'armadillo' as 'armadillos'" do
		expect( 'armadillo'.en.plural ).to eq( 'armadillos' )
	end

	it "pluralizes 'arpeggio' as 'arpeggios'" do
		expect( 'arpeggio'.en.plural ).to eq( 'arpeggios' )
	end

	it "pluralizes 'arthritis' as 'arthritises'" do
		expect( 'arthritis'.en.plural ).to eq( 'arthritises' )
	end

	it "pluralizes 'asbestos' as 'asbestoses'" do
		expect( 'asbestos'.en.plural ).to eq( 'asbestoses' )
	end

	it "pluralizes 'asparagus' as 'asparaguses'" do
		expect( 'asparagus'.en.plural ).to eq( 'asparaguses' )
	end

	it "pluralizes 'ass' as 'asses'" do
		expect( 'ass'.en.plural ).to eq( 'asses' )
	end

	it "pluralizes 'Assamese' as 'Assamese'" do
		expect( 'Assamese'.en.plural ).to eq( 'Assamese' )
	end

	it "pluralizes 'asylum' as 'asylums'" do
		expect( 'asylum'.en.plural ).to eq( 'asylums' )
	end

	it "pluralizes 'asyndeton' as 'asyndeta'" do
		expect( 'asyndeton'.en.plural ).to eq( 'asyndeta' )
	end

	# ACCUSATIVE
	it "pluralizes 'at it' as 'at them'" do
		expect( 'at it'.en.plural ).to eq( 'at them' )
	end

	it "pluralizes 'ate' as 'ate'" do
		expect( 'ate'.en.plural ).to eq( 'ate' )
	end

	it "pluralizes 'atlas' as 'atlases'" do
		expect( 'atlas'.en.plural ).to eq( 'atlases' )
	end

	it "pluralizes 'attorney general' as 'attorneys general'" do
		expect( 'attorney general'.en.plural ).to eq( 'attorneys general' )
	end
	it "pluralizes 'attorney of record' as 'attorneys of record'" do
		expect( 'attorney of record'.en.plural ).to eq( 'attorneys of record' )
	end


	it "pluralizes 'aurora' as 'auroras'" do
		expect( 'aurora'.en.plural ).to eq( 'auroras' )
	end

	it "pluralizes 'aurora' as 'aurorae' in classical mode" do
		Linguistics::EN.in_classical_mode do
			expect( 'aurora'.en.plural ).to eq( 'aurorae' )
		end
	end


	it "pluralizes 'aviatrix' as 'aviatrixes'" do
		expect( 'aviatrix'.en.plural ).to eq( 'aviatrixes' )
	end

	it "pluralizes 'aviatrix' as 'aviatrices' in classical mode" do
		Linguistics::EN.in_classical_mode do
			expect( 'aviatrix'.en.plural ).to eq( 'aviatrices' )
		end
	end


	it "pluralizes 'aviatrix's' as 'aviatrixes''" do
		expect( "aviatrix's".en.plural ).to eq( "aviatrixes'" ) # aviatrices'
	end


	it "pluralizes 'Avignonese' as 'Avignonese'" do
		expect( 'Avignonese'.en.plural ).to eq( 'Avignonese' )
	end


	it "pluralizes 'axe' as 'axes'" do
		expect( 'axe'.en.plural ).to eq( 'axes' )
	end


	it "pluralizes 'axis' as 'axes'" do
		expect( 'axis'.en.plural ).to eq( 'axes' )
	end


	it "pluralizes 'Azerbaijanese' as 'Azerbaijanese'" do
		expect( 'Azerbaijanese'.en.plural ).to eq( 'Azerbaijanese' )
	end


	it "pluralizes 'bacillus' as 'bacilli'" do
		expect( 'bacillus'.en.plural ).to eq( 'bacilli' )
	end


	it "pluralizes 'bacterium' as 'bacteria'" do
		expect( 'bacterium'.en.plural ).to eq( 'bacteria' )
	end


	it "pluralizes 'Bahaman' as 'Bahamans'" do
		expect( 'Bahaman'.en.plural ).to eq( 'Bahamans' )
	end


	it "pluralizes 'Balinese' as 'Balinese'" do
		expect( 'Balinese'.en.plural ).to eq( 'Balinese' )
	end


	it "pluralizes 'bamboo' as 'bamboos'" do
		expect( 'bamboo'.en.plural ).to eq( 'bamboos' )
	end


	it "pluralizes 'banjo' as 'banjoes'" do
		expect( 'banjo'.en.plural ).to eq( 'banjoes' )
	end


	# INSTRUMENT, NOT FISH
	it "pluralizes 'bass' as 'basses'" do
		expect( 'bass'.en.plural ).to eq( 'basses' )
	end


	it "pluralizes 'basso' as 'bassos'" do
		expect( 'basso'.en.plural ).to eq( 'bassos' )
	end

	it "pluralizes 'basso' as 'bassi' in classical mode" do
		Linguistics::EN.in_classical_mode do
			expect( 'basso'.en.plural ).to eq( 'bassi' )
		end
	end


	it "pluralizes 'bathos' as 'bathoses'" do
		expect( 'bathos'.en.plural ).to eq( 'bathoses' )
	end


	it "pluralizes 'beau' as 'beaus'" do
		expect( 'beau'.en.plural ).to eq( 'beaus' )
	end

	it "pluralizes 'beau' as 'beaux' in classical mode" do
		Linguistics::EN.in_classical_mode do
			expect( 'beau'.en.plural ).to eq( 'beaux' )
		end
	end


	it "pluralizes 'beef' as 'beefs'" do
		expect( 'beef'.en.plural ).to eq( 'beefs' )
	end

	it "pluralizes 'beef' as 'beeves' in classical mode" do
		Linguistics::EN.in_classical_mode do
			expect( 'beef'.en.plural ).to eq( 'beeves' )
		end
	end


	# ACCUSATIVE
	it "pluralizes 'beneath it' as 'beneath them'" do
		expect( 'beneath it'.en.plural ).to eq( 'beneath them' )
	end


	it "pluralizes 'Bengalese' as 'Bengalese'" do
		expect( 'Bengalese'.en.plural ).to eq( 'Bengalese' )
	end


	# VERB FORM
	it "pluralizes 'bent' (as a verb) as 'bent'" do
		expect( 'bent'.en.plural_verb ).to eq( 'bent' )
	end


	# NOUN FORM
	it "pluralizes 'bent' as 'bents'" do
		expect( 'bent'.en.plural ).to eq( 'bents' )
	end


	it "pluralizes 'Bernese' as 'Bernese'" do
		expect( 'Bernese'.en.plural ).to eq( 'Bernese' )
	end


	it "pluralizes 'Bhutanese' as 'Bhutanese'" do
		expect( 'Bhutanese'.en.plural ).to eq( 'Bhutanese' )
	end


	it "pluralizes 'bias' as 'biases'" do
		expect( 'bias'.en.plural ).to eq( 'biases' )
	end


	it "pluralizes 'biceps' as 'biceps'" do
		expect( 'biceps'.en.plural ).to eq( 'biceps' )
	end


	it "pluralizes 'bison' as 'bisons'" do
		expect( 'bison'.en.plural ).to eq( 'bisons' )
	end

	it "pluralizes 'bison' as 'bison' in classical mode" do
		Linguistics::EN.in_classical_mode do
			expect( 'bison'.en.plural ).to eq( 'bison' )
		end
	end


	it "pluralizes 'Bolognese' as 'Bolognese'" do
		expect( 'Bolognese'.en.plural ).to eq( 'Bolognese' )
	end


	it "pluralizes 'bonus' as 'bonuses'" do
		expect( 'bonus'.en.plural ).to eq( 'bonuses' )
	end


	it "pluralizes 'Borghese' as 'Borghese'" do
		expect( 'Borghese'.en.plural ).to eq( 'Borghese' )
	end


	it "pluralizes 'boss' as 'bosses'" do
		expect( 'boss'.en.plural ).to eq( 'bosses' )
	end


	it "pluralizes 'Bostonese' as 'Bostonese'" do
		expect( 'Bostonese'.en.plural ).to eq( 'Bostonese' )
	end


	it "pluralizes 'box' as 'boxes'" do
		expect( 'box'.en.plural ).to eq( 'boxes' )
	end


	it "pluralizes 'boy' as 'boys'" do
		expect( 'boy'.en.plural ).to eq( 'boys' )
	end


	it "pluralizes 'bravo' as 'bravoes'" do
		expect( 'bravo'.en.plural ).to eq( 'bravoes' )
	end


	it "pluralizes 'bream' as 'bream'" do
		expect( 'bream'.en.plural ).to eq( 'bream' )
	end


	it "pluralizes 'breeches' as 'breeches'" do
		expect( 'breeches'.en.plural ).to eq( 'breeches' )
	end


	it "pluralizes 'bride-to-be' as 'brides-to-be'" do
		expect( 'bride-to-be'.en.plural ).to eq( 'brides-to-be' )
	end


	it "pluralizes 'britches' as 'britches'" do
		expect( 'britches'.en.plural ).to eq( 'britches' )
	end


	it "pluralizes 'bronchitis' as 'bronchitises'" do
		expect( 'bronchitis'.en.plural ).to eq( 'bronchitises' )
	end


	it "pluralizes 'bronchus' as 'bronchi'" do
		expect( 'bronchus'.en.plural ).to eq( 'bronchi' )
	end


	it "pluralizes 'brother' as 'brothers'" do
		expect( 'brother'.en.plural ).to eq( 'brothers' )
	end

	it "pluralizes 'brother' as 'brethren' in classical mode" do
		Linguistics::EN.in_classical_mode do
			expect( 'brother'.en.plural ).to eq( 'brethren' )
		end
	end


	it "pluralizes 'brother's' as 'brothers''" do
		expect( "brother's".en.plural ).to eq( "brothers'" ) # brethren's
	end


	it "pluralizes 'buffalo' as 'buffaloes'" do
		expect( 'buffalo'.en.plural ).to eq( 'buffaloes' )
	end

	it "pluralizes 'buffalo' as 'buffalo' in classical mode" do
		Linguistics::EN.in_classical_mode do
			expect( 'buffalo'.en.plural ).to eq( 'buffalo' )
		end
	end


	it "pluralizes 'Buginese' as 'Buginese'" do
		expect( 'Buginese'.en.plural ).to eq( 'Buginese' )
	end


	it "pluralizes 'buoy' as 'buoys'" do
		expect( 'buoy'.en.plural ).to eq( 'buoys' )
	end


	it "pluralizes 'bureau' as 'bureaus'" do
		expect( 'bureau'.en.plural ).to eq( 'bureaus' )
	end

	it "pluralizes 'bureau' as 'bureaux' in classical mode" do
		Linguistics::EN.in_classical_mode do
			expect( 'bureau'.en.plural ).to eq( 'bureaux' )
		end
	end


	it "pluralizes 'Burman' as 'Burmans'" do
		expect( 'Burman'.en.plural ).to eq( 'Burmans' )
	end


	it "pluralizes 'Burmese' as 'Burmese'" do
		expect( 'Burmese'.en.plural ).to eq( 'Burmese' )
	end


	it "pluralizes 'bursitis' as 'bursitises'" do
		expect( 'bursitis'.en.plural ).to eq( 'bursitises' )
	end


	it "pluralizes 'bus' as 'buses'" do
		expect( 'bus'.en.plural ).to eq( 'buses' )
	end


	it "pluralizes 'buzz' as 'buzzes'" do
		expect( 'buzz'.en.plural ).to eq( 'buzzes' )
	end


	# VERB FORM
	it "pluralizes 'buzzes' as 'buzz'" do
		expect( 'buzzes'.en.plural ).to eq( 'buzz' )
	end


	# ACCUSATIVE
	it "pluralizes 'by it' as 'by them'" do
		expect( 'by it'.en.plural ).to eq( 'by them' )
	end


	it "pluralizes 'caddis' as 'caddises'" do
		expect( 'caddis'.en.plural ).to eq( 'caddises' )
	end


	it "pluralizes 'cake' as 'cakes'" do
		expect( 'cake'.en.plural ).to eq( 'cakes' )
	end


	it "pluralizes 'Calabrese' as 'Calabrese'" do
		expect( 'Calabrese'.en.plural ).to eq( 'Calabrese' )
	end


	it "pluralizes 'calf' as 'calves'" do
		expect( 'calf'.en.plural ).to eq( 'calves' )
	end


	it "pluralizes 'callus' as 'calluses'" do
		expect( 'callus'.en.plural ).to eq( 'calluses' )
	end


	it "pluralizes 'Camaldolese' as 'Camaldolese'" do
		expect( 'Camaldolese'.en.plural ).to eq( 'Camaldolese' )
	end


	it "pluralizes 'cameo' as 'cameos'" do
		expect( 'cameo'.en.plural ).to eq( 'cameos' )
	end


	it "pluralizes 'campus' as 'campuses'" do
		expect( 'campus'.en.plural ).to eq( 'campuses' )
	end


	# NOUN FORM
	it "pluralizes 'can' as 'cans'" do
		expect( 'can'.en.plural ).to eq( 'cans' )
	end


	# VERB FORM (all pers.)
	it "pluralizes 'can' (as a verb) as 'can'" do
		expect( 'can'.en.plural_verb ).to eq( 'can' )
	end


	it "pluralizes 'candelabrum' as 'candelabra'" do
		expect( 'candelabrum'.en.plural ).to eq( 'candelabra' )
	end


	it "pluralizes 'cannabis' as 'cannabises'" do
		expect( 'cannabis'.en.plural ).to eq( 'cannabises' )
	end


	it "pluralizes 'canto' as 'cantos'" do
		expect( 'canto'.en.plural ).to eq( 'cantos' )
	end


	it "pluralizes 'Cantonese' as 'Cantonese'" do
		expect( 'Cantonese'.en.plural ).to eq( 'Cantonese' )
	end


	it "pluralizes 'cantus' as 'cantus'" do
		expect( 'cantus'.en.plural ).to eq( 'cantus' )
	end


	it "pluralizes 'canvas' as 'canvases'" do
		expect( 'canvas'.en.plural ).to eq( 'canvases' )
	end


	it "pluralizes 'CAPITAL' as 'CAPITALS'" do
		expect( 'CAPITAL'.en.plural ).to eq( 'CAPITALS' )
	end


	it "pluralizes 'carcinoma' as 'carcinomas'" do
		expect( 'carcinoma'.en.plural ).to eq( 'carcinomas' )
	end

	it "pluralizes 'carcinoma' as 'carcinomata' in classical mode" do
		Linguistics::EN.in_classical_mode do
			expect( 'carcinoma'.en.plural ).to eq( 'carcinomata' )
		end
	end


	it "pluralizes 'care' as 'cares'" do
		expect( 'care'.en.plural ).to eq( 'cares' )
	end


	it "pluralizes 'cargo' as 'cargoes'" do
		expect( 'cargo'.en.plural ).to eq( 'cargoes' )
	end


	it "pluralizes 'Carlylese' as 'Carlylese'" do
		expect( 'Carlylese'.en.plural ).to eq( 'Carlylese' )
	end


	it "pluralizes 'carp' as 'carp'" do
		expect( 'carp'.en.plural ).to eq( 'carp' )
	end


	it "pluralizes 'Cassinese' as 'Cassinese'" do
		expect( 'Cassinese'.en.plural ).to eq( 'Cassinese' )
	end


	it "pluralizes 'cat' as 'cats'" do
		expect( 'cat'.en.plural ).to eq( 'cats' )
	end


	it "pluralizes 'catfish' as 'catfish'" do
		expect( 'catfish'.en.plural ).to eq( 'catfish' )
	end


	it "pluralizes 'Celanese' as 'Celanese'" do
		expect( 'Celanese'.en.plural ).to eq( 'Celanese' )
	end


	it "pluralizes 'Ceylonese' as 'Ceylonese'" do
		expect( 'Ceylonese'.en.plural ).to eq( 'Ceylonese' )
	end


	it "pluralizes 'chairman' as 'chairmen'" do
		expect( 'chairman'.en.plural ).to eq( 'chairmen' )
	end


	it "pluralizes 'chamois' as 'chamois'" do
		expect( 'chamois'.en.plural ).to eq( 'chamois' )
	end


	it "pluralizes 'chaos' as 'chaoses'" do
		expect( 'chaos'.en.plural ).to eq( 'chaoses' )
	end


	it "pluralizes 'chapeau' as 'chapeaus'" do
		expect( 'chapeau'.en.plural ).to eq( 'chapeaus' )
	end

	it "pluralizes 'chapeau' as 'chapeaux' in classical mode" do
		Linguistics::EN.in_classical_mode do
			expect( 'chapeau'.en.plural ).to eq( 'chapeaux' )
		end
	end


	it "pluralizes 'charisma' as 'charismas'" do
		expect( 'charisma'.en.plural ).to eq( 'charismas' )
	end

	it "pluralizes 'charisma' as 'charismata' in classical mode" do
		Linguistics::EN.in_classical_mode do
			expect( 'charisma'.en.plural ).to eq( 'charismata' )
		end
	end


	it "pluralizes 'chases' as 'chase'" do
		expect( 'chases'.en.plural ).to eq( 'chase' )
	end


	it "pluralizes 'chassis' as 'chassis'" do
		expect( 'chassis'.en.plural ).to eq( 'chassis' )
	end


	it "pluralizes 'chateau' as 'chateaus'" do
		expect( 'chateau'.en.plural ).to eq( 'chateaus' )
	end

	it "pluralizes 'chateau' as 'chateaux' in classical mode" do
		Linguistics::EN.in_classical_mode do
			expect( 'chateau'.en.plural ).to eq( 'chateaux' )
		end
	end


	it "pluralizes 'cherub' as 'cherubs'" do
		expect( 'cherub'.en.plural ).to eq( 'cherubs' )
	end

	it "pluralizes 'cherub' as 'cherubim' in classical mode" do
		Linguistics::EN.in_classical_mode do
			expect( 'cherub'.en.plural ).to eq( 'cherubim' )
		end
	end


	it "pluralizes 'chickenpox' as 'chickenpox'" do
		expect( 'chickenpox'.en.plural ).to eq( 'chickenpox' )
	end


	it "pluralizes 'chief' as 'chiefs'" do
		expect( 'chief'.en.plural ).to eq( 'chiefs' )
	end


	it "pluralizes 'child' as 'children'" do
		expect( 'child'.en.plural ).to eq( 'children' )
	end


	it "pluralizes 'Chinese' as 'Chinese'" do
		expect( 'Chinese'.en.plural ).to eq( 'Chinese' )
	end


	it "pluralizes 'chorus' as 'choruses'" do
		expect( 'chorus'.en.plural ).to eq( 'choruses' )
	end


	it "pluralizes 'church' as 'churches'" do
		expect( 'church'.en.plural ).to eq( 'churches' )
	end


	it "pluralizes 'cicatrix' as 'cicatrixes'" do
		expect( 'cicatrix'.en.plural ).to eq( 'cicatrixes' )
	end

	it "pluralizes 'cicatrix' as 'cicatrices' in classical mode" do
		Linguistics::EN.in_classical_mode do
			expect( 'cicatrix'.en.plural ).to eq( 'cicatrices' )
		end
	end


	it "pluralizes 'circus' as 'circuses'" do
		expect( 'circus'.en.plural ).to eq( 'circuses' )
	end


	it "pluralizes 'class' as 'classes'" do
		expect( 'class'.en.plural ).to eq( 'classes' )
	end


	# VERB FORM
	it "pluralizes 'classes' as 'class'" do
		expect( 'classes'.en.plural ).to eq( 'class' )
	end


	it "pluralizes 'clippers' as 'clippers'" do
		expect( 'clippers'.en.plural ).to eq( 'clippers' )
	end


	it "pluralizes 'clitoris' as 'clitorises'" do
		expect( 'clitoris'.en.plural ).to eq( 'clitorises' )
	end

	it "pluralizes 'clitoris' as 'clitorides' in classical mode" do
		Linguistics::EN.in_classical_mode do
			expect( 'clitoris'.en.plural ).to eq( 'clitorides' )
		end
	end


	it "pluralizes 'cod' as 'cod'" do
		expect( 'cod'.en.plural ).to eq( 'cod' )
	end


	it "pluralizes 'codex' as 'codices'" do
		expect( 'codex'.en.plural ).to eq( 'codices' )
	end


	it "pluralizes 'coitus' as 'coitus'" do
		expect( 'coitus'.en.plural ).to eq( 'coitus' )
	end


	it "pluralizes 'commando' as 'commandos'" do
		expect( 'commando'.en.plural ).to eq( 'commandos' )
	end


	it "pluralizes 'compendium' as 'compendiums'" do
		expect( 'compendium'.en.plural ).to eq( 'compendiums' )
	end

	it "pluralizes 'compendium' as 'compendia' in classical mode" do
		Linguistics::EN.in_classical_mode do
			expect( 'compendium'.en.plural ).to eq( 'compendia' )
		end
	end


	it "pluralizes 'Congoese' as 'Congoese'" do
		expect( 'Congoese'.en.plural ).to eq( 'Congoese' )
	end


	it "pluralizes 'Congolese' as 'Congolese'" do
		expect( 'Congolese'.en.plural ).to eq( 'Congolese' )
	end


	it "pluralizes 'conspectus' as 'conspectuses'" do
		expect( 'conspectus'.en.plural ).to eq( 'conspectuses' )
	end


	it "pluralizes 'contralto' as 'contraltos'" do
		expect( 'contralto'.en.plural ).to eq( 'contraltos' )
	end

	it "pluralizes 'contralto' as 'contralti' in classical mode" do
		Linguistics::EN.in_classical_mode do
			expect( 'contralto'.en.plural ).to eq( 'contralti' )
		end
	end


	it "pluralizes 'contretemps' as 'contretemps'" do
		expect( 'contretemps'.en.plural ).to eq( 'contretemps' )
	end


	it "pluralizes 'conundrum' as 'conundrums'" do
		expect( 'conundrum'.en.plural ).to eq( 'conundrums' )
	end


	it "pluralizes 'corps' as 'corps'" do
		expect( 'corps'.en.plural ).to eq( 'corps' )
	end


	it "pluralizes 'corpus' as 'corpuses'" do
		expect( 'corpus'.en.plural ).to eq( 'corpuses' )
	end

	it "pluralizes 'corpus' as 'corpora' in classical mode" do
		Linguistics::EN.in_classical_mode do
			expect( 'corpus'.en.plural ).to eq( 'corpora' )
		end
	end


	it "pluralizes 'cortex' as 'cortexes'" do
		expect( 'cortex'.en.plural ).to eq( 'cortexes' )
	end

	it "pluralizes 'cortex' as 'cortices' in classical mode" do
		Linguistics::EN.in_classical_mode do
			expect( 'cortex'.en.plural ).to eq( 'cortices' )
		end
	end


	it "pluralizes 'cosmos' as 'cosmoses'" do
		expect( 'cosmos'.en.plural ).to eq( 'cosmoses' )
	end


	it "pluralizes 'court martial' as 'courts martial'" do
		expect( 'court martial'.en.plural ).to eq( 'courts martial' )
	end


	it "pluralizes 'cow' as 'cows'" do
		expect( 'cow'.en.plural ).to eq( 'cows' )
	end

	it "pluralizes 'cow' as 'kine' in classical mode" do
		Linguistics::EN.in_classical_mode do
			expect( 'cow'.en.plural ).to eq( 'kine' )
		end
	end


	it "pluralizes 'cranium' as 'craniums'" do
		expect( 'cranium'.en.plural ).to eq( 'craniums' )
	end

	it "pluralizes 'cranium' as 'crania' in classical mode" do
		Linguistics::EN.in_classical_mode do
			expect( 'cranium'.en.plural ).to eq( 'crania' )
		end
	end


	it "pluralizes 'crescendo' as 'crescendos'" do
		expect( 'crescendo'.en.plural ).to eq( 'crescendos' )
	end


	it "pluralizes 'criterion' as 'criteria'" do
		expect( 'criterion'.en.plural ).to eq( 'criteria' )
	end


	it "pluralizes 'curriculum' as 'curriculums'" do
		expect( 'curriculum'.en.plural ).to eq( 'curriculums' )
	end

	it "pluralizes 'curriculum' as 'curricula' in classical mode" do
		Linguistics::EN.in_classical_mode do
			expect( 'curriculum'.en.plural ).to eq( 'curricula' )
		end
	end


	it "pluralizes 'dais' as 'daises'" do
		expect( 'dais'.en.plural ).to eq( 'daises' )
	end


	it "pluralizes 'data point' as 'data points'" do
		expect( 'data point'.en.plural ).to eq( 'data points' )
	end


	it "pluralizes 'datum' as 'data'" do
		expect( 'datum'.en.plural ).to eq( 'data' )
	end


	it "pluralizes 'debris' as 'debris'" do
		expect( 'debris'.en.plural ).to eq( 'debris' )
	end


	it "pluralizes 'decorum' as 'decorums'" do
		expect( 'decorum'.en.plural ).to eq( 'decorums' )
	end


	it "pluralizes 'deer' as 'deer'" do
		expect( 'deer'.en.plural ).to eq( 'deer' )
	end


	it "pluralizes 'delphinium' as 'delphiniums'" do
		expect( 'delphinium'.en.plural ).to eq( 'delphiniums' )
	end


	it "pluralizes 'desideratum' as 'desiderata'" do
		expect( 'desideratum'.en.plural ).to eq( 'desiderata' )
	end


	it "pluralizes 'diabetes' as 'diabetes'" do
		expect( 'diabetes'.en.plural ).to eq( 'diabetes' )
	end


	it "pluralizes 'dictum' as 'dictums'" do
		expect( 'dictum'.en.plural ).to eq( 'dictums' )
	end

	it "pluralizes 'dictum' as 'dicta' in classical mode" do
		Linguistics::EN.in_classical_mode do
			expect( 'dictum'.en.plural ).to eq( 'dicta' )
		end
	end


	it "pluralizes 'did' as 'did'" do
		expect( 'did'.en.plural ).to eq( 'did' )
	end


	it "pluralizes 'did need' as 'did need'" do
		expect( 'did need'.en.plural ).to eq( 'did need' )
	end


	it "pluralizes 'digitalis' as 'digitalises'" do
		expect( 'digitalis'.en.plural ).to eq( 'digitalises' )
	end


	it "pluralizes 'dingo' as 'dingoes'" do
		expect( 'dingo'.en.plural ).to eq( 'dingoes' )
	end


	it "pluralizes 'diploma' as 'diplomas'" do
		expect( 'diploma'.en.plural ).to eq( 'diplomas' )
	end

	it "pluralizes 'diploma' as 'diplomata' in classical mode" do
		Linguistics::EN.in_classical_mode do
			expect( 'diploma'.en.plural ).to eq( 'diplomata' )
		end
	end


	it "pluralizes 'discus' as 'discuses'" do
		expect( 'discus'.en.plural ).to eq( 'discuses' )
	end


	it "pluralizes 'dish' as 'dishes'" do
		expect( 'dish'.en.plural ).to eq( 'dishes' )
	end


	it "pluralizes 'ditto' as 'dittos'" do
		expect( 'ditto'.en.plural ).to eq( 'dittos' )
	end


	it "pluralizes 'djinn' as 'djinn'" do
		expect( 'djinn'.en.plural ).to eq( 'djinn' )
	end


	it "pluralizes 'does' as 'do'" do
		expect( 'does'.en.plural ).to eq( 'do' )
	end


	it "pluralizes 'dog' as 'dogs'" do
		expect( 'dog'.en.plural ).to eq( 'dogs' )
	end


	it "pluralizes 'dogma' as 'dogmas'" do
		expect( 'dogma'.en.plural ).to eq( 'dogmas' )
	end

	it "pluralizes 'dogma' as 'dogmata' in classical mode" do
		Linguistics::EN.in_classical_mode do
			expect( 'dogma'.en.plural ).to eq( 'dogmata' )
		end
	end


	it "pluralizes 'dominatrix' as 'dominatrixes'" do
		expect( 'dominatrix'.en.plural ).to eq( 'dominatrixes' )
	end

	it "pluralizes 'dominatrix' as 'dominatrices' in classical mode" do
		Linguistics::EN.in_classical_mode do
			expect( 'dominatrix'.en.plural ).to eq( 'dominatrices' )
		end
	end


	it "pluralizes 'domino' as 'dominoes'" do
		expect( 'domino'.en.plural ).to eq( 'dominoes' )
	end


	it "pluralizes 'Dongolese' as 'Dongolese'" do
		expect( 'Dongolese'.en.plural ).to eq( 'Dongolese' )
	end


	it "pluralizes 'drama' as 'dramas'" do
		expect( 'drama'.en.plural ).to eq( 'dramas' )
	end

	it "pluralizes 'drama' as 'dramata' in classical mode" do
		Linguistics::EN.in_classical_mode do
			expect( 'drama'.en.plural ).to eq( 'dramata' )
		end
	end


	it "pluralizes 'drum' as 'drums'" do
		expect( 'drum'.en.plural ).to eq( 'drums' )
	end


	it "pluralizes 'dwarf' as 'dwarves'" do
		expect( 'dwarf'.en.plural ).to eq( 'dwarves' )
	end


	it "pluralizes 'dynamo' as 'dynamos'" do
		expect( 'dynamo'.en.plural ).to eq( 'dynamos' )
	end


	it "pluralizes 'edema' as 'edemas'" do
		expect( 'edema'.en.plural ).to eq( 'edemas' )
	end

	it "pluralizes 'edema' as 'edemata' in classical mode" do
		Linguistics::EN.in_classical_mode do
			expect( 'edema'.en.plural ).to eq( 'edemata' )
		end
	end


	it "pluralizes 'eland' as 'elands'" do
		expect( 'eland'.en.plural ).to eq( 'elands' )
	end

	it "pluralizes 'eland' as 'eland' in classical mode" do
		Linguistics::EN.in_classical_mode do
			expect( 'eland'.en.plural ).to eq( 'eland' )
		end
	end


	it "pluralizes 'elf' as 'elves'" do
		expect( 'elf'.en.plural ).to eq( 'elves' )
	end


	it "pluralizes 'elk' as 'elks'" do
		expect( 'elk'.en.plural ).to eq( 'elks' )
	end

	it "pluralizes 'elk' as 'elk' in classical mode" do
		Linguistics::EN.in_classical_mode do
			expect( 'elk'.en.plural ).to eq( 'elk' )
		end
	end


	it "pluralizes 'embryo' as 'embryos'" do
		expect( 'embryo'.en.plural ).to eq( 'embryos' )
	end


	it "pluralizes 'emporium' as 'emporiums'" do
		expect( 'emporium'.en.plural ).to eq( 'emporiums' )
	end

	it "pluralizes 'emporium' as 'emporia' in classical mode" do
		Linguistics::EN.in_classical_mode do
			expect( 'emporium'.en.plural ).to eq( 'emporia' )
		end
	end


	it "pluralizes 'encephalitis' as 'encephalitises'" do
		expect( 'encephalitis'.en.plural ).to eq( 'encephalitises' )
	end


	it "pluralizes 'enconium' as 'enconiums'" do
		expect( 'enconium'.en.plural ).to eq( 'enconiums' )
	end

	it "pluralizes 'enconium' as 'enconia' in classical mode" do
		Linguistics::EN.in_classical_mode do
			expect( 'enconium'.en.plural ).to eq( 'enconia' )
		end
	end


	it "pluralizes 'enema' as 'enemas'" do
		expect( 'enema'.en.plural ).to eq( 'enemas' )
	end

	it "pluralizes 'enema' as 'enemata' in classical mode" do
		Linguistics::EN.in_classical_mode do
			expect( 'enema'.en.plural ).to eq( 'enemata' )
		end
	end


	it "pluralizes 'enigma' as 'enigmas'" do
		expect( 'enigma'.en.plural ).to eq( 'enigmas' )
	end

	it "pluralizes 'enigma' as 'enigmata' in classical mode" do
		Linguistics::EN.in_classical_mode do
			expect( 'enigma'.en.plural ).to eq( 'enigmata' )
		end
	end


	it "pluralizes 'ephemeris' as 'ephemerides'" do
		expect( 'ephemeris'.en.plural ).to eq( 'ephemerides' )
	end


	it "pluralizes 'epidermis' as 'epidermises'" do
		expect( 'epidermis'.en.plural ).to eq( 'epidermises' )
	end


	it "pluralizes 'erratum' as 'errata'" do
		expect( 'erratum'.en.plural ).to eq( 'errata' )
	end


	it "pluralizes 'ethos' as 'ethoses'" do
		expect( 'ethos'.en.plural ).to eq( 'ethoses' )
	end


	it "pluralizes 'eucalyptus' as 'eucalyptuses'" do
		expect( 'eucalyptus'.en.plural ).to eq( 'eucalyptuses' )
	end


	it "pluralizes 'extremum' as 'extrema'" do
		expect( 'extremum'.en.plural ).to eq( 'extrema' )
	end


	it "pluralizes 'eyas' as 'eyases'" do
		expect( 'eyas'.en.plural ).to eq( 'eyases' )
	end


	it "pluralizes 'factotum' as 'factotums'" do
		expect( 'factotum'.en.plural ).to eq( 'factotums' )
	end


	it "pluralizes 'Faroese' as 'Faroese'" do
		expect( 'Faroese'.en.plural ).to eq( 'Faroese' )
	end


	it "pluralizes 'fauna' as 'faunas'" do
		expect( 'fauna'.en.plural ).to eq( 'faunas' )
	end

	it "pluralizes 'fauna' as 'faunae' in classical mode" do
		Linguistics::EN.in_classical_mode do
			expect( 'fauna'.en.plural ).to eq( 'faunae' )
		end
	end


	it "pluralizes 'fax' as 'faxes'" do
		expect( 'fax'.en.plural ).to eq( 'faxes' )
	end


	it "pluralizes 'Ferrarese' as 'Ferrarese'" do
		expect( 'Ferrarese'.en.plural ).to eq( 'Ferrarese' )
	end


	it "pluralizes 'ferry as 'ferries'" do
		expect( 'ferry'.en.plural ).to eq( 'ferries' )
	end


	it "pluralizes 'fetus' as 'fetuses'" do
		expect( 'fetus'.en.plural ).to eq( 'fetuses' )
	end


	it "pluralizes 'fiance' as 'fiances'" do
		expect( 'fiance'.en.plural ).to eq( 'fiances' )
	end


	it "pluralizes 'fiancee' as 'fiancees'" do
		expect( 'fiancee'.en.plural ).to eq( 'fiancees' )
	end


	it "pluralizes 'fiasco' as 'fiascos'" do
		expect( 'fiasco'.en.plural ).to eq( 'fiascos' )
	end


	it "pluralizes 'fish' as 'fish'" do
		expect( 'fish'.en.plural ).to eq( 'fish' )
	end


	it "pluralizes 'fizz' as 'fizzes'" do
		expect( 'fizz'.en.plural ).to eq( 'fizzes' )
	end


	it "pluralizes 'flamingo' as 'flamingoes'" do
		expect( 'flamingo'.en.plural ).to eq( 'flamingoes' )
	end


	it "pluralizes 'flora' as 'floras'" do
		expect( 'flora'.en.plural ).to eq( 'floras' )
	end

	it "pluralizes 'flora' as 'florae' in classical mode" do
		Linguistics::EN.in_classical_mode do
			expect( 'flora'.en.plural ).to eq( 'florae' )
		end
	end


	it "pluralizes 'flounder' as 'flounder'" do
		expect( 'flounder'.en.plural ).to eq( 'flounder' )
	end


	it "pluralizes 'focus' as 'focuses'" do
		expect( 'focus'.en.plural ).to eq( 'focuses' )
	end

	it "pluralizes 'focus' as 'foci' in classical mode" do
		Linguistics::EN.in_classical_mode do
			expect( 'focus'.en.plural ).to eq( 'foci' )
		end
	end


	it "pluralizes 'foetus' as 'foetuses'" do
		expect( 'foetus'.en.plural ).to eq( 'foetuses' )
	end


	it "pluralizes 'folio' as 'folios'" do
		expect( 'folio'.en.plural ).to eq( 'folios' )
	end


	it "pluralizes 'Foochowese' as 'Foochowese'" do
		expect( 'Foochowese'.en.plural ).to eq( 'Foochowese' )
	end


	it "pluralizes 'foot' as 'feet'" do
		expect( 'foot'.en.plural ).to eq( 'feet' )
	end


	# POSSESSIVE FORM
	it "pluralizes 'foot's' as 'feet's'" do
		expect( "foot's".en.plural ).to eq( "feet's" )
	end


	it "pluralizes 'foramen' as 'foramens'" do
		expect( 'foramen'.en.plural ).to eq( 'foramens' )
	end

	it "pluralizes 'foramen' as 'foramina' in classical mode" do
		Linguistics::EN.in_classical_mode do
			expect( 'foramen'.en.plural ).to eq( 'foramina' )
		end
	end


	it "pluralizes 'formula' as 'formulas'" do
		expect( 'formula'.en.plural ).to eq( 'formulas' )
	end

	it "pluralizes 'formula' as 'formulae' in classical mode" do
		Linguistics::EN.in_classical_mode do
			expect( 'formula'.en.plural ).to eq( 'formulae' )
		end
	end


	it "pluralizes 'forum' as 'forums'" do
		expect( 'forum'.en.plural ).to eq( 'forums' )
	end


	it "pluralizes 'fought' as 'fought'" do
		expect( 'fought'.en.plural ).to eq( 'fought' )
	end


	it "pluralizes 'fox' as 'foxes'" do
		expect( 'fox'.en.plural ).to eq( 'foxes' )
	end


	it "pluralizes 'from him' as 'from them'" do
		expect( 'from him'.en.plural ).to eq( 'from them' )
	end


	# ACCUSATIVE
	it "pluralizes 'from it' as 'from them'" do
		expect( 'from it'.en.plural ).to eq( 'from them' )
	end


	it "pluralizes 'fungus' as 'funguses'" do
		expect( 'fungus'.en.plural ).to eq( 'funguses' )
	end

	it "pluralizes 'fungus' as 'fungi' in classical mode" do
		Linguistics::EN.in_classical_mode do
			expect( 'fungus'.en.plural ).to eq( 'fungi' )
		end
	end


	it "pluralizes 'Gabunese' as 'Gabunese'" do
		expect( 'Gabunese'.en.plural ).to eq( 'Gabunese' )
	end


	it "pluralizes 'gallows' as 'gallows'" do
		expect( 'gallows'.en.plural ).to eq( 'gallows' )
	end


	it "pluralizes 'ganglion' as 'ganglions'" do
		expect( 'ganglion'.en.plural ).to eq( 'ganglions' )
	end

	it "pluralizes 'ganglion' as 'ganglia' in classical mode" do
		Linguistics::EN.in_classical_mode do
			expect( 'ganglion'.en.plural ).to eq( 'ganglia' )
		end
	end


	it "pluralizes 'gas' as 'gases'" do
		expect( 'gas'.en.plural ).to eq( 'gases' )
	end


	it "pluralizes 'gateau' as 'gateaus'" do
		expect( 'gateau'.en.plural ).to eq( 'gateaus' )
	end

	it "pluralizes 'gateau' as 'gateaux' in classical mode" do
		Linguistics::EN.in_classical_mode do
			expect( 'gateau'.en.plural ).to eq( 'gateaux' )
		end
	end


	it "pluralizes 'gave' as 'gave'" do
		expect( 'gave'.en.plural ).to eq( 'gave' )
	end


	it "pluralizes 'generalissimo' as 'generalissimos'" do
		expect( 'generalissimo'.en.plural ).to eq( 'generalissimos' )
	end


	it "pluralizes 'Genevese' as 'Genevese'" do
		expect( 'Genevese'.en.plural ).to eq( 'Genevese' )
	end


	it "pluralizes 'genie' as 'genies'" do
		expect( 'genie'.en.plural ).to eq( 'genies' )
	end

	it "pluralizes 'genie' as 'genii' in classical mode" do
		Linguistics::EN.in_classical_mode do
			expect( 'genie'.en.plural ).to eq( 'genii' )
		end
	end


	it "pluralizes 'genius' as 'geniuses'" do
		expect( 'genius'.en.plural ).to eq( 'geniuses' )
	end

	it "pluralizes 'genius' as 'genii' in classical mode" do
		Linguistics::EN.in_classical_mode do
			expect( 'genius'.en.plural ).to eq( 'genii' )
		end
	end


	it "pluralizes 'Genoese' as 'Genoese'" do
		expect( 'Genoese'.en.plural ).to eq( 'Genoese' )
	end


	it "pluralizes 'genus' as 'genera'" do
		expect( 'genus'.en.plural ).to eq( 'genera' )
	end


	it "pluralizes 'German' as 'Germans'" do
		expect( 'German'.en.plural ).to eq( 'Germans' )
	end


	it "pluralizes 'ghetto' as 'ghettos'" do
		expect( 'ghetto'.en.plural ).to eq( 'ghettos' )
	end


	it "pluralizes 'Gilbertese' as 'Gilbertese'" do
		expect( 'Gilbertese'.en.plural ).to eq( 'Gilbertese' )
	end


	it "pluralizes 'glottis' as 'glottises'" do
		expect( 'glottis'.en.plural ).to eq( 'glottises' )
	end


	it "pluralizes 'Goanese' as 'Goanese'" do
		expect( 'Goanese'.en.plural ).to eq( 'Goanese' )
	end


	it "pluralizes 'goose' as 'geese'" do
		expect( 'goose'.en.plural ).to eq( 'geese' )
	end


	it "pluralizes 'Governor General' as 'Governors General'" do
		expect( 'Governor General'.en.plural ).to eq( 'Governors General' )
	end


	it "pluralizes 'goy' as 'goys'" do
		expect( 'goy'.en.plural ).to eq( 'goys' )
	end

	it "pluralizes 'goy' as 'goyim' in classical mode" do
		Linguistics::EN.in_classical_mode do
			expect( 'goy'.en.plural ).to eq( 'goyim' )
		end
	end


	it "pluralizes 'graffiti' as 'graffiti'" do
		expect( 'graffiti'.en.plural ).to eq( 'graffiti' )
	end


	it "pluralizes 'graffito' as 'graffiti'" do
		expect( 'graffito'.en.plural ).to eq( 'graffiti' )
	end


	it "pluralizes 'guano' as 'guanos'" do
		expect( 'guano'.en.plural ).to eq( 'guanos' )
	end


	it "pluralizes 'guardsman' as 'guardsmen'" do
		expect( 'guardsman'.en.plural ).to eq( 'guardsmen' )
	end


	it "pluralizes 'Guianese' as 'Guianese'" do
		expect( 'Guianese'.en.plural ).to eq( 'Guianese' )
	end


	it "pluralizes 'gumma' as 'gummas'" do
		expect( 'gumma'.en.plural ).to eq( 'gummas' )
	end

	it "pluralizes 'gumma' as 'gummata' in classical mode" do
		Linguistics::EN.in_classical_mode do
			expect( 'gumma'.en.plural ).to eq( 'gummata' )
		end
	end


	it "pluralizes 'gymnasium' as 'gymnasiums'" do
		expect( 'gymnasium'.en.plural ).to eq( 'gymnasiums' )
	end

	it "pluralizes 'gymnasium' as 'gymnasia' in classical mode" do
		Linguistics::EN.in_classical_mode do
			expect( 'gymnasium'.en.plural ).to eq( 'gymnasia' )
		end
	end


	it "pluralizes 'had' as 'had'" do
		expect( 'had'.en.plural ).to eq( 'had' )
	end


	it "pluralizes 'had thought' as 'had thought'" do
		expect( 'had thought'.en.plural ).to eq( 'had thought' )
	end


	it "pluralizes 'Hainanese' as 'Hainanese'" do
		expect( 'Hainanese'.en.plural ).to eq( 'Hainanese' )
	end


	it "pluralizes 'handkerchief' as 'handkerchiefs'" do
		expect( 'handkerchief'.en.plural ).to eq( 'handkerchiefs' )
	end


	it "pluralizes 'Hararese' as 'Hararese'" do
		expect( 'Hararese'.en.plural ).to eq( 'Hararese' )
	end


	it "pluralizes 'Harlemese' as 'Harlemese'" do
		expect( 'Harlemese'.en.plural ).to eq( 'Harlemese' )
	end


	it "pluralizes 'harmonium' as 'harmoniums'" do
		expect( 'harmonium'.en.plural ).to eq( 'harmoniums' )
	end


	it "pluralizes 'has' as 'have'" do
		expect( 'has'.en.plural ).to eq( 'have' )
	end


	it "pluralizes 'has become' as 'have become'" do
		expect( 'has become'.en.plural ).to eq( 'have become' )
	end


	it "pluralizes 'has been' as 'have been'" do
		expect( 'has been'.en.plural ).to eq( 'have been' )
	end


	it "pluralizes 'has-been' as 'has-beens'" do
		expect( 'has-been'.en.plural ).to eq( 'has-beens' )
	end


	it "pluralizes 'Havanese' as 'Havanese'" do
		expect( 'Havanese'.en.plural ).to eq( 'Havanese' )
	end


	it "pluralizes 'have' as 'have'" do
		expect( 'have'.en.plural ).to eq( 'have' )
	end


	it "pluralizes 'have conceded' as 'have conceded'" do
		expect( 'have conceded'.en.plural ).to eq( 'have conceded' )
	end


	it "pluralizes 'he' as 'they'" do
		expect( 'he'.en.plural ).to eq( 'they' )
	end


	it "pluralizes 'headquarters' as 'headquarters'" do
		expect( 'headquarters'.en.plural ).to eq( 'headquarters' )
	end


	it "pluralizes 'Heavenese' as 'Heavenese'" do
		expect( 'Heavenese'.en.plural ).to eq( 'Heavenese' )
	end


	it "pluralizes 'helix' as 'helices'" do
		expect( 'helix'.en.plural ).to eq( 'helices' )
	end


	it "pluralizes 'hepatitis' as 'hepatitises'" do
		expect( 'hepatitis'.en.plural ).to eq( 'hepatitises' )
	end


	# PRONOUN
	it "pluralizes 'her' (as a pronoun) as 'them'" do
		expect( 'her'.en.plural_noun ).to eq( 'them' )
	end


	# POSSESSIVE ADJ
	it "pluralizes 'her' as 'their'" do
		expect( 'her'.en.plural ).to eq( 'their' )
	end


	it "pluralizes 'hero' as 'heroes'" do
		expect( 'hero'.en.plural ).to eq( 'heroes' )
	end


	it "pluralizes 'herpes' as 'herpes'" do
		expect( 'herpes'.en.plural ).to eq( 'herpes' )
	end


	# POSSESSIVE NOUN
	it "pluralizes 'hers' (as a noun) as 'theirs'" do
		expect( 'hers'.en.plural_noun ).to eq( 'theirs' )
	end


	it "pluralizes 'herself' as 'themselves'" do
		expect( 'herself'.en.plural ).to eq( 'themselves' )
	end


	it "pluralizes 'hiatus' as 'hiatuses'" do
		expect( 'hiatus'.en.plural ).to eq( 'hiatuses' )
	end

	it "pluralizes 'hiatus' as 'hiatus' in classical mode" do
		Linguistics::EN.in_classical_mode do
			expect( 'hiatus'.en.plural ).to eq( 'hiatus' )
		end
	end


	it "pluralizes 'highlight' as 'highlights'" do
		expect( 'highlight'.en.plural ).to eq( 'highlights' )
	end


	it "pluralizes 'hijinks' as 'hijinks'" do
		expect( 'hijinks'.en.plural ).to eq( 'hijinks' )
	end


	it "pluralizes 'him' as 'them'" do
		expect( 'him'.en.plural ).to eq( 'them' )
	end


	it "pluralizes 'himself' as 'themselves'" do
		expect( 'himself'.en.plural ).to eq( 'themselves' )
	end


	it "pluralizes 'hippopotamus' as 'hippopotamuses'" do
		expect( 'hippopotamus'.en.plural ).to eq( 'hippopotamuses' )
	end

	it "pluralizes 'hippopotamus' as 'hippopotami' in classical mode" do
		Linguistics::EN.in_classical_mode do
			expect( 'hippopotamus'.en.plural ).to eq( 'hippopotami' )
		end
	end


	it "pluralizes 'Hiroshiman' as 'Hiroshimans'" do
		expect( 'Hiroshiman'.en.plural ).to eq( 'Hiroshimans' )
	end


	# POSSESSIVE ADJ
	it "pluralizes 'his' as 'their'" do
		expect( 'his'.en.plural ).to eq( 'their' )
	end


	# POSSESSIVE NOUN
	it "pluralizes 'his' (as a noun) as 'theirs'" do
		expect( 'his'.en.plural_noun ).to eq( 'theirs' )
	end


	it "pluralizes 'honorarium' as 'honorariums'" do
		expect( 'honorarium'.en.plural ).to eq( 'honorariums' )
	end

	it "pluralizes 'honorarium' as 'honoraria' in classical mode" do
		Linguistics::EN.in_classical_mode do
			expect( 'honorarium'.en.plural ).to eq( 'honoraria' )
		end
	end


	it "pluralizes 'hoof' as 'hoofs'" do
		expect( 'hoof'.en.plural ).to eq( 'hoofs' )
	end

	it "pluralizes 'hoof' as 'hooves' in classical mode" do
		Linguistics::EN.in_classical_mode do
			expect( 'hoof'.en.plural ).to eq( 'hooves' )
		end
	end


	it "pluralizes 'Hoosierese' as 'Hoosierese'" do
		expect( 'Hoosierese'.en.plural ).to eq( 'Hoosierese' )
	end


	it "pluralizes 'Hottentotese' as 'Hottentotese'" do
		expect( 'Hottentotese'.en.plural ).to eq( 'Hottentotese' )
	end


	it "pluralizes 'house' as 'houses'" do
		expect( 'house'.en.plural ).to eq( 'houses' )
	end


	it "pluralizes 'housewife' as 'housewives'" do
		expect( 'housewife'.en.plural ).to eq( 'housewives' )
	end


	it "pluralizes 'hubris' as 'hubrises'" do
		expect( 'hubris'.en.plural ).to eq( 'hubrises' )
	end


	it "pluralizes 'human' as 'humans'" do
		expect( 'human'.en.plural ).to eq( 'humans' )
	end


	it "pluralizes 'Hunanese' as 'Hunanese'" do
		expect( 'Hunanese'.en.plural ).to eq( 'Hunanese' )
	end


	it "pluralizes 'hydra' as 'hydras'" do
		expect( 'hydra'.en.plural ).to eq( 'hydras' )
	end

	it "pluralizes 'hydra' as 'hydrae' in classical mode" do
		Linguistics::EN.in_classical_mode do
			expect( 'hydra'.en.plural ).to eq( 'hydrae' )
		end
	end


	it "pluralizes 'hyperbaton' as 'hyperbata'" do
		expect( 'hyperbaton'.en.plural ).to eq( 'hyperbata' )
	end


	it "pluralizes 'hyperbola' as 'hyperbolas'" do
		expect( 'hyperbola'.en.plural ).to eq( 'hyperbolas' )
	end

	it "pluralizes 'hyperbola' as 'hyperbolae' in classical mode" do
		Linguistics::EN.in_classical_mode do
			expect( 'hyperbola'.en.plural ).to eq( 'hyperbolae' )
		end
	end


	it "pluralizes 'I' as 'we'" do
		expect( 'I'.en.plural ).to eq( 'we' )
	end


	it "pluralizes 'ibis' as 'ibises'" do
		expect( 'ibis'.en.plural ).to eq( 'ibises' )
	end


	it "pluralizes 'ignoramus' as 'ignoramuses'" do
		expect( 'ignoramus'.en.plural ).to eq( 'ignoramuses' )
	end


	it "pluralizes 'impetus' as 'impetuses'" do
		expect( 'impetus'.en.plural ).to eq( 'impetuses' )
	end

	it "pluralizes 'impetus' as 'impetus' in classical mode" do
		Linguistics::EN.in_classical_mode do
			expect( 'impetus'.en.plural ).to eq( 'impetus' )
		end
	end


	it "pluralizes 'incubus' as 'incubuses'" do
		expect( 'incubus'.en.plural ).to eq( 'incubuses' )
	end

	it "pluralizes 'incubus' as 'incubi' in classical mode" do
		Linguistics::EN.in_classical_mode do
			expect( 'incubus'.en.plural ).to eq( 'incubi' )
		end
	end


	it "pluralizes 'index' as 'indexes'" do
		expect( 'index'.en.plural ).to eq( 'indexes' )
	end

	it "pluralizes 'index' as 'indices' in classical mode" do
		Linguistics::EN.in_classical_mode do
			expect( 'index'.en.plural ).to eq( 'indices' )
		end
	end


	it "pluralizes 'Indochinese' as 'Indochinese'" do
		expect( 'Indochinese'.en.plural ).to eq( 'Indochinese' )
	end


	it "pluralizes 'inferno' as 'infernos'" do
		expect( 'inferno'.en.plural ).to eq( 'infernos' )
	end


	it "pluralizes 'innings' as 'innings'" do
		expect( 'innings'.en.plural ).to eq( 'innings' )
	end


	it "pluralizes 'Inspector General' as 'Inspectors General'" do
		expect( 'Inspector General'.en.plural ).to eq( 'Inspectors General' )
	end


	it "pluralizes 'interregnum' as 'interregnums'" do
		expect( 'interregnum'.en.plural ).to eq( 'interregnums' )
	end

	it "pluralizes 'interregnum' as 'interregna' in classical mode" do
		Linguistics::EN.in_classical_mode do
			expect( 'interregnum'.en.plural ).to eq( 'interregna' )
		end
	end


	it "pluralizes 'iris' as 'irises'" do
		expect( 'iris'.en.plural ).to eq( 'irises' )
	end

	it "pluralizes 'iris' as 'irides' in classical mode" do
		Linguistics::EN.in_classical_mode do
			expect( 'iris'.en.plural ).to eq( 'irides' )
		end
	end


	it "pluralizes 'is' as 'are'" do
		expect( 'is'.en.plural ).to eq( 'are' )
	end


	it "pluralizes 'is eaten' as 'are eaten'" do
		expect( 'is eaten'.en.plural ).to eq( 'are eaten' )
	end


	# NOMINATIVE
	it "pluralizes 'it' as 'they'" do
		expect( 'it'.en.plural ).to eq( 'they' )
	end


	# POSSESSIVE FORM
	it "pluralizes 'its' as 'their'" do
		expect( 'its'.en.plural ).to eq( 'their' )
	end


	it "pluralizes 'itself' as 'themselves'" do
		expect( 'itself'.en.plural ).to eq( 'themselves' )
	end


	it "pluralizes 'jackanapes' as 'jackanapes'" do
		expect( 'jackanapes'.en.plural ).to eq( 'jackanapes' )
	end


	it "pluralizes 'Japanese' as 'Japanese'" do
		expect( 'Japanese'.en.plural ).to eq( 'Japanese' )
	end


	it "pluralizes 'Javanese' as 'Javanese'" do
		expect( 'Javanese'.en.plural ).to eq( 'Javanese' )
	end


	it "pluralizes 'Jerry' as 'Jerrys'" do
		expect( 'Jerry'.en.plural ).to eq( 'Jerrys' )
	end


	it "pluralizes 'jerry' as 'jerries'" do
		expect( 'jerry'.en.plural ).to eq( 'jerries' )
	end


	it "pluralizes 'jinx' as 'jinxes'" do
		expect( 'jinx'.en.plural ).to eq( 'jinxes' )
	end


	# VERB FORM
	it "pluralizes 'jinxes' as 'jinx'" do
		expect( 'jinxes'.en.plural ).to eq( 'jinx' )
	end


	it "pluralizes 'Johnsonese' as 'Johnsonese'" do
		expect( 'Johnsonese'.en.plural ).to eq( 'Johnsonese' )
	end


	it "pluralizes 'Jones' as 'Joneses'" do
		expect( 'Jones'.en.plural ).to eq( 'Joneses' )
	end


	it "pluralizes 'jumbo' as 'jumbos'" do
		expect( 'jumbo'.en.plural ).to eq( 'jumbos' )
	end


	it "pluralizes 'Kanarese' as 'Kanarese'" do
		expect( 'Kanarese'.en.plural ).to eq( 'Kanarese' )
	end


	it "pluralizes 'Kiplingese' as 'Kiplingese'" do
		expect( 'Kiplingese'.en.plural ).to eq( 'Kiplingese' )
	end


	# NOUN FORM
	it "pluralizes 'knife' as 'knives'" do
		expect( 'knife'.en.plural ).to eq( 'knives' )
	end


	# VERB FORM (1st/2nd pers.)
	it "pluralizes 'knife' (as a verb) as 'knife'" do
		expect( 'knife'.en.plural_verb ).to eq( 'knife' )
	end


	# VERB FORM (3rd pers.)
	it "pluralizes 'knifes' as 'knife'" do
		expect( 'knifes'.en.plural ).to eq( 'knife' )
	end


	it "pluralizes 'Kongoese' as 'Kongoese'" do
		expect( 'Kongoese'.en.plural ).to eq( 'Kongoese' )
	end


	it "pluralizes 'Kongolese' as 'Kongolese'" do
		expect( 'Kongolese'.en.plural ).to eq( 'Kongolese' )
	end


	it "pluralizes 'lacuna' as 'lacunas'" do
		expect( 'lacuna'.en.plural ).to eq( 'lacunas' )
	end

	it "pluralizes 'lacuna' as 'lacunae' in classical mode" do
		Linguistics::EN.in_classical_mode do
			expect( 'lacuna'.en.plural ).to eq( 'lacunae' )
		end
	end


	it "pluralizes 'lady in waiting' as 'ladies in waiting'" do
		expect( 'lady in waiting'.en.plural ).to eq( 'ladies in waiting' )
	end


	it "pluralizes 'Lapponese' as 'Lapponese'" do
		expect( 'Lapponese'.en.plural ).to eq( 'Lapponese' )
	end


	it "pluralizes 'larynx' as 'larynxes'" do
		expect( 'larynx'.en.plural ).to eq( 'larynxes' )
	end

	it "pluralizes 'larynx' as 'larynges' in classical mode" do
		Linguistics::EN.in_classical_mode do
			expect( 'larynx'.en.plural ).to eq( 'larynges' )
		end
	end


	it "pluralizes 'latex' as 'latexes'" do
		expect( 'latex'.en.plural ).to eq( 'latexes' )
	end

	it "pluralizes 'latex' as 'latices' in classical mode" do
		Linguistics::EN.in_classical_mode do
			expect( 'latex'.en.plural ).to eq( 'latices' )
		end
	end


	# VERB FORM (1st/2nd pers.)
	it "pluralizes 'leaf' (as a verb) as 'leaf'" do
		expect( 'leaf'.en.plural_verb ).to eq( 'leaf' )
	end


	# NOUN FORM
	it "pluralizes 'leaf' as 'leaves'" do
		expect( 'leaf'.en.plural ).to eq( 'leaves' )
	end


	# VERB FORM (3rd pers.)
	it "pluralizes 'leafs' as 'leaf'" do
		expect( 'leafs'.en.plural ).to eq( 'leaf' )
	end


	it "pluralizes 'Lebanese' as 'Lebanese'" do
		expect( 'Lebanese'.en.plural ).to eq( 'Lebanese' )
	end


	it "pluralizes 'lemma' as 'lemmas'" do
		expect( 'lemma'.en.plural ).to eq( 'lemmas' )
	end

	it "pluralizes 'lemma' as 'lemmata' in classical mode" do
		Linguistics::EN.in_classical_mode do
			expect( 'lemma'.en.plural ).to eq( 'lemmata' )
		end
	end


	it "pluralizes 'lens' as 'lenses'" do
		expect( 'lens'.en.plural ).to eq( 'lenses' )
	end


	it "pluralizes 'Leonese' as 'Leonese'" do
		expect( 'Leonese'.en.plural ).to eq( 'Leonese' )
	end


	it "pluralizes 'lick of the cat' as 'licks of the cat'" do
		expect( 'lick of the cat'.en.plural ).to eq( 'licks of the cat' )
	end


	it "pluralizes 'Lieutenant General' as 'Lieutenant Generals'" do
		expect( 'Lieutenant General'.en.plural ).to eq( 'Lieutenant Generals' )
	end


	it "pluralizes 'life' as 'lives'" do
		expect( 'life'.en.plural ).to eq( 'lives' )
	end


	it "pluralizes 'Liman' as 'Limans'" do
		expect( 'Liman'.en.plural ).to eq( 'Limans' )
	end


	it "pluralizes 'lingo' as 'lingos'" do
		expect( 'lingo'.en.plural ).to eq( 'lingos' )
	end


	it "pluralizes 'loaf' as 'loaves'" do
		expect( 'loaf'.en.plural ).to eq( 'loaves' )
	end


	it "pluralizes 'locus' as 'loci'" do
		expect( 'locus'.en.plural ).to eq( 'loci' )
	end


	it "pluralizes 'Londonese' as 'Londonese'" do
		expect( 'Londonese'.en.plural ).to eq( 'Londonese' )
	end


	it "pluralizes 'Lorrainese' as 'Lorrainese'" do
		expect( 'Lorrainese'.en.plural ).to eq( 'Lorrainese' )
	end


	it "pluralizes 'lothario' as 'lotharios'" do
		expect( 'lothario'.en.plural ).to eq( 'lotharios' )
	end


	it "pluralizes 'louse' as 'lice'" do
		expect( 'louse'.en.plural ).to eq( 'lice' )
	end


	it "pluralizes 'Lucchese' as 'Lucchese'" do
		expect( 'Lucchese'.en.plural ).to eq( 'Lucchese' )
	end


	it "pluralizes 'lumbago' as 'lumbagos'" do
		expect( 'lumbago'.en.plural ).to eq( 'lumbagos' )
	end


	it "pluralizes 'lumen' as 'lumens'" do
		expect( 'lumen'.en.plural ).to eq( 'lumens' )
	end

	it "pluralizes 'lumen' as 'lumina' in classical mode" do
		Linguistics::EN.in_classical_mode do
			expect( 'lumen'.en.plural ).to eq( 'lumina' )
		end
	end


	it "pluralizes 'lustrum' as 'lustrums'" do
		expect( 'lustrum'.en.plural ).to eq( 'lustrums' )
	end

	it "pluralizes 'lustrum' as 'lustra' in classical mode" do
		Linguistics::EN.in_classical_mode do
			expect( 'lustrum'.en.plural ).to eq( 'lustra' )
		end
	end


	it "pluralizes 'lyceum' as 'lyceums'" do
		expect( 'lyceum'.en.plural ).to eq( 'lyceums' )
	end


	it "pluralizes 'lymphoma' as 'lymphomas'" do
		expect( 'lymphoma'.en.plural ).to eq( 'lymphomas' )
	end

	it "pluralizes 'lymphoma' as 'lymphomata' in classical mode" do
		Linguistics::EN.in_classical_mode do
			expect( 'lymphoma'.en.plural ).to eq( 'lymphomata' )
		end
	end


	it "pluralizes 'lynx' as 'lynxes'" do
		expect( 'lynx'.en.plural ).to eq( 'lynxes' )
	end


	it "pluralizes 'Lyonese' as 'Lyonese'" do
		expect( 'Lyonese'.en.plural ).to eq( 'Lyonese' )
	end


	it "pluralizes 'M.I.A.' as 'M.I.A.s'" do
		expect( 'M.I.A.'.en.plural ).to eq( 'M.I.A.s' )
	end


	it "pluralizes 'Macanese' as 'Macanese'" do
		expect( 'Macanese'.en.plural ).to eq( 'Macanese' )
	end


	it "pluralizes 'Macassarese' as 'Macassarese'" do
		expect( 'Macassarese'.en.plural ).to eq( 'Macassarese' )
	end


	it "pluralizes 'mackerel' as 'mackerel'" do
		expect( 'mackerel'.en.plural ).to eq( 'mackerel' )
	end


	it "pluralizes 'made' as 'made'" do
		expect( 'made'.en.plural ).to eq( 'made' )
	end


	it "pluralizes 'Madurese' as 'Madurese'" do
		expect( 'Madurese'.en.plural ).to eq( 'Madurese' )
	end


	it "pluralizes 'magma' as 'magmas'" do
		expect( 'magma'.en.plural ).to eq( 'magmas' )
	end

	it "pluralizes 'magma' as 'magmata' in classical mode" do
		Linguistics::EN.in_classical_mode do
			expect( 'magma'.en.plural ).to eq( 'magmata' )
		end
	end


	it "pluralizes 'magneto' as 'magnetos'" do
		expect( 'magneto'.en.plural ).to eq( 'magnetos' )
	end


	it "pluralizes 'Major General' as 'Major Generals'" do
		expect( 'Major General'.en.plural ).to eq( 'Major Generals' )
	end


	it "pluralizes 'Malabarese' as 'Malabarese'" do
		expect( 'Malabarese'.en.plural ).to eq( 'Malabarese' )
	end


	it "pluralizes 'Maltese' as 'Maltese'" do
		expect( 'Maltese'.en.plural ).to eq( 'Maltese' )
	end


	it "pluralizes 'man' as 'men'" do
		expect( 'man'.en.plural ).to eq( 'men' )
	end


	it "pluralizes 'mandamus' as 'mandamuses'" do
		expect( 'mandamus'.en.plural ).to eq( 'mandamuses' )
	end


	it "pluralizes 'manifesto' as 'manifestos'" do
		expect( 'manifesto'.en.plural ).to eq( 'manifestos' )
	end


	it "pluralizes 'mantis' as 'mantises'" do
		expect( 'mantis'.en.plural ).to eq( 'mantises' )
	end


	it "pluralizes 'marquis' as 'marquises'" do
		expect( 'marquis'.en.plural ).to eq( 'marquises' )
	end


	it "pluralizes 'Mary' as 'Marys'" do
		expect( 'Mary'.en.plural ).to eq( 'Marys' )
	end


	it "pluralizes 'maximum' as 'maximums'" do
		expect( 'maximum'.en.plural ).to eq( 'maximums' )
	end

	it "pluralizes 'maximum' as 'maxima' in classical mode" do
		Linguistics::EN.in_classical_mode do
			expect( 'maximum'.en.plural ).to eq( 'maxima' )
		end
	end


	it "pluralizes 'measles' as 'measles'" do
		expect( 'measles'.en.plural ).to eq( 'measles' )
	end


	it "pluralizes 'medico' as 'medicos'" do
		expect( 'medico'.en.plural ).to eq( 'medicos' )
	end


	it "pluralizes 'medium' as 'mediums'" do
		expect( 'medium'.en.plural ).to eq( 'mediums' )
	end

	it "pluralizes 'medium' as 'media' in classical mode" do
		Linguistics::EN.in_classical_mode do
			expect( 'medium'.en.plural ).to eq( 'media' )
		end
	end


	it "pluralizes 'medium's' as 'mediums''" do
		expect( "medium's".en.plural ).to eq( "mediums'" ) # media's
	end


	it "pluralizes 'medusa' as 'medusas'" do
		expect( 'medusa'.en.plural ).to eq( 'medusas' )
	end

	it "pluralizes 'medusa' as 'medusae' in classical mode" do
		Linguistics::EN.in_classical_mode do
			expect( 'medusa'.en.plural ).to eq( 'medusae' )
		end
	end


	it "pluralizes 'memorandum' as 'memorandums'" do
		expect( 'memorandum'.en.plural ).to eq( 'memorandums' )
	end

	it "pluralizes 'memorandum' as 'memoranda' in classical mode" do
		Linguistics::EN.in_classical_mode do
			expect( 'memorandum'.en.plural ).to eq( 'memoranda' )
		end
	end


	it "pluralizes 'meniscus' as 'menisci'" do
		expect( 'meniscus'.en.plural ).to eq( 'menisci' )
	end


	it "pluralizes 'Messinese' as 'Messinese'" do
		expect( 'Messinese'.en.plural ).to eq( 'Messinese' )
	end


	it "pluralizes 'metamorphosis' as 'metamorphoses'" do
		expect( 'metamorphosis'.en.plural ).to eq( 'metamorphoses' )
	end


	it "pluralizes 'metropolis' as 'metropolises'" do
		expect( 'metropolis'.en.plural ).to eq( 'metropolises' )
	end


	it "pluralizes 'mews' as 'mews'" do
		expect( 'mews'.en.plural ).to eq( 'mews' )
	end


	it "pluralizes 'miasma' as 'miasmas'" do
		expect( 'miasma'.en.plural ).to eq( 'miasmas' )
	end

	it "pluralizes 'miasma' as 'miasmata' in classical mode" do
		Linguistics::EN.in_classical_mode do
			expect( 'miasma'.en.plural ).to eq( 'miasmata' )
		end
	end


	it "pluralizes 'Milanese' as 'Milanese'" do
		expect( 'Milanese'.en.plural ).to eq( 'Milanese' )
	end


	it "pluralizes 'milieu' as 'milieus'" do
		expect( 'milieu'.en.plural ).to eq( 'milieus' )
	end

	it "pluralizes 'milieu' as 'milieux' in classical mode" do
		Linguistics::EN.in_classical_mode do
			expect( 'milieu'.en.plural ).to eq( 'milieux' )
		end
	end


	it "pluralizes 'millenium' as 'milleniums'" do
		expect( 'millenium'.en.plural ).to eq( 'milleniums' )
	end

	it "pluralizes 'millenium' as 'millenia' in classical mode" do
		Linguistics::EN.in_classical_mode do
			expect( 'millenium'.en.plural ).to eq( 'millenia' )
		end
	end


	it "pluralizes 'minimum' as 'minimums'" do
		expect( 'minimum'.en.plural ).to eq( 'minimums' )
	end

	it "pluralizes 'minimum' as 'minima' in classical mode" do
		Linguistics::EN.in_classical_mode do
			expect( 'minimum'.en.plural ).to eq( 'minima' )
		end
	end


	it "pluralizes 'minx' as 'minxes'" do
		expect( 'minx'.en.plural ).to eq( 'minxes' )
	end


	# VERB FORM (1st/2nd pers.)
	it "pluralizes 'miss' (as a verb) as 'miss'" do
		expect( 'miss'.en.plural_verb ).to eq( 'miss' )
	end


	# NOUN FORM
	it "pluralizes 'miss' as 'misses'" do
		expect( 'miss'.en.plural ).to eq( 'misses' )
	end


	# VERB FORM (3rd pers.)
	it "pluralizes 'misses' as 'miss'" do
		expect( 'misses'.en.plural ).to eq( 'miss' )
	end


	it "pluralizes 'mittamus' as 'mittamuses'" do
		expect( 'mittamus'.en.plural ).to eq( 'mittamuses' )
	end


	it "pluralizes 'Modenese' as 'Modenese'" do
		expect( 'Modenese'.en.plural ).to eq( 'Modenese' )
	end


	it "pluralizes 'momentum' as 'momentums'" do
		expect( 'momentum'.en.plural ).to eq( 'momentums' )
	end

	it "pluralizes 'momentum' as 'momenta' in classical mode" do
		Linguistics::EN.in_classical_mode do
			expect( 'momentum'.en.plural ).to eq( 'momenta' )
		end
	end


	it "pluralizes 'money' as 'monies'" do
		expect( 'money'.en.plural ).to eq( 'monies' )
	end


	it "pluralizes 'mongoose' as 'mongooses'" do
		expect( 'mongoose'.en.plural ).to eq( 'mongooses' )
	end


	it "pluralizes 'moose' as 'mooses'" do
		expect( 'moose'.en.plural ).to eq( 'mooses' )
	end

	it "pluralizes 'moose' as 'moose' in classical mode" do
		Linguistics::EN.in_classical_mode do
			expect( 'moose'.en.plural ).to eq( 'moose' )
		end
	end


	it "pluralizes 'mother-in-law' as 'mothers-in-law'" do
		expect( 'mother-in-law'.en.plural ).to eq( 'mothers-in-law' )
	end


	it "pluralizes 'mouse' as 'mice'" do
		expect( 'mouse'.en.plural ).to eq( 'mice' )
	end


	it "pluralizes 'mumps' as 'mumps'" do
		expect( 'mumps'.en.plural ).to eq( 'mumps' )
	end


	it "pluralizes 'Muranese' as 'Muranese'" do
		expect( 'Muranese'.en.plural ).to eq( 'Muranese' )
	end


	it "pluralizes 'murex' as 'murices'" do
		expect( 'murex'.en.plural ).to eq( 'murices' )
	end


	it "pluralizes 'museum' as 'museums'" do
		expect( 'museum'.en.plural ).to eq( 'museums' )
	end


	it "pluralizes 'mustachio' as 'mustachios'" do
		expect( 'mustachio'.en.plural ).to eq( 'mustachios' )
	end


	# POSSESSIVE FORM
	it "pluralizes 'my' as 'our'" do
		expect( 'my'.en.plural ).to eq( 'our' )
	end


	it "pluralizes 'myself' as 'ourselves'" do
		expect( 'myself'.en.plural ).to eq( 'ourselves' )
	end


	it "pluralizes 'mythos' as 'mythoi'" do
		expect( 'mythos'.en.plural ).to eq( 'mythoi' )
	end


	it "pluralizes 'Nakayaman' as 'Nakayamans'" do
		expect( 'Nakayaman'.en.plural ).to eq( 'Nakayamans' )
	end


	it "pluralizes 'Nankingese' as 'Nankingese'" do
		expect( 'Nankingese'.en.plural ).to eq( 'Nankingese' )
	end


	it "pluralizes 'nasturtium' as 'nasturtiums'" do
		expect( 'nasturtium'.en.plural ).to eq( 'nasturtiums' )
	end


	it "pluralizes 'Navarrese' as 'Navarrese'" do
		expect( 'Navarrese'.en.plural ).to eq( 'Navarrese' )
	end


	it "pluralizes 'nebula' as 'nebulas'" do
		expect( 'nebula'.en.plural ).to eq( 'nebulas' )
	end

	it "pluralizes 'nebula' as 'nebulae' in classical mode" do
		Linguistics::EN.in_classical_mode do
			expect( 'nebula'.en.plural ).to eq( 'nebulae' )
		end
	end


	it "pluralizes 'Nepalese' as 'Nepalese'" do
		expect( 'Nepalese'.en.plural ).to eq( 'Nepalese' )
	end


	it "pluralizes 'neuritis' as 'neuritises'" do
		expect( 'neuritis'.en.plural ).to eq( 'neuritises' )
	end


	it "pluralizes 'neurosis' as 'neuroses'" do
		expect( 'neurosis'.en.plural ).to eq( 'neuroses' )
	end


	it "pluralizes 'news' as 'news'" do
		expect( 'news'.en.plural ).to eq( 'news' )
	end


	it "pluralizes 'nexus' as 'nexus'" do
		expect( 'nexus'.en.plural ).to eq( 'nexus' )
	end


	it "pluralizes 'Niasese' as 'Niasese'" do
		expect( 'Niasese'.en.plural ).to eq( 'Niasese' )
	end


	it "pluralizes 'Nicobarese' as 'Nicobarese'" do
		expect( 'Nicobarese'.en.plural ).to eq( 'Nicobarese' )
	end


	it "pluralizes 'nimbus' as 'nimbuses'" do
		expect( 'nimbus'.en.plural ).to eq( 'nimbuses' )
	end

	it "pluralizes 'nimbus' as 'nimbi' in classical mode" do
		Linguistics::EN.in_classical_mode do
			expect( 'nimbus'.en.plural ).to eq( 'nimbi' )
		end
	end


	it "pluralizes 'Nipponese' as 'Nipponese'" do
		expect( 'Nipponese'.en.plural ).to eq( 'Nipponese' )
	end


	it "pluralizes 'no' as 'noes'" do
		expect( 'no'.en.plural ).to eq( 'noes' )
	end


	it "pluralizes 'nostrum' as 'nostrums'" do
		expect( 'nostrum'.en.plural ).to eq( 'nostrums' )
	end


	it "pluralizes 'noumenon' as 'noumena'" do
		expect( 'noumenon'.en.plural ).to eq( 'noumena' )
	end


	it "pluralizes 'nova' as 'novas'" do
		expect( 'nova'.en.plural ).to eq( 'novas' )
	end

	it "pluralizes 'nova' as 'novae' in classical mode" do
		Linguistics::EN.in_classical_mode do
			expect( 'nova'.en.plural ).to eq( 'novae' )
		end
	end


	it "pluralizes 'nucleolus' as 'nucleoluses'" do
		expect( 'nucleolus'.en.plural ).to eq( 'nucleoluses' )
	end

	it "pluralizes 'nucleolus' as 'nucleoli' in classical mode" do
		Linguistics::EN.in_classical_mode do
			expect( 'nucleolus'.en.plural ).to eq( 'nucleoli' )
		end
	end


	it "pluralizes 'nucleus' as 'nuclei'" do
		expect( 'nucleus'.en.plural ).to eq( 'nuclei' )
	end


	it "pluralizes 'oaf' as 'oafs'" do
		expect( 'oaf'.en.plural ).to eq( 'oafs' )
	end


	it "pluralizes 'octavo' as 'octavos'" do
		expect( 'octavo'.en.plural ).to eq( 'octavos' )
	end


	it "pluralizes 'octopus' as 'octopuses'" do
		expect( 'octopus'.en.plural ).to eq( 'octopuses' )
	end

	it "pluralizes 'octopus' as 'octopodes' in classical mode" do
		Linguistics::EN.in_classical_mode do
			expect( 'octopus'.en.plural ).to eq( 'octopodes' )
		end
	end


	it "pluralizes 'oedema' as 'oedemas'" do
		expect( 'oedema'.en.plural ).to eq( 'oedemas' )
	end

	it "pluralizes 'oedema' as 'oedemata' in classical mode" do
		Linguistics::EN.in_classical_mode do
			expect( 'oedema'.en.plural ).to eq( 'oedemata' )
		end
	end


	it "pluralizes 'Oklahoman' as 'Oklahomans'" do
		expect( 'Oklahoman'.en.plural ).to eq( 'Oklahomans' )
	end


	it "pluralizes 'omnibus' as 'omnibuses'" do
		expect( 'omnibus'.en.plural ).to eq( 'omnibuses' )
	end


	# ACCUSATIVE
	it "pluralizes 'on it' as 'on them'" do
		expect( 'on it'.en.plural ).to eq( 'on them' )
	end


	it "pluralizes 'onus' as 'onuses'" do
		expect( 'onus'.en.plural ).to eq( 'onuses' )
	end


	it "pluralizes 'opera' as 'operas'" do
		expect( 'opera'.en.plural ).to eq( 'operas' )
	end


	it "pluralizes 'optimum' as 'optimums'" do
		expect( 'optimum'.en.plural ).to eq( 'optimums' )
	end

	it "pluralizes 'optimum' as 'optima' in classical mode" do
		Linguistics::EN.in_classical_mode do
			expect( 'optimum'.en.plural ).to eq( 'optima' )
		end
	end


	it "pluralizes 'opus' as 'opuses'" do
		expect( 'opus'.en.plural ).to eq( 'opuses' )
	end

	it "pluralizes 'opus' as 'opera' in classical mode" do
		Linguistics::EN.in_classical_mode do
			expect( 'opus'.en.plural ).to eq( 'opera' )
		end
	end


	it "pluralizes 'organon' as 'organa'" do
		expect( 'organon'.en.plural ).to eq( 'organa' )
	end


	# VERB (UNLIKE bride to be)
	it "pluralizes 'ought to be' as 'ought to be'" do
		expect( 'ought to be'.en.plural ).to eq( 'ought to be' )
	end


	it "pluralizes 'ovum' as 'ova'" do
		expect( 'ovum'.en.plural ).to eq( 'ova' )
	end


	it "pluralizes 'ox' as 'oxen'" do
		expect( 'ox'.en.plural ).to eq( 'oxen' )
	end


	# POSSESSIVE FORM
	it "pluralizes 'ox's' as 'oxen's'" do
		expect( "ox's".en.plural ).to eq( "oxen's" )
	end


	it "pluralizes 'oxymoron' as 'oxymorons'" do
		expect( 'oxymoron'.en.plural ).to eq( 'oxymorons' )
	end

	it "pluralizes 'oxymoron' as 'oxymora' in classical mode" do
		Linguistics::EN.in_classical_mode do
			expect( 'oxymoron'.en.plural ).to eq( 'oxymora' )
		end
	end


	it "pluralizes 'Panaman' as 'Panamans'" do
		expect( 'Panaman'.en.plural ).to eq( 'Panamans' )
	end


	it "pluralizes 'parabola' as 'parabolas'" do
		expect( 'parabola'.en.plural ).to eq( 'parabolas' )
	end

	it "pluralizes 'parabola' as 'parabolae' in classical mode" do
		Linguistics::EN.in_classical_mode do
			expect( 'parabola'.en.plural ).to eq( 'parabolae' )
		end
	end


	it "pluralizes 'Parmese' as 'Parmese'" do
		expect( 'Parmese'.en.plural ).to eq( 'Parmese' )
	end


	it "pluralizes 'pathos' as 'pathoses'" do
		expect( 'pathos'.en.plural ).to eq( 'pathoses' )
	end


	it "pluralizes 'pegasus' as 'pegasuses'" do
		expect( 'pegasus'.en.plural ).to eq( 'pegasuses' )
	end


	it "pluralizes 'Pekingese' as 'Pekingese'" do
		expect( 'Pekingese'.en.plural ).to eq( 'Pekingese' )
	end


	it "pluralizes 'pelvis' as 'pelvises'" do
		expect( 'pelvis'.en.plural ).to eq( 'pelvises' )
	end


	it "pluralizes 'pendulum' as 'pendulums'" do
		expect( 'pendulum'.en.plural ).to eq( 'pendulums' )
	end


	it "pluralizes 'penis' as 'penises'" do
		expect( 'penis'.en.plural ).to eq( 'penises' )
	end

	it "pluralizes 'penis' as 'penes' in classical mode" do
		Linguistics::EN.in_classical_mode do
			expect( 'penis'.en.plural ).to eq( 'penes' )
		end
	end


	it "pluralizes 'penumbra' as 'penumbras'" do
		expect( 'penumbra'.en.plural ).to eq( 'penumbras' )
	end

	it "pluralizes 'penumbra' as 'penumbrae' in classical mode" do
		Linguistics::EN.in_classical_mode do
			expect( 'penumbra'.en.plural ).to eq( 'penumbrae' )
		end
	end


	it "pluralizes 'perihelion' as 'perihelia'" do
		expect( 'perihelion'.en.plural ).to eq( 'perihelia' )
	end


	it "pluralizes 'persona' as 'personae'" do
		expect( 'persona'.en.plural ).to eq( 'personae' )
	end


	it "pluralizes 'petroleum' as 'petroleums'" do
		expect( 'petroleum'.en.plural ).to eq( 'petroleums' )
	end


	it "pluralizes 'phalanx' as 'phalanxes'" do
		expect( 'phalanx'.en.plural ).to eq( 'phalanxes' )
	end

	it "pluralizes 'phalanx' as 'phalanges' in classical mode" do
		Linguistics::EN.in_classical_mode do
			expect( 'phalanx'.en.plural ).to eq( 'phalanges' )
		end
	end


	it "pluralizes 'PhD' as 'PhDs'" do
		expect( 'PhD'.en.plural ).to eq( 'PhDs' )
	end


	it "pluralizes 'phenomenon' as 'phenomena'" do
		expect( 'phenomenon'.en.plural ).to eq( 'phenomena' )
	end


	it "pluralizes 'philtrum' as 'philtrums'" do
		expect( 'philtrum'.en.plural ).to eq( 'philtrums' )
	end


	it "pluralizes 'photo' as 'photos'" do
		expect( 'photo'.en.plural ).to eq( 'photos' )
	end


	it "pluralizes 'phylum' as 'phylums'" do
		expect( 'phylum'.en.plural ).to eq( 'phylums' )
	end

	it "pluralizes 'phylum' as 'phyla' in classical mode" do
		Linguistics::EN.in_classical_mode do
			expect( 'phylum'.en.plural ).to eq( 'phyla' )
		end
	end


	it "pluralizes 'piano' as 'pianos'" do
		expect( 'piano'.en.plural ).to eq( 'pianos' )
	end

	it "pluralizes 'piano' as 'piani' in classical mode" do
		Linguistics::EN.in_classical_mode do
			expect( 'piano'.en.plural ).to eq( 'piani' )
		end
	end


	it "pluralizes 'Piedmontese' as 'Piedmontese'" do
		expect( 'Piedmontese'.en.plural ).to eq( 'Piedmontese' )
	end


	it "pluralizes 'pincer' as 'pincers'" do
		expect( 'pincer'.en.plural ).to eq( 'pincers' )
	end


	it "pluralizes 'pincers' as 'pincers'" do
		expect( 'pincers'.en.plural ).to eq( 'pincers' )
	end


	it "pluralizes 'Pistoiese' as 'Pistoiese'" do
		expect( 'Pistoiese'.en.plural ).to eq( 'Pistoiese' )
	end


	it "pluralizes 'plateau' as 'plateaus'" do
		expect( 'plateau'.en.plural ).to eq( 'plateaus' )
	end

	it "pluralizes 'plateau' as 'plateaux' in classical mode" do
		Linguistics::EN.in_classical_mode do
			expect( 'plateau'.en.plural ).to eq( 'plateaux' )
		end
	end


	it "pluralizes 'play' as 'plays'" do
		expect( 'play'.en.plural ).to eq( 'plays' )
	end


	it "pluralizes 'plexus' as 'plexuses'" do
		expect( 'plexus'.en.plural ).to eq( 'plexuses' )
	end

	it "pluralizes 'plexus' as 'plexus' in classical mode" do
		Linguistics::EN.in_classical_mode do
			expect( 'plexus'.en.plural ).to eq( 'plexus' )
		end
	end


	it "pluralizes 'pliers' as 'pliers'" do
		expect( 'pliers'.en.plural ).to eq( 'pliers' )
	end


	# VERB FORM
	it "pluralizes 'plies' as 'ply'" do
		expect( 'plies'.en.plural ).to eq( 'ply' )
	end


	it "pluralizes 'polis' as 'polises'" do
		expect( 'polis'.en.plural ).to eq( 'polises' )
	end


	it "pluralizes 'Polonese' as 'Polonese'" do
		expect( 'Polonese'.en.plural ).to eq( 'Polonese' )
	end


	it "pluralizes 'pontifex' as 'pontifexes'" do
		expect( 'pontifex'.en.plural ).to eq( 'pontifexes' )
	end

	it "pluralizes 'pontifex' as 'pontifices' in classical mode" do
		Linguistics::EN.in_classical_mode do
			expect( 'pontifex'.en.plural ).to eq( 'pontifices' )
		end
	end


	it "pluralizes 'portmanteau' as 'portmanteaus'" do
		expect( 'portmanteau'.en.plural ).to eq( 'portmanteaus' )
	end

	it "pluralizes 'portmanteau' as 'portmanteaux' in classical mode" do
		Linguistics::EN.in_classical_mode do
			expect( 'portmanteau'.en.plural ).to eq( 'portmanteaux' )
		end
	end


	it "pluralizes 'Portuguese' as 'Portuguese'" do
		expect( 'Portuguese'.en.plural ).to eq( 'Portuguese' )
	end


	it "pluralizes 'potato' as 'potatoes'" do
		expect( 'potato'.en.plural ).to eq( 'potatoes' )
	end


	it "pluralizes 'pox' as 'pox'" do
		expect( 'pox'.en.plural ).to eq( 'pox' )
	end


	it "pluralizes 'pragma' as 'pragmas'" do
		expect( 'pragma'.en.plural ).to eq( 'pragmas' )
	end

	it "pluralizes 'pragma' as 'pragmata' in classical mode" do
		Linguistics::EN.in_classical_mode do
			expect( 'pragma'.en.plural ).to eq( 'pragmata' )
		end
	end


	it "pluralizes 'premium' as 'premiums'" do
		expect( 'premium'.en.plural ).to eq( 'premiums' )
	end


	it "pluralizes 'prima donna' as 'prima donnas'" do
		expect( 'prima donna'.en.plural ).to eq( 'prima donnas' )
	end

	it "pluralizes 'prima donna' as 'prime donne' in classical mode" do
		Linguistics::EN.in_classical_mode do
			expect( 'prima donna'.en.plural ).to eq( 'prime donne' )
		end
	end


	it "pluralizes 'pro' as 'pros'" do
		expect( 'pro'.en.plural ).to eq( 'pros' )
	end


	it "pluralizes 'proceedings' as 'proceedings'" do
		expect( 'proceedings'.en.plural ).to eq( 'proceedings' )
	end


	it "pluralizes 'prolegomenon' as 'prolegomena'" do
		expect( 'prolegomenon'.en.plural ).to eq( 'prolegomena' )
	end


	it "pluralizes 'proof' as 'proofs'" do
		expect( 'proof'.en.plural ).to eq( 'proofs' )
	end


	it "pluralizes 'proof of concept' as 'proofs of concept'" do
		expect( 'proof of concept'.en.plural ).to eq( 'proofs of concept' )
	end


	it "pluralizes 'prosecutrix' as 'prosecutrixes'" do
		expect( 'prosecutrix'.en.plural ).to eq( 'prosecutrixes' )
	end

	it "pluralizes 'prosecutrix' as 'prosecutrices' in classical mode" do
		Linguistics::EN.in_classical_mode do
			expect( 'prosecutrix'.en.plural ).to eq( 'prosecutrices' )
		end
	end


	it "pluralizes 'prospectus' as 'prospectuses'" do
		expect( 'prospectus'.en.plural ).to eq( 'prospectuses' )
	end

	it "pluralizes 'prospectus' as 'prospectus' in classical mode" do
		Linguistics::EN.in_classical_mode do
			expect( 'prospectus'.en.plural ).to eq( 'prospectus' )
		end
	end


	it "pluralizes 'protozoan' as 'protozoans'" do
		expect( 'protozoan'.en.plural ).to eq( 'protozoans' )
	end


	it "pluralizes 'protozoon' as 'protozoa'" do
		expect( 'protozoon'.en.plural ).to eq( 'protozoa' )
	end


	it "pluralizes 'put' as 'put'" do
		expect( 'put'.en.plural ).to eq( 'put' )
	end


	it "pluralizes 'quantum' as 'quantums'" do
		expect( 'quantum'.en.plural ).to eq( 'quantums' )
	end

	it "pluralizes 'quantum' as 'quanta' in classical mode" do
		Linguistics::EN.in_classical_mode do
			expect( 'quantum'.en.plural ).to eq( 'quanta' )
		end
	end


	it "pluralizes 'quartermaster general' as 'quartermasters general'" do
		expect( 'quartermaster general'.en.plural ).to eq( 'quartermasters general' )
	end


	it "pluralizes 'quarto' as 'quartos'" do
		expect( 'quarto'.en.plural ).to eq( 'quartos' )
	end


	it "pluralizes 'quorum' as 'quorums'" do
		expect( 'quorum'.en.plural ).to eq( 'quorums' )
	end


	it "pluralizes 'rabies' as 'rabies'" do
		expect( 'rabies'.en.plural ).to eq( 'rabies' )
	end


	it "pluralizes 'radius' as 'radiuses'" do
		expect( 'radius'.en.plural ).to eq( 'radiuses' )
	end

	it "pluralizes 'radius' as 'radii' in classical mode" do
		Linguistics::EN.in_classical_mode do
			expect( 'radius'.en.plural ).to eq( 'radii' )
		end
	end


	it "pluralizes 'radix' as 'radices'" do
		expect( 'radix'.en.plural ).to eq( 'radices' )
	end


	it "pluralizes 'rebus' as 'rebuses'" do
		expect( 'rebus'.en.plural ).to eq( 'rebuses' )
	end


	it "pluralizes 'reindeer' as 'reindeer'" do
		expect( 'reindeer'.en.plural ).to eq( 'reindeer' )
	end


	it "pluralizes 'rhino' as 'rhinos'" do
		expect( 'rhino'.en.plural ).to eq( 'rhinos' )
	end


	it "pluralizes 'rhinoceros' as 'rhinoceroses'" do
		expect( 'rhinoceros'.en.plural ).to eq( 'rhinoceroses' )
	end

	it "pluralizes 'rhinoceros' as 'rhinoceros' in classical mode" do
		Linguistics::EN.in_classical_mode do
			expect( 'rhinoceros'.en.plural ).to eq( 'rhinoceros' )
		end
	end


	it "pluralizes 'Romagnese' as 'Romagnese'" do
		expect( 'Romagnese'.en.plural ).to eq( 'Romagnese' )
	end


	it "pluralizes 'Romanese' as 'Romanese'" do
		expect( 'Romanese'.en.plural ).to eq( 'Romanese' )
	end


	it "pluralizes 'romeo' as 'romeos'" do
		expect( 'romeo'.en.plural ).to eq( 'romeos' )
	end


	it "pluralizes 'roof' as 'roofs'" do
		expect( 'roof'.en.plural ).to eq( 'roofs' )
	end


	it "pluralizes 'rostrum' as 'rostrums'" do
		expect( 'rostrum'.en.plural ).to eq( 'rostrums' )
	end

	it "pluralizes 'rostrum' as 'rostra' in classical mode" do
		Linguistics::EN.in_classical_mode do
			expect( 'rostrum'.en.plural ).to eq( 'rostra' )
		end
	end


	it "pluralizes 'ruckus' as 'ruckuses'" do
		expect( 'ruckus'.en.plural ).to eq( 'ruckuses' )
	end


	it "pluralizes 'salmon' as 'salmon'" do
		expect( 'salmon'.en.plural ).to eq( 'salmon' )
	end


	it "pluralizes 'Sangirese' as 'Sangirese'" do
		expect( 'Sangirese'.en.plural ).to eq( 'Sangirese' )
	end


	it "pluralizes 'sank' as 'sank'" do
		expect( 'sank'.en.plural ).to eq( 'sank' )
	end


	it "pluralizes 'Sarawakese' as 'Sarawakese'" do
		expect( 'Sarawakese'.en.plural ).to eq( 'Sarawakese' )
	end


	it "pluralizes 'sarcoma' as 'sarcomas'" do
		expect( 'sarcoma'.en.plural ).to eq( 'sarcomas' )
	end

	it "pluralizes 'sarcoma' as 'sarcomata' in classical mode" do
		Linguistics::EN.in_classical_mode do
			expect( 'sarcoma'.en.plural ).to eq( 'sarcomata' )
		end
	end


	it "pluralizes 'sassafras' as 'sassafrases'" do
		expect( 'sassafras'.en.plural ).to eq( 'sassafrases' )
	end


	# NOUN FORM
	it "pluralizes 'saw' as 'saws'" do
		expect( 'saw'.en.plural ).to eq( 'saws' )
	end


	# VERB FORM (1st/2nd pers.)
	it "pluralizes 'saw' (as a verb) as 'saw'" do
		expect( 'saw'.en.plural_verb ).to eq( 'saw' )
	end


	# VERB FORM (3rd pers.)
	it "pluralizes 'saws' as 'saw'" do
		expect( 'saws'.en.plural ).to eq( 'saw' )
	end


	it "pluralizes 'scarf' as 'scarves'" do
		expect( 'scarf'.en.plural ).to eq( 'scarves' )
	end


	it "pluralizes 'schema' as 'schemas'" do
		expect( 'schema'.en.plural ).to eq( 'schemas' )
	end

	it "pluralizes 'schema' as 'schemata' in classical mode" do
		Linguistics::EN.in_classical_mode do
			expect( 'schema'.en.plural ).to eq( 'schemata' )
		end
	end


	it "pluralizes 'scissors' as 'scissors'" do
		expect( 'scissors'.en.plural ).to eq( 'scissors' )
	end


	it "pluralizes 'Scotsman' as 'Scotsmen'" do
		expect( 'Scotsman'.en.plural ).to eq( 'Scotsmen' )
	end


	it "pluralizes 'sea-bass' as 'sea-bass'" do
		expect( 'sea-bass'.en.plural ).to eq( 'sea-bass' )
	end


	it "pluralizes 'self' as 'selves'" do
		expect( 'self'.en.plural ).to eq( 'selves' )
	end


	it "pluralizes 'Selman' as 'Selmans'" do
		expect( 'Selman'.en.plural ).to eq( 'Selmans' )
	end


	it "pluralizes 'Senegalese' as 'Senegalese'" do
		expect( 'Senegalese'.en.plural ).to eq( 'Senegalese' )
	end


	it "pluralizes 'seraph' as 'seraphs'" do
		expect( 'seraph'.en.plural ).to eq( 'seraphs' )
	end

	it "pluralizes 'seraph' as 'seraphim' in classical mode" do
		Linguistics::EN.in_classical_mode do
			expect( 'seraph'.en.plural ).to eq( 'seraphim' )
		end
	end


	it "pluralizes 'series' as 'series'" do
		expect( 'series'.en.plural ).to eq( 'series' )
	end


	it "pluralizes 'shall eat' as 'shall eat'" do
		expect( 'shall eat'.en.plural ).to eq( 'shall eat' )
	end


	it "pluralizes 'Shavese' as 'Shavese'" do
		expect( 'Shavese'.en.plural ).to eq( 'Shavese' )
	end


	it "pluralizes 'Shawanese' as 'Shawanese'" do
		expect( 'Shawanese'.en.plural ).to eq( 'Shawanese' )
	end


	it "pluralizes 'she' as 'they'" do
		expect( 'she'.en.plural ).to eq( 'they' )
	end


	it "pluralizes 'sheaf' as 'sheaves'" do
		expect( 'sheaf'.en.plural ).to eq( 'sheaves' )
	end


	it "pluralizes 'shears' as 'shears'" do
		expect( 'shears'.en.plural ).to eq( 'shears' )
	end


	it "pluralizes 'sheep' as 'sheep'" do
		expect( 'sheep'.en.plural ).to eq( 'sheep' )
	end


	it "pluralizes 'shelf' as 'shelves'" do
		expect( 'shelf'.en.plural ).to eq( 'shelves' )
	end


	it "pluralizes 'should have' as 'should have'" do
		expect( 'should have'.en.plural ).to eq( 'should have' )
	end


	it "pluralizes 'Siamese' as 'Siamese'" do
		expect( 'Siamese'.en.plural ).to eq( 'Siamese' )
	end


	it "pluralizes 'Sienese' as 'Sienese'" do
		expect( 'Sienese'.en.plural ).to eq( 'Sienese' )
	end


	it "pluralizes 'Sikkimese' as 'Sikkimese'" do
		expect( 'Sikkimese'.en.plural ).to eq( 'Sikkimese' )
	end


	it "pluralizes 'silex' as 'silices'" do
		expect( 'silex'.en.plural ).to eq( 'silices' )
	end


	it "pluralizes 'simplex' as 'simplexes'" do
		expect( 'simplex'.en.plural ).to eq( 'simplexes' )
	end

	it "pluralizes 'simplex' as 'simplices' in classical mode" do
		Linguistics::EN.in_classical_mode do
			expect( 'simplex'.en.plural ).to eq( 'simplices' )
		end
	end


	it "pluralizes 'Singhalese' as 'Singhalese'" do
		expect( 'Singhalese'.en.plural ).to eq( 'Singhalese' )
	end


	it "pluralizes 'Sinhalese' as 'Sinhalese'" do
		expect( 'Sinhalese'.en.plural ).to eq( 'Sinhalese' )
	end


	it "pluralizes 'sinus' as 'sinuses'" do
		expect( 'sinus'.en.plural ).to eq( 'sinuses' )
	end

	it "pluralizes 'sinus' as 'sinus' in classical mode" do
		Linguistics::EN.in_classical_mode do
			expect( 'sinus'.en.plural ).to eq( 'sinus' )
		end
	end


	it "pluralizes 'size' as 'sizes'" do
		expect( 'size'.en.plural ).to eq( 'sizes' )
	end


	# VERB FORM
	it "pluralizes 'sizes' as 'size'" do
		expect( 'sizes'.en.plural ).to eq( 'size' )
	end


	it "pluralizes 'smallpox' as 'smallpox'" do
		expect( 'smallpox'.en.plural ).to eq( 'smallpox' )
	end


	it "pluralizes 'Smith' as 'Smiths'" do
		expect( 'Smith'.en.plural ).to eq( 'Smiths' )
	end


	it "pluralizes 'Sogdianese' as 'Sogdianese'" do
		expect( 'Sogdianese'.en.plural ).to eq( 'Sogdianese' )
	end


	it "pluralizes 'soliloquy' as 'soliloquies'" do
		expect( 'soliloquy'.en.plural ).to eq( 'soliloquies' )
	end


	it "pluralizes 'solo' as 'solos'" do
		expect( 'solo'.en.plural ).to eq( 'solos' )
	end

	it "pluralizes 'solo' as 'soli' in classical mode" do
		Linguistics::EN.in_classical_mode do
			expect( 'solo'.en.plural ).to eq( 'soli' )
		end
	end


	it "pluralizes 'soma' as 'somas'" do
		expect( 'soma'.en.plural ).to eq( 'somas' )
	end

	it "pluralizes 'soma' as 'somata' in classical mode" do
		Linguistics::EN.in_classical_mode do
			expect( 'soma'.en.plural ).to eq( 'somata' )
		end
	end


	it "pluralizes 'son of a bitch' as 'sons of bitches'" do
		expect( 'son of a bitch'.en.plural ).to eq( 'sons of bitches' )
	end


	it "pluralizes 'Sonaman' as 'Sonamans'" do
		expect( 'Sonaman'.en.plural ).to eq( 'Sonamans' )
	end


	it "pluralizes 'soprano' as 'sopranos'" do
		expect( 'soprano'.en.plural ).to eq( 'sopranos' )
	end

	it "pluralizes 'soprano' as 'soprani' in classical mode" do
		Linguistics::EN.in_classical_mode do
			expect( 'soprano'.en.plural ).to eq( 'soprani' )
		end
	end


	it "pluralizes 'sought' as 'sought'" do
		expect( 'sought'.en.plural ).to eq( 'sought' )
	end


	it "pluralizes 'species' as 'species'" do
		expect( 'species'.en.plural ).to eq( 'species' )
	end


	it "pluralizes 'spectrum' as 'spectrums'" do
		expect( 'spectrum'.en.plural ).to eq( 'spectrums' )
	end

	it "pluralizes 'spectrum' as 'spectra' in classical mode" do
		Linguistics::EN.in_classical_mode do
			expect( 'spectrum'.en.plural ).to eq( 'spectra' )
		end
	end


	it "pluralizes 'speculum' as 'speculums'" do
		expect( 'speculum'.en.plural ).to eq( 'speculums' )
	end

	it "pluralizes 'speculum' as 'specula' in classical mode" do
		Linguistics::EN.in_classical_mode do
			expect( 'speculum'.en.plural ).to eq( 'specula' )
		end
	end


	it "pluralizes 'spent' as 'spent'" do
		expect( 'spent'.en.plural ).to eq( 'spent' )
	end


	it "pluralizes 'spermatozoon' as 'spermatozoa'" do
		expect( 'spermatozoon'.en.plural ).to eq( 'spermatozoa' )
	end


	it "pluralizes 'sphinx' as 'sphinxes'" do
		expect( 'sphinx'.en.plural ).to eq( 'sphinxes' )
	end

	it "pluralizes 'sphinx' as 'sphinges' in classical mode" do
		Linguistics::EN.in_classical_mode do
			expect( 'sphinx'.en.plural ).to eq( 'sphinges' )
		end
	end


	it "pluralizes 'stadium' as 'stadiums'" do
		expect( 'stadium'.en.plural ).to eq( 'stadiums' )
	end

	it "pluralizes 'stadium' as 'stadia' in classical mode" do
		Linguistics::EN.in_classical_mode do
			expect( 'stadium'.en.plural ).to eq( 'stadia' )
		end
	end


	it "pluralizes 'stamen' as 'stamens'" do
		expect( 'stamen'.en.plural ).to eq( 'stamens' )
	end

	it "pluralizes 'stamen' as 'stamina' in classical mode" do
		Linguistics::EN.in_classical_mode do
			expect( 'stamen'.en.plural ).to eq( 'stamina' )
		end
	end


	it "pluralizes 'status' as 'statuses'" do
		expect( 'status'.en.plural ).to eq( 'statuses' )
	end

	it "pluralizes 'status' as 'status' in classical mode" do
		Linguistics::EN.in_classical_mode do
			expect( 'status'.en.plural ).to eq( 'status' )
		end
	end


	it "pluralizes 'stereo' as 'stereos'" do
		expect( 'stereo'.en.plural ).to eq( 'stereos' )
	end


	it "pluralizes 'stigma' as 'stigmas'" do
		expect( 'stigma'.en.plural ).to eq( 'stigmas' )
	end

	it "pluralizes 'stigma' as 'stigmata' in classical mode" do
		Linguistics::EN.in_classical_mode do
			expect( 'stigma'.en.plural ).to eq( 'stigmata' )
		end
	end


	it "pluralizes 'stimulus' as 'stimuli'" do
		expect( 'stimulus'.en.plural ).to eq( 'stimuli' )
	end


	it "pluralizes 'stoma' as 'stomas'" do
		expect( 'stoma'.en.plural ).to eq( 'stomas' )
	end

	it "pluralizes 'stoma' as 'stomata' in classical mode" do
		Linguistics::EN.in_classical_mode do
			expect( 'stoma'.en.plural ).to eq( 'stomata' )
		end
	end


	it "pluralizes 'storey' as 'storeys'" do
		expect( 'storey'.en.plural ).to eq( 'storeys' )
	end


	it "pluralizes 'story' as 'stories'" do
		expect( 'story'.en.plural ).to eq( 'stories' )
	end


	it "pluralizes 'stratum' as 'strata'" do
		expect( 'stratum'.en.plural ).to eq( 'strata' )
	end


	it "pluralizes 'strife' as 'strifes'" do
		expect( 'strife'.en.plural ).to eq( 'strifes' )
	end


	it "pluralizes 'stylo' as 'stylos'" do
		expect( 'stylo'.en.plural ).to eq( 'stylos' )
	end


	it "pluralizes 'stylus' as 'styluses'" do
		expect( 'stylus'.en.plural ).to eq( 'styluses' )
	end

	it "pluralizes 'stylus' as 'styli' in classical mode" do
		Linguistics::EN.in_classical_mode do
			expect( 'stylus'.en.plural ).to eq( 'styli' )
		end
	end


	it "pluralizes 'succubus' as 'succubuses'" do
		expect( 'succubus'.en.plural ).to eq( 'succubuses' )
	end

	it "pluralizes 'succubus' as 'succubi' in classical mode" do
		Linguistics::EN.in_classical_mode do
			expect( 'succubus'.en.plural ).to eq( 'succubi' )
		end
	end


	it "pluralizes 'Sudanese' as 'Sudanese'" do
		expect( 'Sudanese'.en.plural ).to eq( 'Sudanese' )
	end


	it "pluralizes 'suffix' as 'suffixes'" do
		expect( 'suffix'.en.plural ).to eq( 'suffixes' )
	end


	it "pluralizes 'Sundanese' as 'Sundanese'" do
		expect( 'Sundanese'.en.plural ).to eq( 'Sundanese' )
	end


	it "pluralizes 'superior' as 'superiors'" do
		expect( 'superior'.en.plural ).to eq( 'superiors' )
	end


	it "pluralizes 'Surgeon-General' as 'Surgeons-General'" do
		expect( 'Surgeon-General'.en.plural ).to eq( 'Surgeons-General' )
	end


	it "pluralizes 'surplus' as 'surpluses'" do
		expect( 'surplus'.en.plural ).to eq( 'surpluses' )
	end


	it "pluralizes 'Swahilese' as 'Swahilese'" do
		expect( 'Swahilese'.en.plural ).to eq( 'Swahilese' )
	end


	it "pluralizes 'swine' as 'swines'" do
		expect( 'swine'.en.plural ).to eq( 'swines' )
	end

	it "pluralizes 'swine' as 'swine' in classical mode" do
		Linguistics::EN.in_classical_mode do
			expect( 'swine'.en.plural ).to eq( 'swine' )
		end
	end


	it "pluralizes 'syringe' as 'syringes'" do
		expect( 'syringe'.en.plural ).to eq( 'syringes' )
	end


	it "pluralizes 'syrinx' as 'syrinxes'" do
		expect( 'syrinx'.en.plural ).to eq( 'syrinxes' )
	end

	it "pluralizes 'syrinx' as 'syringes' in classical mode" do
		Linguistics::EN.in_classical_mode do
			expect( 'syrinx'.en.plural ).to eq( 'syringes' )
		end
	end


	it "pluralizes 'tableau' as 'tableaus'" do
		expect( 'tableau'.en.plural ).to eq( 'tableaus' )
	end

	it "pluralizes 'tableau' as 'tableaux' in classical mode" do
		Linguistics::EN.in_classical_mode do
			expect( 'tableau'.en.plural ).to eq( 'tableaux' )
		end
	end


	it "pluralizes 'Tacoman' as 'Tacomans'" do
		expect( 'Tacoman'.en.plural ).to eq( 'Tacomans' )
	end


	it "pluralizes 'tattoo' as 'tattoos'" do
		expect( 'tattoo'.en.plural ).to eq( 'tattoos' )
	end


	it "pluralizes 'tempo' as 'tempos'" do
		expect( 'tempo'.en.plural ).to eq( 'tempos' )
	end

	it "pluralizes 'tempo' as 'tempi' in classical mode" do
		Linguistics::EN.in_classical_mode do
			expect( 'tempo'.en.plural ).to eq( 'tempi' )
		end
	end


	it "pluralizes 'Tenggerese' as 'Tenggerese'" do
		expect( 'Tenggerese'.en.plural ).to eq( 'Tenggerese' )
	end


	it "pluralizes 'testatrix' as 'testatrixes'" do
		expect( 'testatrix'.en.plural ).to eq( 'testatrixes' )
	end

	it "pluralizes 'testatrix' as 'testatrices' in classical mode" do
		Linguistics::EN.in_classical_mode do
			expect( 'testatrix'.en.plural ).to eq( 'testatrices' )
		end
	end


	it "pluralizes 'testes' as 'testes'" do
		expect( 'testes'.en.plural ).to eq( 'testes' )
	end


	it "pluralizes 'testis' as 'testes'" do
		expect( 'testis'.en.plural ).to eq( 'testes' )
	end


	it "pluralizes 'that' as 'those'" do
		expect( 'that'.en.plural ).to eq( 'those' )
	end


	# POSSESSIVE FORM (GENDER-INCLUSIVE)
	it "pluralizes 'their' as 'their'" do
		expect( 'their'.en.plural ).to eq( 'their' )
	end


	# ugly but gaining currency
	it "pluralizes 'themself' as 'themselves'" do
		expect( 'themself'.en.plural ).to eq( 'themselves' )
	end


	# for indeterminate gender
	it "pluralizes 'they' as 'they'" do
		expect( 'they'.en.plural ).to eq( 'they' )
	end


	it "pluralizes 'this' as 'these'" do
		expect( 'this'.en.plural ).to eq( 'these' )
	end


	# VERB FORM
	it "pluralizes 'thought' (as a verb) as 'thought'" do
		expect( 'thought'.en.plural_verb ).to eq( 'thought' )
	end


	# NOUN FORM
	it "pluralizes 'thought' as 'thoughts'" do
		expect( 'thought'.en.plural ).to eq( 'thoughts' )
	end


	it "pluralizes 'Times' as 'Timeses'" do
		expect( 'Times'.en.plural ).to eq( 'Timeses' )
	end


	it "pluralizes 'Timorese' as 'Timorese'" do
		expect( 'Timorese'.en.plural ).to eq( 'Timorese' )
	end


	it "pluralizes 'Tirolese' as 'Tirolese'" do
		expect( 'Tirolese'.en.plural ).to eq( 'Tirolese' )
	end


	it "pluralizes 'to her' as 'to them'" do
		expect( 'to her'.en.plural ).to eq( 'to them' )
	end


	it "pluralizes 'to herself' as 'to themselves'" do
		expect( 'to herself'.en.plural ).to eq( 'to themselves' )
	end


	it "pluralizes 'to him' as 'to them'" do
		expect( 'to him'.en.plural ).to eq( 'to them' )
	end


	it "pluralizes 'to himself' as 'to themselves'" do
		expect( 'to himself'.en.plural ).to eq( 'to themselves' )
	end


	it "pluralizes 'to it' as 'to them'" do
		expect( 'to it'.en.plural ).to eq( 'to them' )
	end


	# ACCUSATIVE
	it "pluralizes 'to it' as 'to them'" do
		expect( 'to it'.en.plural ).to eq( 'to them' )
	end


	it "pluralizes 'to itself' as 'to themselves'" do
		expect( 'to itself'.en.plural ).to eq( 'to themselves' )
	end


	it "pluralizes 'to me' as 'to us'" do
		expect( 'to me'.en.plural ).to eq( 'to us' )
	end


	it "pluralizes 'to myself' as 'to ourselves'" do
		expect( 'to myself'.en.plural ).to eq( 'to ourselves' )
	end


	# for indeterminate gender
	it "pluralizes 'to them' as 'to them'" do
		expect( 'to them'.en.plural ).to eq( 'to them' )
	end


	# ugly but gaining currency
	it "pluralizes 'to themself' as 'to themselves'" do
		expect( 'to themself'.en.plural ).to eq( 'to themselves' )
	end


	it "pluralizes 'to you' as 'to you'" do
		expect( 'to you'.en.plural ).to eq( 'to you' )
	end


	it "pluralizes 'to yourself' as 'to yourselves'" do
		expect( 'to yourself'.en.plural ).to eq( 'to yourselves' )
	end


	it "pluralizes 'Tocharese' as 'Tocharese'" do
		expect( 'Tocharese'.en.plural ).to eq( 'Tocharese' )
	end


	it "pluralizes 'tomato' as 'tomatoes'" do
		expect( 'tomato'.en.plural ).to eq( 'tomatoes' )
	end


	it "pluralizes 'Tonkinese' as 'Tonkinese'" do
		expect( 'Tonkinese'.en.plural ).to eq( 'Tonkinese' )
	end


	it "pluralizes 'tonsillitis' as 'tonsillitises'" do
		expect( 'tonsillitis'.en.plural ).to eq( 'tonsillitises' )
	end


	it "pluralizes 'tooth' as 'teeth'" do
		expect( 'tooth'.en.plural ).to eq( 'teeth' )
	end


	it "pluralizes 'Torinese' as 'Torinese'" do
		expect( 'Torinese'.en.plural ).to eq( 'Torinese' )
	end


	it "pluralizes 'torus' as 'toruses'" do
		expect( 'torus'.en.plural ).to eq( 'toruses' )
	end

	it "pluralizes 'torus' as 'tori' in classical mode" do
		Linguistics::EN.in_classical_mode do
			expect( 'torus'.en.plural ).to eq( 'tori' )
		end
	end


	it "pluralizes 'trapezium' as 'trapeziums'" do
		expect( 'trapezium'.en.plural ).to eq( 'trapeziums' )
	end

	it "pluralizes 'trapezium' as 'trapezia' in classical mode" do
		Linguistics::EN.in_classical_mode do
			expect( 'trapezium'.en.plural ).to eq( 'trapezia' )
		end
	end


	it "pluralizes 'trauma' as 'traumas'" do
		expect( 'trauma'.en.plural ).to eq( 'traumas' )
	end

	it "pluralizes 'trauma' as 'traumata' in classical mode" do
		Linguistics::EN.in_classical_mode do
			expect( 'trauma'.en.plural ).to eq( 'traumata' )
		end
	end


	it "pluralizes 'travois' as 'travois'" do
		expect( 'travois'.en.plural ).to eq( 'travois' )
	end


	it "pluralizes 'trellis' as 'trellises'" do
		expect( 'trellis'.en.plural ).to eq( 'trellises' )
	end


	it "pluralizes 'tries' as 'try'" do
		expect( 'tries'.en.plural ).to eq( 'try' )
	end


	it "pluralizes 'trilby' as 'trilbys'" do
		expect( 'trilby'.en.plural ).to eq( 'trilbys' )
	end


	it "pluralizes 'trousers' as 'trousers'" do
		expect( 'trousers'.en.plural ).to eq( 'trousers' )
	end


	it "pluralizes 'trousseau' as 'trousseaus'" do
		expect( 'trousseau'.en.plural ).to eq( 'trousseaus' )
	end

	it "pluralizes 'trousseau' as 'trousseaux' in classical mode" do
		Linguistics::EN.in_classical_mode do
			expect( 'trousseau'.en.plural ).to eq( 'trousseaux' )
		end
	end


	it "pluralizes 'trout' as 'trout'" do
		expect( 'trout'.en.plural ).to eq( 'trout' )
	end


	it "pluralizes 'try' as 'tries'" do
		expect( 'try'.en.plural ).to eq( 'tries' )
	end


	it "pluralizes 'tuna' as 'tuna'" do
		expect( 'tuna'.en.plural ).to eq( 'tuna' )
	end


	it "pluralizes 'turf' as 'turfs'" do
		expect( 'turf'.en.plural ).to eq( 'turfs' )
	end

	it "pluralizes 'turf' as 'turves' in classical mode" do
		Linguistics::EN.in_classical_mode do
			expect( 'turf'.en.plural ).to eq( 'turves' )
		end
	end


	it "pluralizes 'Tyrolese' as 'Tyrolese'" do
		expect( 'Tyrolese'.en.plural ).to eq( 'Tyrolese' )
	end


	it "pluralizes 'ultimatum' as 'ultimatums'" do
		expect( 'ultimatum'.en.plural ).to eq( 'ultimatums' )
	end

	it "pluralizes 'ultimatum' as 'ultimata' in classical mode" do
		Linguistics::EN.in_classical_mode do
			expect( 'ultimatum'.en.plural ).to eq( 'ultimata' )
		end
	end


	it "pluralizes 'umbilicus' as 'umbilicuses'" do
		expect( 'umbilicus'.en.plural ).to eq( 'umbilicuses' )
	end

	it "pluralizes 'umbilicus' as 'umbilici' in classical mode" do
		Linguistics::EN.in_classical_mode do
			expect( 'umbilicus'.en.plural ).to eq( 'umbilici' )
		end
	end


	it "pluralizes 'umbra' as 'umbras'" do
		expect( 'umbra'.en.plural ).to eq( 'umbras' )
	end

	it "pluralizes 'umbra' as 'umbrae' in classical mode" do
		Linguistics::EN.in_classical_mode do
			expect( 'umbra'.en.plural ).to eq( 'umbrae' )
		end
	end


	it "pluralizes 'uterus' as 'uteruses'" do
		expect( 'uterus'.en.plural ).to eq( 'uteruses' )
	end

	it "pluralizes 'uterus' as 'uteri' in classical mode" do
		Linguistics::EN.in_classical_mode do
			expect( 'uterus'.en.plural ).to eq( 'uteri' )
		end
	end


	it "pluralizes 'vacuum' as 'vacuums'" do
		expect( 'vacuum'.en.plural ).to eq( 'vacuums' )
	end

	it "pluralizes 'vacuum' as 'vacua' in classical mode" do
		Linguistics::EN.in_classical_mode do
			expect( 'vacuum'.en.plural ).to eq( 'vacua' )
		end
	end


	it "pluralizes 'vellum' as 'vellums'" do
		expect( 'vellum'.en.plural ).to eq( 'vellums' )
	end


	it "pluralizes 'velum' as 'velums'" do
		expect( 'velum'.en.plural ).to eq( 'velums' )
	end

	it "pluralizes 'velum' as 'vela' in classical mode" do
		Linguistics::EN.in_classical_mode do
			expect( 'velum'.en.plural ).to eq( 'vela' )
		end
	end


	it "pluralizes 'Vermontese' as 'Vermontese'" do
		expect( 'Vermontese'.en.plural ).to eq( 'Vermontese' )
	end


	it "pluralizes 'Veronese' as 'Veronese'" do
		expect( 'Veronese'.en.plural ).to eq( 'Veronese' )
	end


	it "pluralizes 'vertebra' as 'vertebrae'" do
		expect( 'vertebra'.en.plural ).to eq( 'vertebrae' )
	end


	it "pluralizes 'vertex' as 'vertexes'" do
		expect( 'vertex'.en.plural ).to eq( 'vertexes' )
	end

	it "pluralizes 'vertex' as 'vertices' in classical mode" do
		Linguistics::EN.in_classical_mode do
			expect( 'vertex'.en.plural ).to eq( 'vertices' )
		end
	end


	it "pluralizes 'Viennese' as 'Viennese'" do
		expect( 'Viennese'.en.plural ).to eq( 'Viennese' )
	end


	it "pluralizes 'Vietnamese' as 'Vietnamese'" do
		expect( 'Vietnamese'.en.plural ).to eq( 'Vietnamese' )
	end


	it "pluralizes 'virus' as 'viruses'" do
		expect( 'virus'.en.plural ).to eq( 'viruses' )
	end


	it "pluralizes 'vixen' as 'vixens'" do
		expect( 'vixen'.en.plural ).to eq( 'vixens' )
	end


	it "pluralizes 'vortex' as 'vortexes'" do
		expect( 'vortex'.en.plural ).to eq( 'vortexes' )
	end

	it "pluralizes 'vortex' as 'vortices' in classical mode" do
		Linguistics::EN.in_classical_mode do
			expect( 'vortex'.en.plural ).to eq( 'vortices' )
		end
	end


	it "pluralizes 'walrus' as 'walruses'" do
		expect( 'walrus'.en.plural ).to eq( 'walruses' )
	end


	it "pluralizes 'was' as 'were'" do
		expect( 'was'.en.plural ).to eq( 'were' )
	end


	it "pluralizes 'was faced with' as 'were faced with'" do
		expect( 'was faced with'.en.plural ).to eq( 'were faced with' )
	end


	it "pluralizes 'was hoping' as 'were hoping'" do
		expect( 'was hoping'.en.plural ).to eq( 'were hoping' )
	end


	it "pluralizes 'Wenchowese' as 'Wenchowese'" do
		expect( 'Wenchowese'.en.plural ).to eq( 'Wenchowese' )
	end


	it "pluralizes 'were' as 'were'" do
		expect( 'were'.en.plural ).to eq( 'were' )
	end


	it "pluralizes 'were found' as 'were found'" do
		expect( 'were found'.en.plural ).to eq( 'were found' )
	end


	it "pluralizes 'wharf' as 'wharves'" do
		expect( 'wharf'.en.plural ).to eq( 'wharves' )
	end


	it "pluralizes 'whiting' as 'whiting'" do
		expect( 'whiting'.en.plural ).to eq( 'whiting' )
	end


	it "pluralizes 'Whitmanese' as 'Whitmanese'" do
		expect( 'Whitmanese'.en.plural ).to eq( 'Whitmanese' )
	end


	it "pluralizes 'wife' as 'wives'" do
		expect( 'wife'.en.plural ).to eq( 'wives' )
	end


	it "pluralizes 'wildebeest' as 'wildebeests'" do
		expect( 'wildebeest'.en.plural ).to eq( 'wildebeests' )
	end

	it "pluralizes 'wildebeest' as 'wildebeest' in classical mode" do
		Linguistics::EN.in_classical_mode do
			expect( 'wildebeest'.en.plural ).to eq( 'wildebeest' )
		end
	end


	# VERB FORM
	it "pluralizes 'will' (as a verb) as 'will'" do
		expect( 'will'.en.plural_verb ).to eq( 'will' )
	end


	# NOUN FORM
	it "pluralizes 'will' as 'wills'" do
		expect( 'will'.en.plural ).to eq( 'wills' )
	end


	# VERB FORM
	it "pluralizes 'will eat' (as a verb) as 'will eat'" do
		expect( 'will eat'.en.plural_verb ).to eq( 'will eat' )
	end


	# VERB FORM
	it "pluralizes 'wills' as 'will'" do
		expect( 'wills'.en.plural ).to eq( 'will' )
	end


	it "pluralizes 'wish' as 'wishes'" do
		expect( 'wish'.en.plural ).to eq( 'wishes' )
	end


	it "pluralizes 'with him' as 'with them'" do
		expect( 'with him'.en.plural ).to eq( 'with them' )
	end


	# ACCUSATIVE
	it "pluralizes 'with it' as 'with them'" do
		expect( 'with it'.en.plural ).to eq( 'with them' )
	end


	it "pluralizes 'wolf' as 'wolves'" do
		expect( 'wolf'.en.plural ).to eq( 'wolves' )
	end


	it "pluralizes 'woman' as 'women'" do
		expect( 'woman'.en.plural ).to eq( 'women' )
	end


	it "pluralizes 'woman of substance' as 'women of substance'" do
		expect( 'woman of substance'.en.plural ).to eq( 'women of substance' )
	end


	# POSSESSIVE FORM
	it "pluralizes 'woman's' as 'women's'" do
		expect( "woman's".en.plural ).to eq( "women's" )
	end


	it "pluralizes 'woodlouse' as 'woodlice'" do
		expect( 'woodlouse'.en.plural ).to eq( 'woodlice' )
	end


	it "pluralizes 'Yakiman' as 'Yakimans'" do
		expect( 'Yakiman'.en.plural ).to eq( 'Yakimans' )
	end


	it "pluralizes 'Yengeese' as 'Yengeese'" do
		expect( 'Yengeese'.en.plural ).to eq( 'Yengeese' )
	end


	it "pluralizes 'Yokohaman' as 'Yokohamans'" do
		expect( 'Yokohaman'.en.plural ).to eq( 'Yokohamans' )
	end


	it "pluralizes 'you' as 'you'" do
		expect( 'you'.en.plural ).to eq( 'you' )
	end


	# POSSESSIVE FORM
	it "pluralizes 'your' as 'your'" do
		expect( 'your'.en.plural ).to eq( 'your' )
	end


	it "pluralizes 'yourself' as 'yourselves'" do
		expect( 'yourself'.en.plural ).to eq( 'yourselves' )
	end


	it "pluralizes 'Yuman' as 'Yumans'" do
		expect( 'Yuman'.en.plural ).to eq( 'Yumans' )
	end


	it "pluralizes 'Yunnanese' as 'Yunnanese'" do
		expect( 'Yunnanese'.en.plural ).to eq( 'Yunnanese' )
	end


	it "pluralizes 'zoon' as 'zoa'" do
		expect( 'zoon'.en.plural ).to eq( 'zoa' )
	end


	context "lprintf formatters" do

		it "registers the :PL lprintf formatter" do
			expect( Linguistics::EN.lprintf_formatters ).to include( :PL )
		end

		it "pluralizes the argument to %PL" do
			expect( "What's with all the %PL?".en.lprintf('mouse') ).
				to eq( "What's with all the mice?" )
		end

	end

	context "workarounds" do

		it "correctly pluralizes 'Secretary' when capitalized, despite the proper-noun exception" do
			expect( 'Secretary'.en.plural ).to eq( 'Secretaries' )
		end

	end

end

