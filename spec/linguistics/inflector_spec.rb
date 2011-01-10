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
require 'linguistics/inflector'


describe Linguistics::Inflector do

	before( :all ) do
		setup_logging( :fatal )
	end

	after( :all ) do
		reset_logging()
	end


	it "provides a human-readable representation of the object suitable for debugging" do
		obj = Object.new
		result = Linguistics::Inflector.new( :en, obj ).inspect

		result.should include( (obj.object_id / 2).to_s(16) )
		result.should =~ /english-language/i
	end

end

