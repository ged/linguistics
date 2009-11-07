#!/usr/bin/env spec -cfs

BEGIN {
	require 'pathname'
	basedir = Pathname.new( __FILE__ ).dirname.parent.parent

	libdir = basedir + "lib"

	$LOAD_PATH.unshift( libdir ) unless $LOAD_PATH.include?( libdir )
}

require 'spec'
require 'linguistics'
require 'linguistics/en'


describe Linguistics::EN do

	before( :all ) do
		Linguistics.use( :en, :proxy => true )
		include Linguistics::EN
	end


end

