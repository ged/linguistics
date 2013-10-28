#!/usr/bin/ruby

require 'loggability'
require 'linguistics/en' unless defined?( Linguistics::EN )

# This file contains functions for conjugating verbs.
#
# == Version
#
#  $Id$
#
# == Authors
#
# * Robert Berry <berrydigital@gmail.com>
# * Michael Granger <ged@FaerieMUD.org>
#
# == Copyright
#
# Based on MorphAdorner (http://morphadorner.northwestern.edu/), which is
# licensed under the following terms:
#
# Copyright © 2006-2009 by Northwestern University. All rights reserved.
#
# Developed by:
# Academic and Research Technologies
# Northwestern University
# http://www.it.northwestern.edu/about/departments/at/
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# with the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
#   Redistributions of source code must retain the above copyright notice,
#   this list of conditions and the following disclaimers.
#
#   Redistributions in binary form must reproduce the above copyright notice,
#   this list of conditions and the following disclaimers in the documentation
#   and/or other materials provided with the distribution.
#
#   Neither the names of Academic and Research Technologies, Northwestern
#   University, nor the names of its contributors may be used to endorse or
#   promote products derived from this Software without specific prior written
#   permission.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# CONTRIBUTORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS WITH
# THE SOFTWARE.
#
module Linguistics::EN::Conjugation
	extend Loggability

	# Use the Linguistics module's logger
	log_to :linguistics


	# Hash of irregular verb infinitives, read from the DATA section of the file
	IRREGULAR_VERBS = {} # :nodoc:

	# Array of doubling verbs, read from the DATA section of the file
	DOUBLING_VERBS = [] # :nodoc:


	### Return the past tense of the word
	def past_tense( person=nil )
		return self.conjugate( :past, person )
	end


	### Return the past participle of the word
	def past_participle( person=nil )
		return self.conjugate( :past_participle, person )
	end


	### Return the present tense of the word
	def present_tense( person=nil )
		return self.conjugate( :present, person )
	end


	### Return the present participle of the word
	def present_participle( person=nil )
		return self.conjugate( :present_participle, person )
	end



	### Conjugate the receiving string as an infinitive with the specified +tense+
	### and +person+.
	def conjugate( tense, person=nil )
		self.log.debug "Conjugating %p in %s tense, %s person" %
			[ self.to_s, tense, person || "any" ]
		person ||= :*
		verb = self.to_s.downcase

		if result = get_irregular( verb, person, tense )
			self.log.debug "  verb %p is irregular: %p" % [ verb, result ]
			return result
		end

		self.log.debug "  regular verb: conjugating by tense"
		return case tense
			when :present
				conjugate_present( verb, person )
			when :present_participle
				conjugate_present_participle( verb )
			when :past
				conjugate_past( verb )
			when :past_participle
				conjugate_past_participle( verb )
			else
				verb
			end
	end


	#######
	private
	#######

	### Conjugate the specified +verb+ in the present tense in the given +person+. The
	### only +person+ that is
	def conjugate_present( verb, person=:third_person_singular )
		return verb unless person == :third_person_singular

		case verb
		when /(ch|s|sh|x|z)$/
			return verb + 'es'
		when /(ay|ey|oy|uy)$/
			return verb + 's'
		when /[^aeiou]y$/
			return verb[ 0..-2 ] + 'ies'
		else
			return verb + 's'
		end
	end


	### Convugate the given +verb+ as a present participle.
	def conjugate_present_participle( verb )
		case verb
		when /[^aeiou]e$/
			return verb[ 0..-2 ]
		when /ie$/
			return verb[ 0..-3 ] + 'y'
		when /[aou]e$/
			return verb[ 0..-2 ]
		else
			if DOUBLING_VERBS.include?( verb )
				return verb + verb[ -1 ] + 'ing'
			else
				return verb + 'ing'
			end
		end
	end


	### Conjugate the specified verb in the past tense; also used to conjugate the
	### past participle.
	def conjugate_past( verb )
		case verb
		when /e$/
			return verb + 'd'
		when /[^aeiou]y$/
			return verb[ 0..-1 ] + 'ied'
		else
			if DOUBLING_VERBS.include?( verb )
				verb = verb + verb[ -1 ] + 'ed'
			else
				return verb + 'ed'
			end
		end
	end
	alias_method :conjugate_past_participle, :conjugate_past


	#### If the given +verb+ is irregular in the given +person_ and
	def get_irregular( verb, person, tense )
		self.log.debug "  looking for irregular verb: %p, %p person, %p tense" %
			[ verb, person, tense ]

		irregular = IRREGULAR_VERBS[ verb ] or return nil
		self.log.debug "    %p is irregular: %p, selecting %p person" %
			[ verb, irregular, person ]
		irrperson = irregular[ person ] || irregular[ :* ] or return nil
		self.log.debug "    selected %p. Using %p tense: %p" %
			[ irrperson, tense, irrperson[tense] ]
		return irrperson[ tense ]
	end


	######
	public
	######

	### Inclusion hook -- load the verb data when the module is first included.
	def self::included( mod ) # :nodoc:
		if IRREGULAR_VERBS.empty?
			self.log.debug "Loading conjunctions data."
			data = File.read( __FILE__ ).split( /^__END__$/ ).last
			irrverb_data, doublverb_data = data.split( /^#\n# Doubling Verbs.*\n#\n/, 2 )
			IRREGULAR_VERBS.replace( self.load_irregular_verbs(irrverb_data) )
			self.log.debug "  loaded %d irregular verbs" % [ IRREGULAR_VERBS.length ]

			DOUBLING_VERBS.replace( self.load_doubling_verbs(doublverb_data) )
			self.log.debug "  loaded %d doubling verbs" % [ DOUBLING_VERBS.length ]
		end

		super
	end


	### Parse irregular verbs from the given +data+, and return the resulting Hash.
	def self::load_irregular_verbs( data )
		self.log.debug "  loading irregular verbs from %d bytes of data." % [ data.length ]
		results = {}

		data.each_line do |line|
			if line =~ /^(#|\s*$)/ # Skip comments and blank lines
				# self.log.debug "  skipping line: %p" % [ line ]
				next
			end

			infinitive, person, tense, conjugation = line.chomp.split( /\s+/, 4 )
			# self.log.debug "  line split into: %p" %
			#	[[ infinitive, person, tense, conjugation ]]

			raise "malformed line: %p" % [ line ] unless infinitive && person && tense && conjugation

			results[ infinitive ] ||= {}
			results[ infinitive ][ person.to_sym ] ||= {}
			results[ infinitive ][ person.to_sym ][ tense.to_sym ] = conjugation
		end

		self.log.debug "  %d infinitives loaded." % [ results.length ]
		return results
	end


	### Load the doubling verbs from the given +data+ and return the resulting Array.
	def self::load_doubling_verbs( data )
		self.log.debug "  loading doubling verbs."
		results = []

		data.each_line do |line|
			next if line =~ /^(#|\s*$)/ # Skip comments and blank lines
			results << line.chomp
		end

		self.log.debug "  %d doubling verbs loaded." % [ results.length ]
		return results
	end


	# Register this module to the list of modules to include
	Linguistics::EN.register_extension( self )


end # module Linguistics::EN::Conjugation

__END__
#
# Irregular verbs (from MorphAdorner's irregularverbs.txt)
#
arise	*	past	arose
arise	*	past_participle	arisen
awake	*	past	awoke
awake	*	past_participle	awoken
backbite	*	past	backbit
backbite	*	past_participle	backbitten
backslide	*	past	backslid
backslide	*	past_participle	backslid
be	*	past	was
be	*	past	were
be	*	past_participle	been
be	*	past_participle	been
be	*	present	are
be	*	present_participle	being
be	first_person_singular	past	was
be	first_person_singular	present	am
be	third_person_singular	past	was
be	third_person_singular	present	is
bear	*	past	bore
bear	*	past_participle	borne
beat	*	past	beat
beat	*	past_participle	beaten
become	*	past	became
become	*	past_participle	become
befall	*	past	befell
befall	*	past_participle	befallen
beget	*	past	begat
beget	*	past_participle	begot
begin	*	past	began
begin	*	past_participle	begun
bend	*	past	bent
bend	*	past_participle	bent
beset	*	past	beset
beset	*	past_participle	beset
bet	*	past	bet
bet	*	past_participle	bet
betake	*	past	betook
betake	*	past_participle	betaken
bethink	*	past	bethought
bethink	*	past_participle	bethought
bid	*	past	bid|bade
bid	*	past_participle	bid|bidden
bind	*	past	bound
bind	*	past_participle	bound
bite	*	past	bit
bite	*	past_participle	bitten
bleed	*	past	bled
bleed	*	past_participle	bled
blow	*	past	blew
blow	*	past_participle	blown
break	*	past	broke
break	*	past_participle	broken
breed	*	past	bred
breed	*	past_participle	bred
bring	*	past	brought
bring	*	past_participle	brought
broadcast	*	past	broadcast
broadcast	*	past_participle	broadcast
browbeat	*	past	browbeat
browbeat	*	past_participle	browbeaten
build	*	past	built
build	*	past_participle	built
build-up	*	past	built-up
build-up	*	past_participle	built-up
burst	*	past	burst
burst	*	past_participle	burst
buy	*	past	bought
buy	*	past_participle	bought
carry-out	*	past	carried-out
carry-out	*	past_participle	carried-out
cast	*	past	cast
cast	*	past_participle	cast
catch	*	past	caught
catch	*	past_participle	caught
choose	*	past	chose
choose	*	past_participle	chosen
cling	*	past	clung
cling	*	past_participle	clung
colorbreed	*	past	colorbred
colorbreed	*	past_participle	colorbred
come	*	past	came
come	*	past_participle	come
cost	*	past	cost
cost	*	past_participle	cost
creep	*	past	crept
creep	*	past_participle	crept
crossbreed	*	past	crossbred
crossbreed	*	past_participle	crossbred
cut	*	past	cut
cut	*	past_participle	cut
deal	*	past	dealt
deal	*	past_participle	dealt
dig	*	past	dug
dig	*	past_participle	dug
dive	*	past	dove
dive	*	past_participle	dived
do	*	past	did
do	*	past_participle	done
do	third_person_singular	present	does
draw	*	past	drew
draw	*	past_participle	drawn
drink	*	past	drank
drink	*	past_participle	drunk
drive	*	past	drove
drive	*	past_participle	driven
dye	*	present_participle	dyeing
eat	*	past	ate
eat	*	past_participle	eaten
enwind	*	past	enwound
enwind	*	past_participle	enwound
eye	*	present_participle	eyeing
fall	*	past	fell
fall	*	past_participle	fallen
fast-wind	*	past	fast-wound
fast-wind	*	past_participle	fast-wound
feed	*	past	fed
feed	*	past_participle	fed
feel	*	past	felt
feel	*	past_participle	felt
fight	*	past	fought
fight	*	past_participle	fought
find	*	past	found
find	*	past_participle	found
fit	*	past	fit
fit	*	past_participle	fit
fit-out	*	past	fitted-out
fit-out	*	past_participle	fitted-out
flee	*	past	fled
flee	*	past_participle	fled
fling	*	past	flung
fling	*	past_participle	flung
fly	*	past	flew
fly	*	past_participle	flown
forbear	*	past	forbore
forbear	*	past_participle	forborne
forbid	*	past	forbade
forbid	*	past_participle	forbidden
forecast	*	past	forecast
forecast	*	past_participle	forecast
forego	*	past	forewent
forego	*	past_participle	foregone
foreknow	*	past	foreknew
foreknow	*	past_participle	foreknown
forerun	*	past	foreran
forerun	*	past_participle	forerun
forespeak	*	past	forespoke
forespeak	*	past_participle	forespoken
foreswear	*	past	foreswore
foreswear	*	past_participle	foresworn
foretell	*	past	foretold
foretell	*	past_participle	foretold
forget	*	past	forgot
forget	*	past_participle	forgotten
forgive	*	past	forgave
forgive	*	past_participle	forgiven
forsake	*	past	forsook
forsake	*	past_participle	forsaken
forsee	*	past	forsaw
forsee	*	past_participle	forseen
freeze	*	past	froze
freeze	*	past_participle	frozen
gainsay	*	past	gainsaid
gainsay	*	past_participle	gainsaid
get	*	past	got
get	*	past_participle	gotten
give	*	past	gave
give	*	past_participle	given
go	*	past	went
go	*	past_participle	gone
go	third_person_singular	present	goes
grind	*	past	ground
grind	*	past_participle	ground
grow	*	past	grew
grow	*	past_participle	grown
hagride	*	past	hagrode
hagride	*	past_participle	hagridden
half-rise	*	past	half-rose
half-rise	*	past_participle	half-risen
halterbreak	*	past	halterbroke
halterbreak	*	past_participle	halterbroken
hamstring	*	past	hamstrung
hamstring	*	past_participle	hamstrung
hand-feed	*	past	hand-fed
hand-feed	*	past_participle	hand-fed
handwrite	*	past	handwrote
handwrite	*	past_participle	handwritten
hang	*	past	hanged|hung
hang	*	past_participle	hanged|hung
have	*	past	had
have	*	past	had
have	*	past_participle	had
have	*	past_participle	had
have	*	present	have
have	*	present_participle	having
have	third_person_singular	present	has
hear	*	past	heard
hear	*	past_participle	heard
hide	*	past	hid
hide	*	past_participle	hidden
hit	*	past	hit
hit	*	past_participle	hit
hold	*	past	held
hold	*	past_participle	held
hurt	*	past	hurt
hurt	*	past_participle	hurt
inbreed	*	past	inbred
inbreed	*	past_participle	inbred
inbring	*	past	inbrought
inbring	*	past_participle	inbrought
inlay	*	past	inlaid
inlay	*	past_participle	inlaid
inset	*	past	inset
inset	*	past_participle	inset
interbreed	*	past	interbred
interbreed	*	past_participle	interbred
intercut	*	past	intercut
intercut	*	past_participle	intercut
interlay	*	past	interlaid
interlay	*	past_participle	interlaid
interset	*	past	interset
interset	*	past_participle	interset
interweave	*	past	interwove
interweave	*	past_participle	interwoven
interwind	*	past	interwound
interwind	*	past_participle	interwound
inweave	*	past	inwove
inweave	*	past_participle	inwoven
jerry-build	*	past	jerry-built
jerry-build	*	past_participle	jerry-built
keep	*	past	kept
keep	*	past_participle	kept
kick-off	*	past	kicked-off
kick-off	*	past_participle	kicked-off
kick-off	*	present_participle	kicking-off
kneel	*	past	knelt
kneel	*	past_participle	knelt
knit	*	past	knitted
knit	*	past_participle	knitted
knit	*	present_participle	knitting
know	*	past	knew
know	*	past_participle	known
landslide	*	past	landslid
landslide	*	past_participle	landslid
lay	*	past	laid
lay	*	past_participle	laid
lead	*	past	led
lead	*	past_participle	led
leave	*	past	left
leave	*	past_participle	left
lend	*	past	lent
lend	*	past_participle	lent
let	*	past	let
let	*	past_participle	let
lie	*	past	lied|lay
lie	*	past_participle	lied|lain
light	*	past	lit
light	*	past_participle	lit
light-up	*	past	lit-up
light-up	*	past_participle	lit-up
lip-read	*	past	lip-read
lip-read	*	past_participle	lip-read
loop-up	*	past	looped-up
loop-up	*	past_participle	looped-up
lose	*	past	lost
lose	*	past_participle	lost
make	*	past	made
make	*	past_participle	made
make-out	*	past	made-out
make-out	*	past_participle	made-out
make-out	*	present_participle	making-out
mean	*	past	meant
mean	*	past_participle	meant
meet	*	past	met
meet	*	past_participle	met
misbecome	*	past	misbecame
misbecome	*	past_participle	misbecome
miscast	*	past	miscast
miscast	*	past_participle	miscast
miscut	*	past	miscut
miscut	*	past_participle	miscut
misdeal	*	past	misdealt
misdeal	*	past_participle	misdealt
misdo	*	past	misdid
misdo	*	past_participle	misdone
mishear	*	past	misheard
mishear	*	past_participle	misheard
mishit	*	past	mishit
mishit	*	past_participle	mishit
mislay	*	past	mislaid
mislay	*	past_participle	mislaid
mislead	*	past	misled
mislead	*	past_participle	misled
misread	*	past	misread
misread	*	past_participle	misread
missay	*	past	missaid
missay	*	past_participle	missaid
missend	*	past	missent
missend	*	past_participle	missent
misspeak	*	past	misspoke
misspeak	*	past_participle	misspoken
misspend	*	past	misspent
misspend	*	past_participle	misspent
misswear	*	past	misswore
misswear	*	past_participle	missworn
mistake	*	past	mistook
mistake	*	past_participle	mistaken
misteach	*	past	mistaught
misteach	*	past_participle	mistaught
mistell	*	past	mistold
mistell	*	past_participle	mistold
misthink	*	past	misthought
misthink	*	past_participle	misthought
misunderstand	*	past	misunderstood
misunderstand	*	past_participle	misunderstood
miswear	*	past	miswore
miswear	*	past_participle	misworn
miswed	*	past	miswed
miswed	*	past_participle	miswed
miswrite	*	past	miswrote
miswrite	*	past_participle	miswritten
offset	*	past	offset
offset	*	past_participle	offset
outbid	*	past	outbid
outbid	*	past_participle	outbid
outbreed	*	past	outbred
outbreed	*	past_participle	outbred
outdo	*	past	outdid
outdo	*	past_participle	outdone
outdo	third_person_singular	present	outdoes
outdraw	*	past	outdrew
outdraw	*	past_participle	outdrawn
outdrink	*	past	outdrank
outdrink	*	past_participle	outdrunk
outdrive	*	past	outdrove
outdrive	*	past_participle	outdriven
outfight	*	past	outfought
outfight	*	past_participle	outfought
outfly	*	past	outflew
outfly	*	past_participle	outflown
outgrow	*	past	outgrew
outgrow	*	past_participle	outgrown
outlay	*	past	outlaid
outlay	*	past_participle	outlaid
outride	*	past	outrode
outride	*	past_participle	outridden
outrun	*	past	outran
outrun	*	past_participle	outrun
outsee	*	past	outsaw
outsee	*	past_participle	outseen
outsell	*	past	outsold
outsell	*	past_participle	outsold
outshoot	*	past	outshot
outshoot	*	past_participle	outshot
outsing	*	past	outsang
outsing	*	past_participle	outsung
outsit	*	past	outsat
outsit	*	past_participle	outsat
outsleep	*	past	outslept
outsleep	*	past_participle	outslept
outspeak	*	past	outspoke
outspeak	*	past_participle	outspoken
outspeed	*	past	outsped
outspeed	*	past_participle	outsped
outspend	*	past	outspent
outspend	*	past_participle	outspent
outspin	*	past	outspun
outspin	*	past_participle	outspun
outspring	*	past	outsprang
outspring	*	past_participle	outsprung
outstand	*	past	outstood
outstand	*	past_participle	outstood
outswear	*	past	outswore
outswear	*	past_participle	outsworn
outswim	*	past	outswam
outswim	*	past_participle	outswum
outtell	*	past	outtold
outtell	*	past_participle	outtold
outthink	*	past	outthought
outthink	*	past_participle	outthought
outthrow	*	past	outthrew
outthrow	*	past_participle	outthrown
outwear	*	past	outwore
outwear	*	past_participle	outworn
outwind	*	past	outwound
outwind	*	past_participle	outwound
outwrite	*	past	outwrote
outwrite	*	past_participle	outwritten
overbear	*	past	overbore
overbear	*	past_participle	overborne
overbid	*	past	overbid
overbid	*	past_participle	overbid
overbreed	*	past	overbred
overbreed	*	past_participle	overbred
overbuild	*	past	overbuilt
overbuild	*	past_participle	overbuilt
overbuy	*	past	overbought
overbuy	*	past_participle	overbought
overcast	*	past	overcast
overcast	*	past_participle	overcast
overcome	*	past	overcame
overcome	*	past_participle	overcome
overcut	*	past	overcut
overcut	*	past_participle	overcut
overdo	*	past	overdid
overdo	*	past_participle	overdone
overdraw	*	past	overdrew
overdraw	*	past_participle	overdrawn
overdrink	*	past	overdrank
overdrink	*	past_participle	overdrunk
overdrive	*	past	overdrove
overdrive	*	past_participle	overdriven
overeat	*	past	overate
overeat	*	past_participle	overeaten
overfeed	*	past	overfed
overfeed	*	past_participle	overfed
overhang	*	past	overhung
overhang	*	past_participle	overhung
overhear	*	past	overheard
overhear	*	past_participle	overheard
overlay	*	past	overlaid
overlay	*	past_participle	overlaid
overlie	*	past	overlay
overlie	*	past_participle	overlain
overpay	*	past	overpaid
overpay	*	past_participle	overpaid
override	*	past	overrode
override	*	past_participle	overridden
overrun	*	past	overran
overrun	*	past_participle	overrun
oversee	*	past	oversaw
oversee	*	past_participle	overseen
oversell	*	past	oversold
oversell	*	past_participle	oversold
overset	*	past	overset
overset	*	past_participle	overset
overshoot	*	past	overshot
overshoot	*	past_participle	overshot
oversleep	*	past	overslept
oversleep	*	past_participle	overslept
overslide	*	past	overslid
overslide	*	past_participle	overslid
oversling	*	past	overslung
oversling	*	past_participle	overslung
overspeak	*	past	overspoke
overspeak	*	past_participle	overspoken
overspeed	*	past	oversped
overspeed	*	past_participle	oversped
overspend	*	past	overspent
overspend	*	past_participle	overspent
overspin	*	past	overspun
overspin	*	past_participle	overspun
overspread	*	past	overspread
overspread	*	past_participle	overspread
overspring	*	past	oversprang
overspring	*	past_participle	oversprung
overstand	*	past	overstood
overstand	*	past_participle	overstood
overstride	*	past	overstrode
overstride	*	past_participle	overstridden
overstrike	*	past	overstruck
overstrike	*	past_participle	overstruck
overstring	*	past	overstrung
overstring	*	past_participle	overstrung
overstrive	*	past	overstrove
overstrive	*	past_participle	overstriven
overtake	*	past	overtook
overtake	*	past_participle	overtaken
overthink	*	past	overthought
overthink	*	past_participle	overthought
overthrow	*	past	overthrew
overthrow	*	past_participle	overthrown
overwear	*	past	overwore
overwear	*	past_participle	overworn
overwind	*	past	overwound
overwind	*	past_participle	overwound
overwrite	*	past	overwrote
overwrite	*	past_participle	overwritten
pay	*	past	paid
pay	*	past_participle	paid
picnic	*	past	picnicked
picnic	*	past_participle	picnicked
picnic	*	present_participle	picnicking
pie	*	present_participle	pieing
plead	*	past	pleaded
plead	*	past_participle	pled
prebuild	*	past	prebuilt
prebuild	*	past_participle	prebuilt
predo	*	past	predid
predo	*	past_participle	predone
predo	third_person_singular	present	predoes
premake	*	past	premade
premake	*	past_participle	premade
prepay	*	past	prepaid
prepay	*	past_participle	prepaid
presell	*	past	presold
presell	*	past_participle	presold
preset	*	past	preset
preset	*	past_participle	preset
preshrink	*	past	preshrank
preshrink	*	past_participle	preshrunk
presplit	*	past	presplit
presplit	*	past_participle	presplit
proofread	*	past	proofread
proofread	*	past_participle	proofread
prove	*	past	proved
prove	*	past_participle	proven
put	*	past	put
put	*	past_participle	put
quick-freeze	*	past	quick-froze
quick-freeze	*	past_participle	quick-frozen
quickfreeze	*	past	quickfroze
quickfreeze	*	past_participle	quickfrozen
quit	*	past	quit
quit	*	past_participle	quit
re-cast	*	past	re-cast
re-cast	*	past_participle	re-cast
re-lay	*	past	re-laid
re-lay	*	past_participle	re-laid
re-make	*	past	re-made
re-make	*	past_participle	re-made
re-sell	*	past	re-sold
re-sell	*	past_participle	re-sold
re-tell	*	past	re-told
re-tell	*	past_participle	re-told
read	*	past	read
read	*	past_participle	read
rebid	*	past	rebid
rebid	*	past_participle	rebid
rebind	*	past	rebound
rebind	*	past_participle	rebound
rebroadcast	*	past	rebroadcast
rebroadcast	*	past_participle	rebroadcast
rebuild	*	past	rebuilt
rebuild	*	past_participle	rebuilt
recast	*	past	recast
recast	*	past_participle	recast
recut	*	past	recut
recut	*	past_participle	recut
redeal	*	past	redealt
redeal	*	past_participle	redealt
redo	*	past	redid
redo	*	past_participle	redone
redo	third_person_singular	present	redoes
redraw	*	past	redrew
redraw	*	past_participle	redrawn
refit	*	past	refit
refit	*	past_participle	refit
regrind	*	past	reground
regrind	*	past_participle	reground
regrow	*	past	regrew
regrow	*	past_participle	regrown
rehang	*	past	rehung
rehang	*	past_participle	rehung
rehear	*	past	reheard
rehear	*	past_participle	reheard
reknit	*	past	reknitted
reknit	*	past_participle	reknitted
reknit	*	present_participle	reknitting
relay	*	past	relaid
relay	*	past_participle	relaid
remake	*	past	remade
remake	*	past_participle	remade
repay	*	past	repaid
repay	*	past_participle	repaid
rerun	*	past	reran
rerun	*	past_participle	rerun
resell	*	past	resold
resell	*	past_participle	resold
resend	*	past	resent
resend	*	past_participle	resent
reset	*	past	reset
reset	*	past_participle	reset
resew	*	past	resewed
resew	*	past_participle	resewn
retake	*	past	retook
retake	*	past_participle	retaken
reteach	*	past	retaught
reteach	*	past_participle	retaught
retear	*	past	retore
retear	*	past_participle	retorn
retell	*	past	retold
retell	*	past_participle	retold
rethink	*	past	rethought
rethink	*	past_participle	rethought
retread	*	past	retrod
retread	*	past_participle	retrodden
retrofit	*	past	retrofit
retrofit	*	past_participle	retrofit
reweave	*	past	rewove
reweave	*	past_participle	rewoven
rewed	*	past	rewed
rewed	*	past_participle	rewed
rewet	*	past	rewet
rewet	*	past_participle	rewet
rewin	*	past	rewon
rewin	*	past_participle	rewon
rewind	*	past	rewound
rewind	*	past_participle	rewound
rewrite	*	past	rewrote
rewrite	*	past_participle	rewritten
rid	*	past	rid
rid	*	past_participle	rid
ride	*	past	rode
ride	*	past_participle	ridden
ring	*	past	rang
ring	*	past_participle	rung
rise	*	past	rose
rise	*	past_participle	risen
run	*	past	ran
run	*	past_participle	run
sand-cast	*	past	sand-cast
sand-cast	*	past_participle	sand-cast
sandcast	*	past	sandcast
sandcast	*	past_participle	sandcast
say	*	past	said
say	*	past_participle	said
see	*	past	saw
see	*	past_participle	seen
seek	*	past	sought
seek	*	past_participle	sought
self-feed	*	past	self-fed
self-feed	*	past_participle	self-fed
selffeed	*	past	selffed
selffeed	*	past_participle	selffed
sell	*	past	sold
sell	*	past_participle	sold
send	*	past	sent
send	*	past_participle	sent
set	*	past	set
set	*	past_participle	set
sew	*	past	sewed
sew	*	past_participle	sewn
shake	*	past	shook
shake	*	past_participle	shaken
shear	*	past	shore
shear	*	past_participle	shorn
shed	*	past	shed
shed	*	past_participle	shed
shoot	*	past	shot
shoot	*	past_participle	shot
show	*	past	showed
show	*	past_participle	shown
shrink	*	past	shrank
shrink	*	past_participle	shrunk
shut	*	past	shut
shut	*	past_participle	shut
sight-read	*	past	sight-read
sight-read	*	past_participle	sight-read
sightread	*	past	sightread
sightread	*	past_participle	sightread
sign-on	*	past	signed-on
sign-on	*	past_participle	signed-on
sing	*	past	sang
sing	*	past_participle	sung
sink	*	past	sank
sink	*	past_participle	sunk
sit	*	past	sat
sit	*	past_participle	sat
skywrite	*	past	skywrote
skywrite	*	past_participle	skywritten
slay	*	past	slew
slay	*	past_participle	slain
sleep	*	past	slept
sleep	*	past_participle	slept
slide	*	past	slid
slide	*	past_participle	slid
sling	*	past	slung
sling	*	past_participle	slung
slit	*	past	slit
slit	*	past_participle	slit
smite	*	past	smote
smite	*	past_participle	smitten
speak	*	past	spoke
speak	*	past_participle	spoken
speed	*	past	sped
speed	*	past_participle	sped
spend	*	past	spent
spend	*	past_participle	spent
spin	*	past	spun
spin	*	past_participle	spun
spit	*	past	spat
spit	*	past_participle	spat
split	*	past	split
split	*	past_participle	split
spoon-feed	*	past	spoon-fed
spoon-feed	*	past_participle	spoon-fed
spoonfeed	*	past	spoonfed
spoonfeed	*	past_participle	spoonfed
spread	*	past	spread
spread	*	past_participle	spread
spring	*	past	sprang
spring	*	past_participle	sprung
stall-feed	*	past	stall-fed
stall-feed	*	past_participle	stall-fed
stallfeed	*	past	stallfed
stallfeed	*	past_participle	stallfed
stand	*	past	stood
stand	*	past_participle	stood
steal	*	past	stole
steal	*	past_participle	stolen
step-up	*	past	stepped-up
step-up	*	past_participle	stepped-up
stepup	*	past	steppedup
stepup	*	past_participle	steppedup
stick	*	past	stuck
stick	*	past_participle	stuck
sting	*	past	stung
sting	*	past_participle	stung
stink	*	past	stank
stink	*	past_participle	stunk
stride	*	past	strode
stride	*	past_participle	stridden
strike	*	past	struck
strike	*	past_participle	struck
string	*	past	strung
string	*	past_participle	strung
strive	*	past	strove
strive	*	past_participle	striven
sub-let	*	past	sub-let
sub-let	*	past_participle	sub-let
sublet	*	past	sublet
sublet	*	past_participle	sublet
swear	*	past	swore
swear	*	past_participle	sworn
sweep	*	past	swept
sweep	*	past_participle	swept
swell	*	past	swelled
swell	*	past_participle	swollen
swim	*	past	swam
swim	*	past_participle	swum
swing	*	past	swung
swing	*	past_participle	swung
take	*	past	took
take	*	past_participle	taken
teach	*	past	taught
teach	*	past_participle	taught
tear	*	past	tore
tear	*	past_participle	torn
telecast	*	past	telecast
telecast	*	past_participle	telecast
tell	*	past	told
tell	*	past_participle	told
test-drive	*	past	test-drove
test-drive	*	past_participle	test-driven
test-fly	*	past	test-flew
test-fly	*	past_participle	test-flown
testdrive	*	past	testdrove
testdrive	*	past_participle	testdriven
testfly	*	past	testflew
testfly	*	past_participle	testflown
think	*	past	thought
think	*	past_participle	thought
thring	*	past	throng
thring	*	past_participle	throng
throw	*	past	threw
throw	*	past_participle	thrown
thrust	*	past	thrust
thrust	*	past_participle	thrust
trail-off	*	past	trailed-off
trail-off	*	past_participle	trailed-off
tread	*	past	trod
tread	*	past_participle	trodden
troubleshoot	*	past	troubleshot
troubleshoot	*	past_participle	troubleshot
typecast	*	past	typecast
typecast	*	past_participle	typecast
typewrite	*	past	typewrote
typewrite	*	past_participle	typewritten
under-write	*	past	under-wrote
under-write	*	past_participle	under-written
underbid	*	past	underbid
underbid	*	past_participle	underbid
underbuy	*	past	underbought
underbuy	*	past_participle	underbought
undercut	*	past	undercut
undercut	*	past_participle	undercut
underfeed	*	past	underfed
underfeed	*	past_participle	underfed
undergo	*	past	underwent
undergo	*	past_participle	undergone
undergo	third_person_singular	present	undergoes
underrun	*	past	underran
underrun	*	past_participle	underrun
undersell	*	past	undersold
undersell	*	past_participle	undersold
undershoot	*	past	undershot
undershoot	*	past_participle	undershot
underspend	*	past	underspent
underspend	*	past_participle	underspent
understand	*	past	understood
understand	*	past_participle	understood
undertake	*	past	undertook
undertake	*	past_participle	undertaken
underthrust	*	past	underthrust
underthrust	*	past_participle	underthrust
underwrite	*	past	underwrote
underwrite	*	past_participle	underwritten
undo	*	past	undid
undo	*	past_participle	undone
undo	third_person_singular	present	undoes
undraw	*	past	undrew
undraw	*	past_participle	undrawn
unfreeze	*	past	unfroze
unfreeze	*	past_participle	unfrozen
unhang	*	past	unhung
unhang	*	past_participle	unhung
unhide	*	past	unhid
unhide	*	past_participle	unhidden
unhold	*	past	unheld
unhold	*	past_participle	unheld
unknit	*	past	unknitted
unknit	*	past_participle	unknitted
unknit	*	present_participle	unknitting
unlay	*	past	unlaid
unlay	*	past_participle	unlaid
unmake	*	past	unmade
unmake	*	past_participle	unmade
unsay	*	past	unsaid
unsay	*	past_participle	unsaid
unsew	*	past	unsewed
unsew	*	past_participle	unsewn
unsling	*	past	unslung
unsling	*	past_participle	unslung
unspin	*	past	unspun
unspin	*	past_participle	unspun
unstick	*	past	unstuck
unstick	*	past_participle	unstuck
unstring	*	past	unstrung
unstring	*	past_participle	unstrung
unswear	*	past	unswore
unswear	*	past_participle	unsworn
unteach	*	past	untaught
unteach	*	past_participle	untaught
unthink	*	past	unthought
unthink	*	past_participle	unthought
unweave	*	past	unwove
unweave	*	past_participle	unwoven
unwind	*	past	unwound
unwind	*	past_participle	unwound
unwrite	*	past	unwrote
unwrite	*	past_participle	unwritten
uphold	*	past	upheld
uphold	*	past_participle	upheld
upset	*	past	upset
upset	*	past_participle	upset
use-up	*	past	used-up
use-up	*	past_participle	used-up
use-up	*	present_participle	using-up
wake	*	past	woke
wake	*	past_participle	woken
waylay	*	past	waylaid
waylay	*	past_participle	waylaid
wear	*	past	wore
wear	*	past_participle	worn
weave	*	past	wove
weave	*	past_participle	woven
wed	*	past	wed
wed	*	past_participle	wed
weep	*	past	wept
weep	*	past_participle	wept
welcome	*	past	welcomed
welcome	*	past_participle	welcomed
wet	*	past	wet
wet	*	past_participle	wet
win	*	past	won
win	*	past_participle	won
wind	*	past	wound
wind	*	past_participle	wound
withdraw	*	past	withdrew
withdraw	*	past_participle	withdrawn
withhold	*	past	withheld
withhold	*	past_participle	withheld
withstand	*	past	withstood
withstand	*	past_participle	withstood
wring	*	past	wrung
wring	*	past_participle	wrung
write	*	past	wrote
write	*	past_participle	written
wrought	*	past	wrought
wrought	*	past_participle	wrought

#
# Doubling Verbs (from MorphAdorner's doublingverbs.txt)
#
abat
abet
abhor
abut
accur
acquit
adlib
admit
aerobat
aerosol
agendaset
airdrop
allot
alot
anagram
annul
appal
apparel
armbar
aver
babysit
backdrop
backfil
backflip
backlog
backpedal
backslap
backstab
bag
balfun
ballot
ban
bar
barbel
bareleg
barrel
bat
bayonet
becom
bed
bedevil
bedwet
beenhop
befit
befog
beg
beget
begin
bejewel
bemedal
benefit
benum
beset
besot
bestir
bet
betassel
bevel
bewig
bib
bid
billet
bin
bip
bit
bitmap
blab
blackleg
blag
blam
blan
blat
bles
blim
blip
blob
bloodlet
blot
blub
blur
bob
bobsled
bodypop
bog
boobytrap
booksel
bootleg
bop
bot
bowel
bracket
brag
brig
brim
bud
buffet
bug
bullshit
bum
bun
bur
bus
but
cab
cabal
cam
can
cancel
cap
caracol
caravan
carburet
carnap
carol
carpetbag
castanet
cat
catcal
catnap
cavil
chan
chanel
channel
chap
char
chargecap
chat
chin
chip
chir
chirrup
chisel
chop
chug
chum
chur
clam
clap
clearcut
clip
clodhop
clog
clop
closet
clot
club
cob
cobweb
cod
coif
com
combat
comit
commit
compel
con
concur
confab
confer
confiscat
control
cooccur
cop
coprogram
coquet
coral
corbel
corefer
corral
corun
cosset
costar
cotransmit
councel
council
counsel
counterplot
courtmartial
crab
cram
crap
crib
crop
crossleg
cub
cudgel
cum
cun
cup
curet
cut
dab
dag
dam
dan
dap
daysit
deadpan
debag
debar
debug
decommit
decontrol
defer
defog
deg
degas
degazet
dehul
deinstal
demit
demob
demur
den
denet
depig
depip
depit
deprogram
der
derig
deskil
deter
devil
diagram
dial
dib
dig
dim
din
dip
disbar
disbud
discomfit
disembed
disembowel
dishevel
disinter
dispel
disprefer
distil
dog
dognap
don
doorstep
dot
dowel
drag
drat
driftnet
drip
drivel
drop
drub
drug
drum
dub
duel
dun
dybbuk
earwig
eavesdrop
ecolabel
egotrip
eitherspigot
electroblot
embed
emit
empanel
enamel
endlabel
endtrim
enrol
enthral
entrammel
entrap
enwrap
equal
equip
estop
exaggerat
excel
expel
extol
fag
fan
farewel
fat
featherbed
feget
fet
fib
fig
fin
fingerspel
fingertip
fit
flab
flag
flap
flip
flit
flog
flop
fob
focus
fog
footbal
footslog
fop
forbid
forget
format
fortunetel
fot
foxtrot
frag
freefal
fret
frig
frip
frog
frug
fuel
fufil
fulfil
fullyfit
fun
funnel
fur
furpul
gab
gad
gaffe
gag
gam
gambol
gap
garot
garrot
gas
gat
gel
gen
get
giftwrap
gig
gimbal
gin
glam
glenden
glendin
globetrot
glug
glut
gob
goldpan
golliwog
goostep
gossip
grab
gravel
grid
grin
grip
grit
groundhop
grovel
grub
gum
gun
gunrun
gut
gyp
haircut
ham
han
handbag
handicap
handknit
handset
hap
hareleg
hat
headbut
hedgehop
hem
hen
hiccup
highwal
hip
hit
hobnob
hog
hop
horsewhip
hostel
hot
hotdog
hovel
hug
hum
humbug
hup
hushkit
hut
idyl
illfit
imbed
immunblot
immunoblot
impannel
impel
imperil
incur
infer
infil
inflam
initial
input
inset
inspan
instal
instil
inter
interbed
intercrop
intercut
interfer
intermit
interwar
jab
jag
jam
japan
jar
jawdrop
jet
jetlag
jewel
jib
jig
jitterbug
job
jog
jogtrot
jot
jug
jut
ken
kennel
kid
kidnap
kip
kissogram
kit
knap
kneecap
knit
knob
knot
kor
kris
label
lag
lam
lap
lavel
leafcut
leapfrog
leg
lem
lep
let
level
libel
lid
lig
lip
lob
log
lok
lollop
longleg
lop
lowbal
lug
mackerel
mahom
man
manumit
map
mar
marshal
marvel
mat
matchwin
metal
microplan
microprogram
milksop
miscal
misclub
mishit
mislabel
misspel
mit
mob
mod
model
mohmam
monogram
mop
mothbal
mousse
mud
mug
multilevel
mum
nab
nag
nan
nap
net
nightclub
nightsit
nip
nod
nonplus
norkop
nostril
not
nut
nutmeg
occur
ocur
offput
offset
omit
ommit
onlap
outbid
outcrop
outfit
outgas
outgeneral
outgun
outhit
outjab
outplan
outpol
outpul
output
outrun
outsel
outship
outshop
outsin
outspan
outstrip
outswel
outwit
overbid
overcal
overcommit
overcontrol
overcrap
overcrop
overdub
overfil
overfit
overhat
overhit
overlap
overman
overmodel
overpedal
overpet
overplot
overrun
oversel
overshop
overstep
overtip
overtop
overwet
overwil
pad
paintbal
pan
panel
paperclip
par
parallel
parcel
partiescal
pat
patrol
pedal
peewit
peg
pen
pencil
pep
permit
pet
petal
pettifog
photoset
photostat
phototypeset
phut
picket
pig
pilot
pin
pinbal
pip
pipefit
pipet
pit
plan
plit
plod
plop
plot
plug
plumet
plummet
pod
policyset
polyfil
ponytrek
pop
pot
pouf
pram
prebag
predistil
predril
prefer
prefil
preinstal
prep
preplan
preprogram
preset
prim
prizewin
prod
profer
prog
program
prop
propel
pub
pug
pummel
pun
pup
pushfit
put
quarel
quarrel
quickskim
quickstep
quickwit
quip
quit
quivertip
quiz
rabbit
rabit
radiolabel
rag
ram
ramrod
rap
rat
ratecap
ravel
readmit
reallot
rebel
rebid
rebin
rebut
recal
recap
rechannel
recommit
recrop
recur
recut
red
redig
redril
reemit
refer
refil
refit
reflag
reformat
refret
refuel
reget
regret
rehab
reinstal
reinter
rejig
rekit
reknot
relabel
relap
relet
rem
remap
remetal
remit
remodel
reoccur
rep
repastel
repel
repin
replan
replot
replug
repol
repot
reprogram
rerefer
rerig
rerol
rerun
resel
reset
resignal
resit
reskil
reskin
restal
resubmit
ret
retel
retop
retransfer
retransmit
retrim
retrofit
rev
revel
revet
rewrap
rib
richochet
ricochet
rid
rig
rim
ringlet
rip
rit
rival
rivet
roadrun
rob
rocket
rod
roset
rosin
rot
rowel
rub
run
runnel
rut
sab
sad
sag
sandbag
sap
scab
scalpel
scam
scan
scar
scat
schlep
scrag
scram
scrap
scrat
scrub
scrum
scud
scum
scur
semicontrol
semiskil
semiskim
sentinel
set
shag
shall
sham
shed
shim
shin
ship
shir
shit
shlap
shop
shopfit
shortfal
shot
shovel
shred
shrinkwrap
shrivel
shrug
shun
shut
sideslip
sidestep
signal
sin
sinbin
sip
sit
skid
skim
skin
skip
skir
skrag
slab
slag
slam
slap
sled
slim
slip
slit
slob
slog
slop
slot
slowclap
slug
slum
slur
smit
smut
snag
snap
snip
snivel
snog
snorkel
snowcem
snub
snug
sob
sod
softpedal
son
sop
spam
span
spar
spat
spiderweb
spin
spiral
spit
splat
split
spot
sprag
spraygun
sprig
springtip
spud
spur
squat
squirrel
stab
stag
star
stem
sten
stencil
step
stet
stir
stop
storytel
strap
strim
strip
strop
strug
strum
strut
stub
stud
stun
sub
subcrop
sublet
submit
subset
suedetrim
sulfuret
sum
summit
sun
suntan
sup
superad
superchil
swab
swag
swan
swap
swat
swig
swim
swivel
swot
tab
tag
tan
tansfer
tap
tar
tassel
tat
tefer
teleshop
tendril
terschel
th'strip
thermal
thermostat
thin
throb
thrum
thud
thug
tightlip
tin
tinsel
tip
tittup
toecap
tog
tom
tomorrow
top
tot
total
towel
traget
trainspot
tram
trammel
transfer
tranship
transit
transmit
transship
trap
travel
trek
trendset
trepan
trim
trip
tripod
trod
trog
trot
trousseaushop
trowel
trup
tub
tug
tunnel
tup
tut
twat
twig
twin
twit
typeset
tyset
unban
unbar
unbob
uncap
unclip
uncompel
undam
underbid
underbil
undercut
underfit
underlet
underman
underpin
underskil
unfit
unfulfil
unknot
unlip
unlywil
unman
unpad
unpeg
unpin
unplug
unravel
unrip
unrol
unscrol
unsnap
unstal
unstep
unstir
unstop
untap
unwrap
unzip
up
upset
upskil
upwel
ven
verbal
vet
victual
vignet
wad
wag
wainscot
wan
war
waterfal
waterfil
waterlog
weasel
web
wed
wet
wham
whet
whip
whir
whiteskin
whiz
whop
whup
wig
wildcat
will
win
windmil
wiretap
wit
woodchop
woodcut
wor
worship
wrap
yak
yap
yarnspin
yen
yip
yodel
zag
zap
zig
zigzag
zip
ztrip
