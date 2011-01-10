#!/usr/bin/env spec -cfs
#encoding: utf-8

BEGIN {
	require 'pathname'
	basedir = Pathname.new( __FILE__ ).dirname.parent.parent

	libdir = basedir + "lib"

	$LOAD_PATH.unshift( basedir.to_s ) unless $LOAD_PATH.include?( basedir.to_s )
	$LOAD_PATH.unshift( libdir.to_s ) unless $LOAD_PATH.include?( libdir.to_s )
}

require 'rspec'
require 'spec/lib/helpers'

require 'linguistics'
require 'linguistics/iso639'


describe Linguistics::ISO639 do

	# eng||en|English|anglais
	it "loads simple language codes from its __DATA__ section" do
		Linguistics::LANGUAGE_CODES.should have_key( :en )
		Linguistics::LANGUAGE_CODES[ :en ].should have(3).members

		Linguistics::LANGUAGE_CODES[ :en ].should have_key( :codes )
		Linguistics::LANGUAGE_CODES[ :en ][:codes].should have(2).members
		Linguistics::LANGUAGE_CODES[ :en ][:codes].should include("en", "eng")

		Linguistics::LANGUAGE_CODES[ :en ].should have_key( :eng_name )
		Linguistics::LANGUAGE_CODES[ :en ][:eng_name].should == 'English'
		Linguistics::LANGUAGE_CODES[ :en ].should have_key( :fre_name )
		Linguistics::LANGUAGE_CODES[ :en ][:fre_name].should == 'anglais'
	end

	it "loads language codes with variants from its __DATA__ section" do

		# cze|ces|cs|Czech|tchèque
		Linguistics::LANGUAGE_CODES.should have_key( :cs )
		Linguistics::LANGUAGE_CODES[ :cs ].should have(3).members

		Linguistics::LANGUAGE_CODES[ :cs ].should have_key( :codes )
		Linguistics::LANGUAGE_CODES[ :cs ][:codes].should have(3).members
		Linguistics::LANGUAGE_CODES[ :cs ][:codes].should include("cs", "ces", "cze")

		Linguistics::LANGUAGE_CODES[ :cs ].should have_key( :eng_name )
		Linguistics::LANGUAGE_CODES[ :cs ][:eng_name].should == 'Czech'
		Linguistics::LANGUAGE_CODES[ :cs ].should have_key( :fre_name )
		Linguistics::LANGUAGE_CODES[ :cs ][:fre_name].should == 'tchèque'

		# mac|mkd|mk|Macedonian|macédonien
		Linguistics::LANGUAGE_CODES.should have_key( :mk )
		Linguistics::LANGUAGE_CODES[ :mk ].should have( 3 ).members

		Linguistics::LANGUAGE_CODES[ :mk ].should have_key( :codes )
		Linguistics::LANGUAGE_CODES[ :mk ][:codes].should have(3).members
		Linguistics::LANGUAGE_CODES[ :mk ][:codes].should include("mk", "mac", "mkd")

		Linguistics::LANGUAGE_CODES[ :mk ].should have_key( :eng_name )
		Linguistics::LANGUAGE_CODES[ :mk ][:eng_name].should == 'Macedonian'
		Linguistics::LANGUAGE_CODES[ :mk ].should have_key( :fre_name )
		Linguistics::LANGUAGE_CODES[ :mk ][:fre_name].should == 'macédonien'

	end

end
