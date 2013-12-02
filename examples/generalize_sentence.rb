#!/usr/bin/ruby

BEGIN {
	require 'pathname'

	basedir = Pathname.new( __FILE__ ).dirname.parent.expand_path
	libdir = basedir + "lib"
	$LOAD_PATH.unshift( basedir.to_s ) unless $LOAD_PATH.include?( basedir.to_s )
	$LOAD_PATH.unshift( libdir.to_s ) unless $LOAD_PATH.include?( libdir.to_s )
}

require 'linguistics'
require 'readline'

Linguistics.use( :en, :installProxy => true )

def generalized_word( word )
	$deferr.puts "    Traversing hypernyms for #{word}"
	syn = word.synset or return word
	nyms = syn.traverse( :hypernyms )
	return word if nyms.empty?

	general_subj = nyms[ nyms.length / 4 ]
	$deferr.puts "      %d synsets returned. Picking %d (%s)" % [
		nyms.length,
		nyms.length / 4,
		general_subj.words.first,
	]
	return general_subj.words.first
end

while input = Readline.readline( "Sentence to generalize: " )
	sent = input.sentence

	subj = sent.subject
	obj = sent.object
	verb = sent.verb

	input.sub!( /\b#{subj}\b/, generalized_word(subj) ) if subj
	input.sub!( /\b#{obj}\b/, generalized_word(obj) ) if obj
	input.sub!( /\b#{verb}\b/, generalized_word(verb) ) if verb

	puts input
end



