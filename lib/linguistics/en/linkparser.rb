#!/usr/bin/ruby
# 
# This file contains the Linguistics::EN::LinkParser module which enables
# grammatic queries of English language sentences.
# 
# == Authors
# 
# * Martin Chase <stillflame@FaerieMUD.org>
# 
# == Copyright
#
# Copyright (c) 2003 The FaerieMUD Consortium. All rights reserved.
# 
# This module is free software. You may use, modify, and/or redistribute this
# software under the terms of the Perl Artistic License. (See
# http://language.perl.com/misc/Artistic.html)
# 
#  # == Version
#
#  $Id: linkparser.rb,v 1.1 2003/09/11 04:25:23 deveiant Exp $
# 

require 'linguistics/en'

module Linguistics::EN

	@hasLinkParser	= true
	@lpParser		= nil

	begin
		require "linkparser"
		@hasLinkParser = true
	rescue LoadError => err
		@lpError = err
	end


	#################################################################
	###	M O D U L E   M E T H O D S
	#################################################################
	class << self

		### Returns +true+ if LinkParser was loaded okay
		def hasLinkParser? ; @hasLinkParser ; end

		### If #hasLinkParser? returns +false+, this can be called to fetch the
		### exception which was raised when trying to load LinkParser.
		def lpError ; @lpError ; end

		### The instance of LinkParser used for all Linguistics LinkParser
		### functions.
		def linkParser
			if @lpError
				raise NotImplementedError, 
					"LinkParser functions are not loaded: %s" %
					@lpError.message
			end

			return @lpParser if ! @lpParser.nil?

			LinkParser::Word::extend( Linguistics )
			Linguistics::installDelegatorProxy( LinkParser::Word, :en )

			dictOpts = Hash.new('')
			dictOpts['datadir'] = '/usr/lib/ruby/site_ruby/1.8/linkparser/data'
			dictOpts['dict'] = 'tiny.dict'
			parseOpts = Hash.new

			@lpParser = LinkParser.new( dictOpts, parseOpts )
		end
	end


	#################################################################
	###	L I N K P A R S E R   I N T E R F A C E
	#################################################################

	###############
	module_function
	###############

	### Return a LinkParser::Sentence, with or without a sentence in it.
	def linkParse( sent )
		begin
			lp = Linguistics::EN::linkParser.parse( sent.to_s )
		rescue LinkParser::ParseError => e
			lp = LinkParser::Sentence.new
			lp.names = sent.split
		end
		return lp
	end
	alias_method :sentence, :linkParse
	module_function :sentence

end
