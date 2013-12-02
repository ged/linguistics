#!/usr/bin/env spec -cfs

require_relative '../helpers'

require 'rspec'

require 'linguistics'
require 'linguistics/monkeypatches'


describe Array, "extended with Linguistics::ArrayExtensions" do

	it "can return a copy of itself with a separator between each element" do
		ary = %w[one two three]
		expect( ary.separate( 'and' ) ).to eq([ 'one', 'and', 'two', 'and', 'three' ])
	end

	it "can return a copy of itself with each element separated by the return value of a block" do
		ary = %w[thumpy lippy barky tiger]
		result = ary.separate {|left, right| (left > right) ? '>' : '<' }
		expect( result ).to eq([ 'thumpy', '>', 'lippy', '>', 'barky', '<', 'tiger' ])
	end

	it "provides a mutator variant of #separate" do
		ary = %w[one two three]
		result = ary.separate!( nil )
		expect( result ).to equal( ary )
		expect( result ).to eq([ 'one', nil, 'two', nil, 'three' ])
	end

end