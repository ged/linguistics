#!/usr/bin/env spec -cfs

BEGIN {
	require 'pathname'
	basedir = Pathname.new( __FILE__ ).dirname.parent.parent

	libdir = basedir + "lib"

	$LOAD_PATH.unshift( libdir ) unless $LOAD_PATH.include?( libdir )
}

require 'spec'
require 'linguistics/iso639'


describe Linguistics, " language codes" do

	it "loads simple language codes from its __DATA__ section" do
		Linguistics::LANGUAGE_CODES.should have_key( "en" )
		Linguistics::LANGUAGE_CODES[ "en" ].should have(2).members

		Linguistics::LANGUAGE_CODES[ "en" ].should have_key( :codes )
		Linguistics::LANGUAGE_CODES[ "en" ][:codes].should have(2).members
		Linguistics::LANGUAGE_CODES[ "en" ][:codes].should include("en")
		Linguistics::LANGUAGE_CODES[ "en" ][:codes].should include("eng")

		Linguistics::LANGUAGE_CODES[ "en" ].should have_key( :desc )
		Linguistics::LANGUAGE_CODES[ "en" ][:desc].should == 'English'
	end

	it "loads language codes with variants from its __DATA__ section" do

		# ces/cze  cs    Czech
		Linguistics::LANGUAGE_CODES.should have_key( "cs" )
		Linguistics::LANGUAGE_CODES[ "cs" ].should have(2).members

		Linguistics::LANGUAGE_CODES[ "cs" ].should have_key( :codes )
		Linguistics::LANGUAGE_CODES[ "cs" ][:codes].should have(3).members
		Linguistics::LANGUAGE_CODES[ "cs" ][:codes].should include("cs")
		Linguistics::LANGUAGE_CODES[ "cs" ][:codes].should include("ces")
		Linguistics::LANGUAGE_CODES[ "cs" ][:codes].should include("cze")

		Linguistics::LANGUAGE_CODES[ "cs" ].should have_key( :desc )
		Linguistics::LANGUAGE_CODES[ "cs" ][:desc].should == 'Czech'

		# jav/jaw  jv/jw Javanese
		Linguistics::LANGUAGE_CODES.should have_key( "jv" )
		Linguistics::LANGUAGE_CODES.should have_key( "jw" )
		Linguistics::LANGUAGE_CODES[ "jv" ].should == Linguistics::LANGUAGE_CODES[ "jw" ]
		Linguistics::LANGUAGE_CODES[ "jv" ].should have(2).members

		Linguistics::LANGUAGE_CODES[ "jv" ].should have_key( :codes )
		Linguistics::LANGUAGE_CODES[ "jv" ][:codes].should have(4).members
		Linguistics::LANGUAGE_CODES[ "jv" ][:codes].should include("jv")
		Linguistics::LANGUAGE_CODES[ "jv" ][:codes].should include("jw")
		Linguistics::LANGUAGE_CODES[ "jv" ][:codes].should include("jav")
		Linguistics::LANGUAGE_CODES[ "jv" ][:codes].should include("jaw")

		Linguistics::LANGUAGE_CODES[ "jv" ].should have_key( :desc )
		Linguistics::LANGUAGE_CODES[ "jv" ][:desc].should == 'Javanese'

	end

end
