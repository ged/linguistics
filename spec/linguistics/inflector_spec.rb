#!/usr/bin/env spec -cfs

require_relative '../helpers'

require 'rspec'

require 'linguistics'
require 'linguistics/inflector'


describe Linguistics::Inflector do

	it "provides a human-readable representation of the object suitable for debugging" do
		obj = Object.new
		result = Linguistics::Inflector.new( :en, obj ).inspect

		expect( result ).to include( (obj.object_id / 2).to_s(16) )
		expect( result ).to match( /english-language/i )
	end

end

