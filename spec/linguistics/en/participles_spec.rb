#!/usr/bin/env rspec -cfd

require_relative '../../helpers'

require 'rspec'

require 'linguistics'
require 'linguistics/en'
require 'linguistics/en/participles'


describe Linguistics::EN::Participles do

	before( :all ) do
		Linguistics.use( :en )
	end


	it "returns 'seeing' as the present participle for 'sees'" do
		expect( "sees".en.present_participle ).to eq( 'seeing' )
	end

	it "returns 'eating' as the present participle for 'eats'" do
		expect( "eats".en.present_participle ).to eq( 'eating' )
	end

	it "returns 'batting' as the present participle for 'bats'" do
		expect( "bats".en.present_participle ).to eq( 'batting' )
	end

	it "returns 'hating' as the present participle for 'hates'" do
		expect( "hates".en.present_participle ).to eq( 'hating' )
	end

	it "returns 'spying' as the present participle for 'spies'" do
		expect( "spies".en.present_participle ).to eq( 'spying' )
	end


end

