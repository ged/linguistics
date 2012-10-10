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
require 'linguistics/en'
require 'linguistics/en/stemmer'


describe Linguistics::EN::Stemmer do

	before( :all ) do
		setup_logging()
		Linguistics.use( :en )
	end

	after( :all ) do
		reset_logging()
	end


	it "adds EN::Stemmer to the list of English language modules" do
		Linguistics::EN::MODULES.include?( Linguistics::EN::Stemmer )
	end


	describe "on a system that has the 'ruby-stemmer' library installed" do

		before( :each ) do
			pending "installation of the ruby-stemmer library" unless
				Linguistics::EN.has_stemmer?
		end

		it "can fetch the stem of a word" do
			"communication".en.stem.should == 'communic'
		end

	end


	describe "on a system that doesn't have the 'ruby-stemmer' library" do

		before( :all ) do
			# If the system *does* have stemmer support, pretend it doesn't.
			if Linguistics::EN.has_stemmer?
				error = LoadError.new( "simulated exception: no such file to load -- lingua/stemmer" )
				Linguistics::EN::Stemmer.instance_variable_set( :@has_stemmer, false )
				Linguistics::EN::Stemmer.instance_variable_set( :@stemmer_error, error )
			end
		end

		it "raises an NotImplementedError when you try to use stemmer functionality" do
			expect {
				"communication".en.stem
			}.to raise_error( LoadError, %r{lingua/stemmer}i )
		end

	end

end

