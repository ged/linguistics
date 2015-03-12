#!/usr/bin/env ruby

require 'rspec'

require 'linguistics'
require 'linguistics/iso639'


# This is a RSpec 2 shared behavior for language plugins. You can use this to be
# sure that your language plugin conforms to the API expected by Linguistics. You'll
# probably want to use it something like this:
#
#    require 'linguistics/languagebehavior'
#
#    describe Linguistics::KL do
#
#      it_should_behave_like "A Linguistics language module"
#
#      # ... any other specs for your module
#
#    end

shared_examples_for "a Linguistics language module" do

	let( :language_module ) do
		described_class
	end


	it "registers itself with the Linguistics module when required" do
		expect( Linguistics.languages.values ).to include( language_module )
	end

end


