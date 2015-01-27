#!/usr/bin/env spec -cfs
#encoding: utf-8

require_relative '../helpers'

require 'rspec'

require 'linguistics'
require 'linguistics/iso639'


describe Linguistics::ISO639 do

	# eng||en|English|anglais
	it "loads simple language codes from its __DATA__ section" do
		expect( Linguistics::LANGUAGE_CODES ).to have_key( :en )
		expect( Linguistics::LANGUAGE_CODES[:en].size ).to eq( 3 )

		expect( Linguistics::LANGUAGE_CODES[:en] ).to have_key( :codes )
		expect( Linguistics::LANGUAGE_CODES[:en][:codes].size ).to eq( 2 )
		expect( Linguistics::LANGUAGE_CODES[:en][:codes] ).to include("en", "eng")

		expect( Linguistics::LANGUAGE_CODES[:en] ).to have_key( :eng_name )
		expect( Linguistics::LANGUAGE_CODES[:en][:eng_name] ).to eq( 'English' )
		expect( Linguistics::LANGUAGE_CODES[:en] ).to have_key( :fre_name )
		expect( Linguistics::LANGUAGE_CODES[:en][:fre_name] ).to eq( 'anglais' )
	end

	it "loads language codes with variants from its __DATA__ section" do

		# cze|ces|cs|Czech|tchèque
		expect( Linguistics::LANGUAGE_CODES ).to have_key( :cs )
		expect( Linguistics::LANGUAGE_CODES[:cs].size ).to eq( 3 )

		expect( Linguistics::LANGUAGE_CODES[:cs] ).to have_key( :codes )
		expect( Linguistics::LANGUAGE_CODES[:cs][:codes].size ).to eq( 3 )
		expect( Linguistics::LANGUAGE_CODES[:cs][:codes] ).to include("cs", "ces", "cze")

		expect( Linguistics::LANGUAGE_CODES[:cs] ).to have_key( :eng_name )
		expect( Linguistics::LANGUAGE_CODES[:cs][:eng_name] ).to eq( 'Czech' )
		expect( Linguistics::LANGUAGE_CODES[:cs] ).to have_key( :fre_name )
		expect( Linguistics::LANGUAGE_CODES[:cs][:fre_name] ).to eq( 'tchèque' )

		# mac|mkd|mk|Macedonian|macédonien
		expect( Linguistics::LANGUAGE_CODES ).to have_key( :mk )
		expect( Linguistics::LANGUAGE_CODES[:mk].size ).to eq( 3 )

		expect( Linguistics::LANGUAGE_CODES[:mk] ).to have_key( :codes )
		expect( Linguistics::LANGUAGE_CODES[:mk][:codes].size ).to eq( 3 )
		expect( Linguistics::LANGUAGE_CODES[:mk][:codes] ).to include("mk", "mac", "mkd")

		expect( Linguistics::LANGUAGE_CODES[:mk] ).to have_key( :eng_name )
		expect( Linguistics::LANGUAGE_CODES[:mk][:eng_name] ).to eq( 'Macedonian' )
		expect( Linguistics::LANGUAGE_CODES[:mk] ).to have_key( :fre_name )
		expect( Linguistics::LANGUAGE_CODES[:mk][:fre_name] ).to eq( 'macédonien' )

	end

end
