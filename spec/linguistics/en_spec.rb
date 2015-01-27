#!/usr/bin/env spec -cfs

require_relative '../helpers'

require 'rspec'

require 'linguistics'
require 'linguistics/en'
require 'linguistics/languagebehavior'


describe Linguistics::EN do

	before( :all ) do
		Linguistics.use( :en, :proxy => true )
		include Linguistics::EN
	end


	it_behaves_like "a Linguistics language module"


	it "provides a predicate for testing for the presence of modules by name" do
		expect( Linguistics::EN ).to_not have_extension( 'nonexistant' )
		expect( Linguistics::EN ).to have_extension( 'articles' )
	end

	it "knows that it's not in 'classical' mode by default" do
		expect( Linguistics::EN ).to_not be_classical()
	end

	it "can run a single block in classical mode" do
		Linguistics::EN.in_classical_mode do
			expect( Linguistics::EN ).to be_classical()
		end
	end

	it "handles nested classical blocks correctly" do
		Linguistics::EN.in_classical_mode do
			Linguistics::EN.in_classical_mode do
				expect( Linguistics::EN ).to be_classical()
			end
			expect( Linguistics::EN ).to be_classical()
		end
		expect( Linguistics::EN ).to_not be_classical()
	end


	it "provides a sprintf-like function for interpolating variables into a String" do
		expect( "I have %CONJUNCT.".en.lprintf(["cat", "cat", "dog"]) ).
			to eq( "I have two cats and a dog." )
	end


	context "lprintf formatters" do

		before( :all ) do
			@real_formatters = Linguistics::EN.lprintf_formatters.dup
		end

		before( :each ) do
			Linguistics::EN.lprintf_formatters.clear
		end

		after( :all ) do
			Linguistics::EN.lprintf_formatters.replace( @real_formatters )
		end


		it "provides a way to register new lprintf formatters with a Symbol" do
			Linguistics::EN.register_lprintf_formatter :TEST, :plural
			expect( Linguistics::EN.lprintf_formatters.size ).to eq( 1 )
			expect( Linguistics::EN.lprintf_formatters ).to include( :TEST )
			expect( Linguistics::EN.lprintf_formatters[:TEST] ).to be_a( Proc )
		end

	end
end

