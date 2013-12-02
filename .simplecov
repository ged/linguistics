# -*- ruby -*-
#encoding: utf-8

require 'simplecov'

SimpleCov.start do
	add_filter 'spec'
	add_group "Needing tests" do |file|
		file.covered_percent < 90
	end
end

