#!/usr/bin/env spec -cfs

BEGIN {
	require 'pathname'
	basedir = Pathname.new( __FILE__ ).dirname.parent.parent

	libdir = basedir + "lib"

	$LOAD_PATH.unshift( libdir ) unless $LOAD_PATH.include?( libdir )
}

begin
	require 'spec/runner'
	require 'linguistics/iso639'
rescue LoadError
	unless Object.const_defined?( :Gem )
		require 'rubygems'
		retry
	end
	raise
end


describe Linguistics, " language codes" do

	it "loads simple language codes from its __DATA__ section" do
		Linguistics::LanguageCodes.should have_key( "en" )
		Linguistics::LanguageCodes[ "en" ].should have(2).members

		Linguistics::LanguageCodes[ "en" ].should have_key( :codes )
		Linguistics::LanguageCodes[ "en" ][:codes].should have(2).members
		Linguistics::LanguageCodes[ "en" ][:codes].should include("en")
		Linguistics::LanguageCodes[ "en" ][:codes].should include("eng")
		
		Linguistics::LanguageCodes[ "en" ].should have_key( :desc )
		Linguistics::LanguageCodes[ "en" ][:desc].should == 'English'
	end
	
	it "loads language codes with variants from its __DATA__ section" do

		# ces/cze  cs    Czech
		Linguistics::LanguageCodes.should have_key( "cs" )
		Linguistics::LanguageCodes[ "cs" ].should have(2).members

		Linguistics::LanguageCodes[ "cs" ].should have_key( :codes )
		Linguistics::LanguageCodes[ "cs" ][:codes].should have(3).members
		Linguistics::LanguageCodes[ "cs" ][:codes].should include("cs")
		Linguistics::LanguageCodes[ "cs" ][:codes].should include("ces")
		Linguistics::LanguageCodes[ "cs" ][:codes].should include("cze")
		
		Linguistics::LanguageCodes[ "cs" ].should have_key( :desc )
		Linguistics::LanguageCodes[ "cs" ][:desc].should == 'Czech'
		
		# jav/jaw  jv/jw Javanese
		Linguistics::LanguageCodes.should have_key( "jv" )
		Linguistics::LanguageCodes.should have_key( "jw" )
		Linguistics::LanguageCodes[ "jv" ].should == Linguistics::LanguageCodes[ "jw" ]
		Linguistics::LanguageCodes[ "jv" ].should have(2).members

		Linguistics::LanguageCodes[ "jv" ].should have_key( :codes )
		Linguistics::LanguageCodes[ "jv" ][:codes].should have(4).members
		Linguistics::LanguageCodes[ "jv" ][:codes].should include("jv")
		Linguistics::LanguageCodes[ "jv" ][:codes].should include("jw")
		Linguistics::LanguageCodes[ "jv" ][:codes].should include("jav")
		Linguistics::LanguageCodes[ "jv" ][:codes].should include("jaw")

		Linguistics::LanguageCodes[ "jv" ].should have_key( :desc )
		Linguistics::LanguageCodes[ "jv" ][:desc].should == 'Javanese'
		
	end
	
end
