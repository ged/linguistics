#!/usr/bin/ruby -w
#
# Unit test for English language module's title case method 
# $Id: titlecase.tests.rb,v 221d313ccdd5 2007/06/13 05:25:38 ged $
#
# Copyright (c) 2005 The FaerieMUD Consortium.
# 

unless defined? Linguistics::TestCase
	testsdir = File::dirname( File::dirname(File::expand_path( __FILE__ )) )
	$LOAD_PATH.unshift testsdir unless $LOAD_PATH.include?( testsdir )

	require 'lingtestcase'
end

### This test case tests the #titlecase method of the english-language extension
### for the Linguistics library.
class TitleCaseTestCase < Linguistics::TestCase

	Linguistics::use( :en )

	Titles = File::open(__FILE__).read.split("__END__").last.split("\n")

	def test_nothing
		debug_msg "Not tested, as the functionality it tests hasn't been released yet."
	end

	def dont_test_titles
		printTestHeader "TitleCase: Titles"
		rval = nil

		debug_msg "Titles = %p" % [Titles]

		Titles.each do |title|
			next if !/\w/.match( title )

			assert_nothing_raised do
				rval = title.downcase.en.titlecase
			end

			assert_instance_of String, rval
			assert_equal title, rval
		end
	end

end


__END__
A Certain Kind of Longing
A Connecticut Yankee in King Arthur's Court
A Portrait of the Artist as a Young Man
Alice in Wonderland
Catcher in the Rye
Crime and Punishment
Death of a Salesman
Dr. Jekyll and Mr. Hyde
Gone With the Wind
Gone but Not Forgotten
Gulliver's Travels
Last of the Mohicans
Lord of the Flies
Love in the Time of Cholera
Maggie, A Girl of the Streets
Notes from the Underground
Of Mice and Men
Pride and Prejudice
The Adventures of Don Quixote
The Good Earth
The Heart of Darkness
The Lord of the Rings
The Old Man and the Sea
Mrs. Frisby and the Rats of N.I.M.H.
