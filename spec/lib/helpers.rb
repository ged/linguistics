#!/usr/bin/ruby
# coding: utf-8

BEGIN {
	require 'pathname'
	basedir = Pathname.new( __FILE__ ).dirname.parent

	libdir = basedir + "lib"

	$LOAD_PATH.unshift( libdir.to_s ) unless $LOAD_PATH.include?( libdir.to_s )
}

require 'linguistics'

require 'rspec'
require 'spec/lib/constants'
require 'loggability/spechelpers'


### Mock with RSpec
RSpec.configure do |c|
	c.mock_with( :rspec )
	c.include( Loggability::SpecHelpers )
end

# vim: set nosta noet ts=4 sw=4:

