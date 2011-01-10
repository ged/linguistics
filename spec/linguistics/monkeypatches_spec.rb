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
require 'linguistics/monkeypatches'


describe Array, "extended with Linguistics::ArrayExtensions" do

	it "can return a copy of itself with a separator between each element" do
		ary = %w[one two three]
		ary.separate( 'and' ).should == [ 'one', 'and', 'two', 'and', 'three' ]
	end

	it "can return a copy of itself with each element separated by the return value of a block" do
		ary = %w[thumpy lippy barky tiger]
		result = ary.separate {|left, right| (left > right) ? '>' : '<' }
		result.should == [ 'thumpy', '>', 'lippy', '>', 'barky', '<', 'tiger' ]
	end

	it "provides a mutator variant of #separate" do
		ary = %w[one two three]
		result = ary.separate!( nil )
		result.should equal( ary )
		result.should == [ 'one', nil, 'two', nil, 'three' ]
	end

end