#!/usr/bin/ruby
# 
# This file contains the extensions to the Linguistics::EN module which provide
# support for the Ruby LinkParser module. LinkParser enables grammatic queries
# of English language sentences.
#
# == Synopsis
#
#   # Test to see whether or not the link parser is loaded.
#   Linguistics::EN.has_link_parser?
#   # => true
# 
#   # Diagram the first linkage for a test sentence
#   puts "he is a big dog".sentence.linkages.first.to_s
# 	  +---O*---+ 
# 	  | +--Ds--+ 
#    +Ss+ |  +-A-+ 
#    |  | |  |   | 
#   he is a big dog
# 
#   # Find the verb in the sentence
#   "he is a big dog".en.sentence.verb.to_s      
#   # => "is"
# 
#   # Combined infinitive + LinkParser: Find the infinitive form of the verb of the
#   given sentence.
#   "he is a big dog".en.sentence.verb.infinitive
#   # => "be"
# 
#   # Find the direct object of the sentence
#   "he is a big dog".en.sentence.object.to_s
#   # => "dog"
# 
#   # Look at the raw LinkParser::Word for the direct object of the sentence.
#   "he is a big dog".en.sentence.object     
#   # => #<LinkParser::Word:0x403da0a0 @definition=[[{@A-}, Ds-, {@M+}, J-], [{@A-},
#   Ds-, {@M+}, Os-], [{@A-}, Ds-, {@M+}, Ss+, {@CO-}, {C-}], [{@A-}, Ds-, {@M+},
#   Ss+, R-], [{@A-}, Ds-, {@M+}, SIs-], [{@A-}, Ds-, {R+}, {Bs+}, J-], [{@A-}, Ds-,
#   {R+}, {Bs+}, Os-], [{@A-}, Ds-, {R+}, {Bs+}, Ss+, {@CO-}, {C-}], [{@A-}, Ds-,
#   {R+}, {Bs+}, Ss+, R-], [{@A-}, Ds-, {R+}, {Bs+}, SIs-]], @right=[], @suffix="",
#   @left=[#<LinkParser::Connection:0x403da028 @rword=#<LinkParser::Word:0x403da0a0
#   ...>, @lword=#<LinkParser::Word:0x403da0b4 @definition=[[Ss-, O+, {@MV+}], [Ss-,
#   B-, {@MV+}], [Ss-, P+], [Ss-, AF-], [RS-, Bs-, O+, {@MV+}], [RS-, Bs-, B-,
#   {@MV+}], [RS-, Bs-, P+], [RS-, Bs-, AF-], [{Q-}, SIs+, O+, {@MV+}], [{Q-}, SIs+,
#   B-, {@MV+}], [{Q-}, SIs+, P+], [{Q-}, SIs+, AF-]],
#   @right=[#<LinkParser::Connection:0x403da028 ...>], @suffix="", @left=[],
#   @name="is", @position=1>, @subName="*", @name="O", @length=3>], @name="dog",
#   @position=4>
# 
#   # Combine WordNet + LinkParser to find the definition of the direct object of
#   # the sentence
#   "he is a big dog".en.sentence.object.gloss
#   # => "a member of the genus Canis (probably descended from the common wolf) that
#   has been domesticated by man since prehistoric times; occurs in many breeds;
#   \"the dog barked all night\""
# 
# == Authors
# 
# * Martin Chase <stillflame@FaerieMUD.org>
# * Michael Granger <ged@FaerieMUD.org>
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
#  $Id: linkparser.rb,v 1.4 2003/09/14 11:15:33 deveiant Exp $
# 

require 'linguistics/en'

module Linguistics::EN

	@hasLinkParser	= false
	@lpParser		= nil
	@lpError		= nil

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
		return Linguistics::EN::linkParser.parse( sent.to_s )
	end
	alias_method :sentence, :linkParse
	module_function :sentence

end
