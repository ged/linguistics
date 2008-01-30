#!/usr/bin/env spec -cfs

BEGIN {
	require 'pathname'
	basedir = Pathname.new( __FILE__ ).dirname.parent

	libdir = basedir + "lib"

	$LOAD_PATH.unshift( libdir ) unless $LOAD_PATH.include?( libdir )
}

begin
	require 'spec/runner'
	require 'linguistics'
rescue LoadError
	unless Object.const_defined?( :Gem )
		require 'rubygems'
		retry
	end
	raise
end


describe Linguistics do

	TestArray = %w{stone stick hammer stone lantern}
	TestString = "banner"
	TestNumber = 5

	before( :all ) do
		Linguistics.use( :en )
	end


	it "loads a language's linguistic functions via variants of its ISO639 code" do

		[:en, :EN, 'en', 'EN', 'En', 'eN'].each do |code|
			res = Linguistics.use( code )
			res.should have(3).members
			res.should include(Array)
			res.should include(String)
			res.should include(Numeric)
		end
	end


	it "raises an error when a language that doesn't exist is requested" do
		[ :zz, :ry, :qi ].each do |code|
			lambda { 
				Linguistics.use( code )
			  }.should raise_error( RuntimeError, /unknown language code/i )
		end
	end
	
	
	it "raises an error for valid languages that don't have any linguistic functions to load" do
		[ :ja, :fr, :es ].each do |code|
			lambda {
				Linguistics.use( code )
			  }.should raise_error( LoadError, /failed to load language extension/i )
		end

	end


	it "adds a method with the same name as the language code to Array that returns an inflector" +
	   " proxy for that language" do
		TestArray.should respond_to( :en )
		TestArray.en.should be_a_kind_of( Linguistics::LanguageProxyClass )
	end
	
	
	it "adds a method with the same name as the language code to String that returns an inflector" +
	   " proxy for that language" do
		TestString.should respond_to( :en )
		TestString.en.should be_a_kind_of( Linguistics::LanguageProxyClass )
	end
	
	
	it "adds a method with the same name as the language code to Numeric that returns an inflector" +
	   " proxy for that language" do
		TestNumber.should respond_to( :en )
		TestNumber.en.should be_a_kind_of( Linguistics::LanguageProxyClass )
	end
	
	
	it "allows one to extend an additional class by passing it in the ':classes' argument to ::use" do
		Linguistics.use( :en, :classes => Symbol )
		:foo.should respond_to( :en )
		:foo.en.should be_a_kind_of( Linguistics::LanguageProxyClass )
	end
	

	it "allows one to extend multiple additional classes by passing them in an Array in the "+
	   " ':classes' argument to ::use" do
		Linguistics.use( :en, :classes => [IO, Class, Range] )
		$stderr.should respond_to( :en )
		$stderr.en.should be_a_kind_of( Linguistics::LanguageProxyClass )

		Object.should respond_to( :en )
		Object.en.should be_a_kind_of( Linguistics::LanguageProxyClass )

		(0..155).should respond_to( :en )
		(0..155).en.should be_a_kind_of( Linguistics::LanguageProxyClass )
	end
	
end
