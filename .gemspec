#!/usr/bin/ruby
#
# Linguistics RubyGems specification
# $Id$
#

require 'rubygems'
require './utils.rb'
include UtilityFunctions

spec = Gem::Specification.new do |s|
	s.name = 'Linguistics'
	s.version = "1.0.3"
	s.platform = Gem::Platform::RUBY
	s.summary = "A generic, language-neutral framework for extending Ruby " +
		"objects with linguistic methods."
	s.files = getVettedManifest()
	s.require_path = 'lib'
	s.autorequire = 'linguistics'
	s.author = "Michael Granger, Martin Chase"
	s.email = "ged@FaerieMUD.org, stillflame@FaerieMUD.org"
	s.homepage = "http://www.deveiate.org/projects/Linguistics/"
end

if $0==__FILE__
	p spec
	Gem::manage_gems
	Gem::Builder.new(spec).build
end


$:.unshift '../lib'
require 'rubygems'


