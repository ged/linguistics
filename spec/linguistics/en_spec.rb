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

end

