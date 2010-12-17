#!/usr/bin/env spec -cfs

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
require 'linguistics/en'


describe Linguistics::EN do
	include Linguistics::SpecHelpers

	before( :all ) do
		setup_logging( :fatal )
		Linguistics.use( :en, :proxy => true )
		include Linguistics::EN
	end

	after( :all ) do
		reset_logging()
	end

	it "knows that it's not in 'classical' mode by default" do
		Linguistics::EN.should_not be_classical()
	end

	it "can run a single block in classical mode" do
		Linguistics::EN.in_classical_mode do
			Linguistics::EN.should be_classical()
		end
	end

	it "handles nested classical blocks correctly" do
		Linguistics::EN.in_classical_mode do
			Linguistics::EN.in_classical_mode do
				Linguistics::EN.should be_classical()
			end
			Linguistics::EN.should be_classical()
		end
		Linguistics::EN.should_not be_classical()
	end


	it "provides a sprintf-like function for interpolating variables into a String" do
		"I have %CONJUNCT.".en.lprintf( ["cat", "cat", "dog"] ).
			should == "I have two cats and a dog."
	end


	context "lprintf formatters" do

		before( :all ) do
			@real_formatters = Linguistics::EN.lprintf_formatters
		end

		before( :each ) do
			Linguistics::EN.lprintf_formatters.clear
		end

		after( :all ) do
			Linguistics::EN.lprintf_formatters.replace( @real_formatters )
		end


		it "provides a way to register new lprintf formatters with a Symbol" do
			Linguistics::EN.register_lprintf_formatter :TEST, :plural
			Linguistics::EN.lprintf_formatters.should have( 1 ).member
			Linguistics::EN.lprintf_formatters.should include( :TEST )
			Linguistics::EN.lprintf_formatters[ :TEST ].should be_a( Proc )
		end

	end
end

