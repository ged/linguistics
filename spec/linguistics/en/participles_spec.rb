#!/usr/bin/env rspec -cfd

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
require 'linguistics/en/participles'


describe Linguistics::EN::Participles do

	before( :all ) do
		setup_logging( :fatal )
		Linguistics.use( :en )
	end

	after( :all ) do
		reset_logging()
	end


	it "returns 'seeing' as the present participle for 'sees'" do
		"sees".en.present_participle.should == 'seeing'
	end

	it "returns 'eating' as the present participle for 'eats'" do
		"eats".en.present_participle.should == 'eating'
	end

	it "returns 'batting' as the present participle for 'bats'" do
		"bats".en.present_participle.should == 'batting'
	end

	it "returns 'hating' as the present participle for 'hates'" do
		"hates".en.present_participle.should == 'hating'
	end

	it "returns 'spying' as the present participle for 'spies'" do
		"spies".en.present_participle.should == 'spying'
	end


end

