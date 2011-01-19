#!/usr/bin/env spec -cfs

BEGIN {
	require 'pathname'
	basedir = Pathname.new( __FILE__ ).dirname.parent.parent.parent

	libdir = basedir + "lib"

	$LOAD_PATH.unshift( basedir.to_s ) unless $LOAD_PATH.include?( basedir.to_s )
	$LOAD_PATH.unshift( libdir.to_s ) unless $LOAD_PATH.include?( libdir.to_s )
}

require 'rspec'
require 'spec/lib/helpers'

require 'linguistics'
require 'linguistics/en/numbers'


describe Linguistics::EN::Numbers do
	include Linguistics::SpecHelpers

	before( :all ) do
		setup_logging( :fatal )
		Linguistics.use( :en )
	end

	after( :all ) do
		reset_logging()
	end


	it "adds EN::Numbers to the list of English language modules" do
		Linguistics::EN::MODULES.include?( Linguistics::EN::Numbers )
	end

	describe "numbers to words" do

		it "can transform 0 into english words" do
			"0".en.numwords.should == "zero"
		end

		it "can transform 0 into english words in single-digit groups" do
			"0".en.numwords( :group => 1 ).should == "zero"
		end

		it "can transform 0 into english words in double-digit groups" do
			"0".en.numwords( :group => 2 ).should == "zero"
		end

		it "can transform 0 into english words in triple-digit groups" do
			"0".en.numwords( :group => 3 ).should == "zero"
		end


		it "can transform the english words for 0 into an ordinal" do
			"0".en.numwords.en.ordinal.should.should == "zeroth"
		end


		it "can transform 1 into english words" do
			"1".en.numwords.should == "one"
		end

		it "can transform 1 into english words in single-digit groups" do
			"1".en.numwords( :group => 1 ).should == "one"
		end

		it "can transform 1 into english words in double-digit groups" do
			"1".en.numwords( :group => 2 ).should == "one"
		end

		it "can transform 1 into english words in triple-digit groups" do
			"1".en.numwords( :group => 3 ).should == "one"
		end


		it "can transform the english words for 1 into an ordinal" do
			"1".en.numwords.en.ordinal.should == "first"
		end


		it "can transform 2 into english words" do
			"2".en.numwords.should == "two"
		end

		it "can transform 2 into english words in single-digit groups" do
			"2".en.numwords( :group => 1 ).should == "two"
		end

		it "can transform 2 into english words in double-digit groups" do
			"2".en.numwords( :group => 2 ).should == "two"
		end

		it "can transform 2 into english words in triple-digit groups" do
			"2".en.numwords( :group => 3 ).should == "two"
		end


		it "can transform the english words for 2 into an ordinal" do
			"2".en.numwords.en.ordinal.should == "second"
		end


		it "can transform 3 into english words" do
			"3".en.numwords.should == "three"
		end

		it "can transform 3 into english words in single-digit groups" do
			"3".en.numwords( :group => 1 ).should == "three"
		end

		it "can transform 3 into english words in double-digit groups" do
			"3".en.numwords( :group => 2 ).should == "three"
		end

		it "can transform 3 into english words in triple-digit groups" do
			"3".en.numwords( :group => 3 ).should == "three"
		end


		it "can transform the english words for 3 into an ordinal" do
			"3".en.numwords.en.ordinal.should == "third"
		end


		it "can transform 4 into english words" do
			"4".en.numwords.should == "four"
		end

		it "can transform 4 into english words in single-digit groups" do
			"4".en.numwords( :group => 1 ).should == "four"
		end

		it "can transform 4 into english words in double-digit groups" do
			"4".en.numwords( :group => 2 ).should == "four"
		end

		it "can transform 4 into english words in triple-digit groups" do
			"4".en.numwords( :group => 3 ).should == "four"
		end


		it "can transform the english words for 4 into an ordinal" do
			"4".en.numwords.en.ordinal.should == "fourth"
		end


		it "can transform 5 into english words" do
			"5".en.numwords.should == "five"
		end

		it "can transform 5 into english words in single-digit groups" do
			"5".en.numwords( :group => 1 ).should == "five"
		end

		it "can transform 5 into english words in double-digit groups" do
			"5".en.numwords( :group => 2 ).should == "five"
		end

		it "can transform 5 into english words in triple-digit groups" do
			"5".en.numwords( :group => 3 ).should == "five"
		end


		it "can transform the english words for 5 into an ordinal" do
			"5".en.numwords.en.ordinal.should == "fifth"
		end


		it "can transform 6 into english words" do
			"6".en.numwords.should == "six"
		end

		it "can transform 6 into english words in single-digit groups" do
			"6".en.numwords( :group => 1 ).should == "six"
		end

		it "can transform 6 into english words in double-digit groups" do
			"6".en.numwords( :group => 2 ).should == "six"
		end

		it "can transform 6 into english words in triple-digit groups" do
			"6".en.numwords( :group => 3 ).should == "six"
		end


		it "can transform the english words for 6 into an ordinal" do
			"6".en.numwords.en.ordinal.should == "sixth"
		end


		it "can transform 7 into english words" do
			"7".en.numwords.should == "seven"
		end

		it "can transform 7 into english words in single-digit groups" do
			"7".en.numwords( :group => 1 ).should == "seven"
		end

		it "can transform 7 into english words in double-digit groups" do
			"7".en.numwords( :group => 2 ).should == "seven"
		end

		it "can transform 7 into english words in triple-digit groups" do
			"7".en.numwords( :group => 3 ).should == "seven"
		end


		it "can transform the english words for 7 into an ordinal" do
			"7".en.numwords.en.ordinal.should == "seventh"
		end


		it "can transform 8 into english words" do
			"8".en.numwords.should == "eight"
		end

		it "can transform 8 into english words in single-digit groups" do
			"8".en.numwords( :group => 1 ).should == "eight"
		end

		it "can transform 8 into english words in double-digit groups" do
			"8".en.numwords( :group => 2 ).should == "eight"
		end

		it "can transform 8 into english words in triple-digit groups" do
			"8".en.numwords( :group => 3 ).should == "eight"
		end


		it "can transform the english words for 8 into an ordinal" do
			"8".en.numwords.en.ordinal.should == "eighth"
		end


		it "can transform 9 into english words" do
			"9".en.numwords.should == "nine"
		end

		it "can transform 9 into english words in single-digit groups" do
			"9".en.numwords( :group => 1 ).should == "nine"
		end

		it "can transform 9 into english words in double-digit groups" do
			"9".en.numwords( :group => 2 ).should == "nine"
		end

		it "can transform 9 into english words in triple-digit groups" do
			"9".en.numwords( :group => 3 ).should == "nine"
		end


		it "can transform the english words for 9 into an ordinal" do
			"9".en.numwords.en.ordinal.should == "ninth"
		end


		it "can transform 10 into english words" do
			"10".en.numwords.should == "ten"
		end

		it "can transform 10 into english words in single-digit groups" do
			"10".en.numwords( :group => 1 ).should == "one, zero"
		end

		it "can transform 10 into english words in double-digit groups" do
			"10".en.numwords( :group => 2 ).should == "ten"
		end

		it "can transform 10 into english words in triple-digit groups" do
			"10".en.numwords( :group => 3 ).should == "ten"
		end


		it "can transform the english words for 10 into an ordinal" do
			"10".en.numwords.en.ordinal.should == "tenth"
		end


		it "can transform 11 into english words" do
			"11".en.numwords.should == "eleven"
		end

		it "can transform 11 into english words in single-digit groups" do
			"11".en.numwords( :group => 1 ).should == "one, one"
		end

		it "can transform 11 into english words in double-digit groups" do
			"11".en.numwords( :group => 2 ).should == "eleven"
		end

		it "can transform 11 into english words in triple-digit groups" do
			"11".en.numwords( :group => 3 ).should == "eleven"
		end


		it "can transform the english words for 11 into an ordinal" do
			"11".en.numwords.en.ordinal.should == "eleventh"
		end


		it "can transform 12 into english words" do
			"12".en.numwords.should == "twelve"
		end

		it "can transform 12 into english words in single-digit groups" do
			"12".en.numwords( :group => 1 ).should == "one, two"
		end

		it "can transform 12 into english words in double-digit groups" do
			"12".en.numwords( :group => 2 ).should == "twelve"
		end

		it "can transform 12 into english words in triple-digit groups" do
			"12".en.numwords( :group => 3 ).should == "twelve"
		end


		it "can transform the english words for 12 into an ordinal" do
			"12".en.numwords.en.ordinal.should == "twelfth"
		end


		it "can transform 13 into english words" do
			"13".en.numwords.should == "thirteen"
		end

		it "can transform 13 into english words in single-digit groups" do
			"13".en.numwords( :group => 1 ).should == "one, three"
		end

		it "can transform 13 into english words in double-digit groups" do
			"13".en.numwords( :group => 2 ).should == "thirteen"
		end

		it "can transform 13 into english words in triple-digit groups" do
			"13".en.numwords( :group => 3 ).should == "thirteen"
		end


		it "can transform the english words for 13 into an ordinal" do
			"13".en.numwords.en.ordinal.should == "thirteenth"
		end


		it "can transform 14 into english words" do
			"14".en.numwords.should == "fourteen"
		end

		it "can transform 14 into english words in single-digit groups" do
			"14".en.numwords( :group => 1 ).should == "one, four"
		end

		it "can transform 14 into english words in double-digit groups" do
			"14".en.numwords( :group => 2 ).should == "fourteen"
		end

		it "can transform 14 into english words in triple-digit groups" do
			"14".en.numwords( :group => 3 ).should == "fourteen"
		end


		it "can transform the english words for 14 into an ordinal" do
			"14".en.numwords.en.ordinal.should == "fourteenth"
		end


		it "can transform 15 into english words" do
			"15".en.numwords.should == "fifteen"
		end

		it "can transform 15 into english words in single-digit groups" do
			"15".en.numwords( :group => 1 ).should == "one, five"
		end

		it "can transform 15 into english words in double-digit groups" do
			"15".en.numwords( :group => 2 ).should == "fifteen"
		end

		it "can transform 15 into english words in triple-digit groups" do
			"15".en.numwords( :group => 3 ).should == "fifteen"
		end


		it "can transform the english words for 15 into an ordinal" do
			"15".en.numwords.en.ordinal.should == "fifteenth"
		end


		it "can transform 16 into english words" do
			"16".en.numwords.should == "sixteen"
		end

		it "can transform 16 into english words in single-digit groups" do
			"16".en.numwords( :group => 1 ).should == "one, six"
		end

		it "can transform 16 into english words in double-digit groups" do
			"16".en.numwords( :group => 2 ).should == "sixteen"
		end

		it "can transform 16 into english words in triple-digit groups" do
			"16".en.numwords( :group => 3 ).should == "sixteen"
		end


		it "can transform the english words for 16 into an ordinal" do
			"16".en.numwords.en.ordinal.should == "sixteenth"
		end


		it "can transform 17 into english words" do
			"17".en.numwords.should == "seventeen"
		end

		it "can transform 17 into english words in single-digit groups" do
			"17".en.numwords( :group => 1 ).should == "one, seven"
		end

		it "can transform 17 into english words in double-digit groups" do
			"17".en.numwords( :group => 2 ).should == "seventeen"
		end

		it "can transform 17 into english words in triple-digit groups" do
			"17".en.numwords( :group => 3 ).should == "seventeen"
		end


		it "can transform the english words for 17 into an ordinal" do
			"17".en.numwords.en.ordinal.should == "seventeenth"
		end


		it "can transform 18 into english words" do
			"18".en.numwords.should == "eighteen"
		end

		it "can transform 18 into english words in single-digit groups" do
			"18".en.numwords( :group => 1 ).should == "one, eight"
		end

		it "can transform 18 into english words in double-digit groups" do
			"18".en.numwords( :group => 2 ).should == "eighteen"
		end

		it "can transform 18 into english words in triple-digit groups" do
			"18".en.numwords( :group => 3 ).should == "eighteen"
		end


		it "can transform the english words for 18 into an ordinal" do
			"18".en.numwords.en.ordinal.should == "eighteenth"
		end


		it "can transform 19 into english words" do
			"19".en.numwords.should == "nineteen"
		end

		it "can transform 19 into english words in single-digit groups" do
			"19".en.numwords( :group => 1 ).should == "one, nine"
		end

		it "can transform 19 into english words in double-digit groups" do
			"19".en.numwords( :group => 2 ).should == "nineteen"
		end

		it "can transform 19 into english words in triple-digit groups" do
			"19".en.numwords( :group => 3 ).should == "nineteen"
		end


		it "can transform the english words for 19 into an ordinal" do
			"19".en.numwords.en.ordinal.should == "nineteenth"
		end


		it "can transform 20 into english words" do
			"20".en.numwords.should == "twenty"
		end

		it "can transform 20 into english words in single-digit groups" do
			"20".en.numwords( :group => 1 ).should == "two, zero"
		end

		it "can transform 20 into english words in double-digit groups" do
			"20".en.numwords( :group => 2 ).should == "twenty"
		end

		it "can transform 20 into english words in triple-digit groups" do
			"20".en.numwords( :group => 3 ).should == "twenty"
		end


		it "can transform the english words for 20 into an ordinal" do
			"20".en.numwords.en.ordinal.should == "twentieth"
		end


		it "can transform 21 into english words" do
			"21".en.numwords.should == "twenty-one"
		end

		it "can transform 21 into english words in single-digit groups" do
			"21".en.numwords( :group => 1 ).should == "two, one"
		end

		it "can transform 21 into english words in double-digit groups" do
			"21".en.numwords( :group => 2 ).should == "twenty-one"
		end

		it "can transform 21 into english words in triple-digit groups" do
			"21".en.numwords( :group => 3 ).should == "twenty-one"
		end


		it "can transform the english words for 21 into an ordinal" do
			"21".en.numwords.en.ordinal.should == "twenty-first"
		end


		it "can transform 29 into english words" do
			"29".en.numwords.should == "twenty-nine"
		end

		it "can transform 29 into english words in single-digit groups" do
			"29".en.numwords( :group => 1 ).should == "two, nine"
		end

		it "can transform 29 into english words in double-digit groups" do
			"29".en.numwords( :group => 2 ).should == "twenty-nine"
		end

		it "can transform 29 into english words in triple-digit groups" do
			"29".en.numwords( :group => 3 ).should == "twenty-nine"
		end


		it "can transform the english words for 29 into an ordinal" do
			"29".en.numwords.en.ordinal.should == "twenty-ninth"
		end


		it "can transform 99 into english words" do
			"99".en.numwords.should == "ninety-nine"
		end

		it "can transform 99 into english words in single-digit groups" do
			"99".en.numwords( :group => 1 ).should == "nine, nine"
		end

		it "can transform 99 into english words in double-digit groups" do
			"99".en.numwords( :group => 2 ).should == "ninety-nine"
		end

		it "can transform 99 into english words in triple-digit groups" do
			"99".en.numwords( :group => 3 ).should == "ninety-nine"
		end


		it "can transform the english words for 99 into an ordinal" do
			"99".en.numwords.en.ordinal.should == "ninety-ninth"
		end


		it "can transform 100 into english words" do
			"100".en.numwords.should == "one hundred"
		end

		it "can transform 100 into english words in single-digit groups" do
			"100".en.numwords( :group => 1 ).should == "one, zero, zero"
		end

		it "can transform 100 into english words in double-digit groups" do
			"100".en.numwords( :group => 2 ).should == "ten, zero"
		end

		it "can transform 100 into english words in triple-digit groups" do
			"100".en.numwords( :group => 3 ).should == "one zero zero"
		end


		it "can transform the english words for 100 into an ordinal" do
			"100".en.numwords.en.ordinal.should == "one hundredth"
		end


		it "can transform 101 into english words" do
			"101".en.numwords.should == "one hundred and one"
		end

		it "can transform 101 into english words in single-digit groups" do
			"101".en.numwords( :group => 1 ).should == "one, zero, one"
		end

		it "can transform 101 into english words in double-digit groups" do
			"101".en.numwords( :group => 2 ).should == "ten, one"
		end

		it "can transform 101 into english words in triple-digit groups" do
			"101".en.numwords( :group => 3 ).should == "one zero one"
		end


		it "can transform the english words for 101 into an ordinal" do
			"101".en.numwords.en.ordinal.should == "one hundred and first"
		end

		it "can transform the english words for 101 into an ordinal" do
			"101".en.numwords.en.ordinal.should == "one hundred and first"
		end


		it "can transform 110 into english words" do
			"110".en.numwords.should == "one hundred and ten"
		end

		it "can transform 110 into english words in single-digit groups" do
			"110".en.numwords( :group => 1 ).should == "one, one, zero"
		end

		it "can transform 110 into english words in double-digit groups" do
			"110".en.numwords( :group => 2 ).should == "eleven, zero"
		end

		it "can transform 110 into english words in triple-digit groups" do
			"110".en.numwords( :group => 3 ).should == "one ten"
		end


		it "can transform the english words for 110 into an ordinal" do
			"110".en.numwords.en.ordinal.should == "one hundred and tenth"
		end


		it "can transform 111 into english words" do
			"111".en.numwords.should == "one hundred and eleven"
		end

		it "can transform 111 into english words in single-digit groups" do
			"111".en.numwords( :group => 1 ).should == "one, one, one"
		end

		it "can transform 111 into english words in double-digit groups" do
			"111".en.numwords( :group => 2 ).should == "eleven, one"
		end

		it "can transform 111 into english words in triple-digit groups" do
			"111".en.numwords( :group => 3 ).should == "one eleven"
		end


		it "can transform the english words for 111 into an ordinal" do
			"111".en.numwords.en.ordinal.should == "one hundred and eleventh"
		end


		it "can transform 900 into english words" do
			"900".en.numwords.should == "nine hundred"
		end

		it "can transform 900 into english words in single-digit groups" do
			"900".en.numwords( :group => 1 ).should == "nine, zero, zero"
		end

		it "can transform 900 into english words in double-digit groups" do
			"900".en.numwords( :group => 2 ).should == "ninety, zero"
		end

		it "can transform 900 into english words in triple-digit groups" do
			"900".en.numwords( :group => 3 ).should == "nine zero zero"
		end


		it "can transform the english words for 900 into an ordinal" do
			"900".en.numwords.en.ordinal.should == "nine hundredth"
		end


		it "can transform 999 into english words" do
			"999".en.numwords.should == "nine hundred and ninety-nine"
		end

		it "can transform 999 into english words in single-digit groups" do
			"999".en.numwords( :group => 1 ).should == "nine, nine, nine"
		end

		it "can transform 999 into english words in double-digit groups" do
			"999".en.numwords( :group => 2 ).should == "ninety-nine, nine"
		end

		it "can transform 999 into english words in triple-digit groups" do
			"999".en.numwords( :group => 3 ).should == "nine ninety-nine"
		end


		it "can transform the english words for 999 into an ordinal" do
			"999".en.numwords.en.ordinal.should == "nine hundred and ninety-ninth"
		end


		it "can transform 1000 into english words" do
			"1000".en.numwords.should == "one thousand"
		end

		it "can transform 1000 into english words in single-digit groups" do
			"1000".en.numwords( :group => 1 ).should == "one, zero, zero, zero"
		end

		it "can transform 1000 into english words in double-digit groups" do
			"1000".en.numwords( :group => 2 ).should == "ten, zero zero"
		end

		it "can transform 1000 into english words in triple-digit groups" do
			"1000".en.numwords( :group => 3 ).should == "one zero zero, zero"
		end


		it "can transform the english words for 1000 into an ordinal" do
			"1000".en.numwords.en.ordinal.should == "one thousandth"
		end


		it "can transform 1001 into english words" do
			"1001".en.numwords.should == "one thousand and one"
		end

		it "can transform 1001 into english words in single-digit groups" do
			"1001".en.numwords( :group => 1 ).should == "one, zero, zero, one"
		end

		it "can transform 1001 into english words in double-digit groups" do
			"1001".en.numwords( :group => 2 ).should == "ten, zero one"
		end

		it "can transform 1001 into english words in triple-digit groups" do
			"1001".en.numwords( :group => 3 ).should == "one zero zero, one"
		end


		it "can transform the english words for 1001 into an ordinal" do
			"1001".en.numwords.en.ordinal.should == "one thousand and first"
		end


		it "can transform 1010 into english words" do
			"1010".en.numwords.should == "one thousand and ten"
		end

		it "can transform 1010 into english words in single-digit groups" do
			"1010".en.numwords( :group => 1 ).should == "one, zero, one, zero"
		end

		it "can transform 1010 into english words in double-digit groups" do
			"1010".en.numwords( :group => 2 ).should == "ten, ten"
		end

		it "can transform 1010 into english words in triple-digit groups" do
			"1010".en.numwords( :group => 3 ).should == "one zero one, zero"
		end


		it "can transform the english words for 1010 into an ordinal" do
			"1010".en.numwords.en.ordinal.should == "one thousand and tenth"
		end


		it "can transform 1100 into english words" do
			"1100".en.numwords.should == "one thousand, one hundred"
		end

		it "can transform 1100 into english words in single-digit groups" do
			"1100".en.numwords( :group => 1 ).should == "one, one, zero, zero"
		end

		it "can transform 1100 into english words in double-digit groups" do
			"1100".en.numwords( :group => 2 ).should == "eleven, zero zero"
		end

		it "can transform 1100 into english words in triple-digit groups" do
			"1100".en.numwords( :group => 3 ).should == "one ten, zero"
		end


		it "can transform the english words for 1100 into an ordinal" do
			"1100".en.numwords.en.ordinal.should == "one thousand, one hundredth"
		end


		it "can transform 2000 into english words" do
			"2000".en.numwords.should == "two thousand"
		end

		it "can transform 2000 into english words in single-digit groups" do
			"2000".en.numwords( :group => 1 ).should == "two, zero, zero, zero"
		end

		it "can transform 2000 into english words in double-digit groups" do
			"2000".en.numwords( :group => 2 ).should == "twenty, zero zero"
		end

		it "can transform 2000 into english words in triple-digit groups" do
			"2000".en.numwords( :group => 3 ).should == "two zero zero, zero"
		end


		it "can transform the english words for 2000 into an ordinal" do
			"2000".en.numwords.en.ordinal.should == "two thousandth"
		end


		it "can transform 10000 into english words" do
			"10000".en.numwords.should == "ten thousand"
		end

		it "can transform 10000 into english words in single-digit groups" do
			"10000".en.numwords( :group => 1 ).should == "one, zero, zero, zero, zero"
		end

		it "can transform 10000 into english words in double-digit groups" do
			"10000".en.numwords( :group => 2 ).should == "ten, zero zero, zero"
		end

		it "can transform 10000 into english words in triple-digit groups" do
			"10000".en.numwords( :group => 3 ).should == "one zero zero, zero zero"
		end


		it "can transform the english words for 10000 into an ordinal" do
			"10000".en.numwords.en.ordinal.should == "ten thousandth"
		end


		it "can transform 100000 into english words" do
			"100000".en.numwords.should == "one hundred thousand"
		end

		it "can transform 100000 into english words in single-digit groups" do
			"100000".en.numwords( :group => 1 ).should == "one, zero, zero, zero, zero, zero"
		end

		it "can transform 100000 into english words in double-digit groups" do
			"100000".en.numwords( :group => 2 ).should == "ten, zero zero, zero zero"
		end

		it "can transform 100000 into english words in triple-digit groups" do
			"100000".en.numwords( :group => 3 ).should == "one zero zero, zero zero zero"
		end


		it "can transform the english words for 100000 into an ordinal" do
			"100000".en.numwords.en.ordinal.should == "one hundred thousandth"
		end


		it "can transform 100001 into english words" do
			"100001".en.numwords.should == "one hundred thousand and one"
		end

		it "can transform 100001 into english words in single-digit groups" do
			"100001".en.numwords( :group => 1 ).should == "one, zero, zero, zero, zero, one"
		end

		it "can transform 100001 into english words in double-digit groups" do
			"100001".en.numwords( :group => 2 ).should == "ten, zero zero, zero one"
		end

		it "can transform 100001 into english words in triple-digit groups" do
			"100001".en.numwords( :group => 3 ).should == "one zero zero, zero zero one"
		end


		it "can transform the english words for 100001 into an ordinal" do
			"100001".en.numwords.en.ordinal.should == "one hundred thousand and first"
		end


		it "can transform 123456 into english words" do
			"123456".en.numwords.should == "one hundred and twenty-three thousand, four hundred and fifty-six"
		end

		it "can transform 123456 into english words in single-digit groups" do
			"123456".en.numwords( :group => 1 ).should == "one, two, three, four, five, six"
		end

		it "can transform 123456 into english words in double-digit groups" do
			"123456".en.numwords( :group => 2 ).should == "twelve, thirty-four, fifty-six"
		end

		it "can transform 123456 into english words in triple-digit groups" do
			"123456".en.numwords( :group => 3 ).should == "one twenty-three, four fifty-six"
		end


		it "can transform the english words for 123456 into an ordinal" do
			"123456".en.numwords.en.ordinal.should == "one hundred and twenty-three thousand, four hundred and fifty-sixth"
		end


		it "can transform 0123456 into english words" do
			"0123456".en.numwords.should == "one hundred and twenty-three thousand, four hundred and fifty-six"
		end

		it "can transform 0123456 into english words in single-digit groups" do
			"0123456".en.numwords( :group => 1 ).should == "zero, one, two, three, four, five, six"
		end

		it "can transform 0123456 into english words in double-digit groups" do
			"0123456".en.numwords( :group => 2 ).should == "zero one, twenty-three, forty-five, six"
		end

		it "can transform 0123456 into english words in triple-digit groups" do
			"0123456".en.numwords( :group => 3 ).should == "zero twelve, three forty-five, six"
		end


		it "can transform the english words for 0123456 into an ordinal" do
			"0123456".en.numwords.en.ordinal.should == "one hundred and twenty-three thousand, four hundred and fifty-sixth"
		end


		it "can transform 1234567 into english words" do
			"1234567".en.numwords.should == "one million, two hundred and thirty-four thousand, five hundred and sixty-seven"
		end

		it "can transform 1234567 into english words in single-digit groups" do
			"1234567".en.numwords( :group => 1 ).should == "one, two, three, four, five, six, seven"
		end

		it "can transform 1234567 into english words in double-digit groups" do
			"1234567".en.numwords( :group => 2 ).should == "twelve, thirty-four, fifty-six, seven"
		end

		it "can transform 1234567 into english words in triple-digit groups" do
			"1234567".en.numwords( :group => 3 ).should == "one twenty-three, four fifty-six, seven"
		end


		it "can transform the english words for 1234567 into an ordinal" do
			"1234567".en.numwords.en.ordinal.should == "one million, two hundred and thirty-four thousand, five hundred and sixty-seventh"
		end


		it "can transform 12345678 into english words" do
			"12345678".en.numwords.should == "twelve million, three hundred and forty-five thousand, six hundred and seventy-eight"
		end

		it "can transform 12345678 into english words in single-digit groups" do
			"12345678".en.numwords( :group => 1 ).should == "one, two, three, four, five, six, seven, eight"
		end

		it "can transform 12345678 into english words in double-digit groups" do
			"12345678".en.numwords( :group => 2 ).should == "twelve, thirty-four, fifty-six, seventy-eight"
		end

		it "can transform 12345678 into english words in triple-digit groups" do
			"12345678".en.numwords( :group => 3 ).should == "one twenty-three, four fifty-six, seventy-eight"
		end


		it "can transform the english words for 12345678 into an ordinal" do
			"12345678".en.numwords.en.ordinal.should == "twelve million, three hundred and forty-five thousand, six hundred and seventy-eighth"
		end


		it "can transform 12_345_678 into english words" do
			"12_345_678".en.numwords.should == "twelve million, three hundred and forty-five thousand, six hundred and seventy-eight"
		end

		it "can transform 12_345_678 into english words in single-digit groups" do
			"12_345_678".en.numwords( :group => 1 ).should == "one, two, three, four, five, six, seven, eight"
		end

		it "can transform 12_345_678 into english words in double-digit groups" do
			"12_345_678".en.numwords( :group => 2 ).should == "twelve, thirty-four, fifty-six, seventy-eight"
		end

		it "can transform 12_345_678 into english words in triple-digit groups" do
			"12_345_678".en.numwords( :group => 3 ).should == "one twenty-three, four fifty-six, seventy-eight"
		end


		it "can transform 1234,5678 into english words" do
			"1234,5678".en.numwords.should == "twelve million, three hundred and forty-five thousand, six hundred and seventy-eight"
		end

		it "can transform 1234,5678 into english words in single-digit groups" do
			"1234,5678".en.numwords( :group => 1 ).should == "one, two, three, four, five, six, seven, eight"
		end

		it "can transform 1234,5678 into english words in double-digit groups" do
			"1234,5678".en.numwords( :group => 2 ).should == "twelve, thirty-four, fifty-six, seventy-eight"
		end

		it "can transform 1234,5678 into english words in triple-digit groups" do
			"1234,5678".en.numwords( :group => 3 ).should == "one twenty-three, four fifty-six, seventy-eight"
		end


		it "can transform 1234567890 into english words" do
			"1234567890".en.numwords.should == "one billion, two hundred and thirty-four million, five hundred and sixty-seven thousand, eight hundred and ninety"
		end

		it "can transform 1234567890 into english words in single-digit groups" do
			"1234567890".en.numwords( :group => 1 ).should == "one, two, three, four, five, six, seven, eight, nine, zero"
		end

		it "can transform 1234567890 into english words in double-digit groups" do
			"1234567890".en.numwords( :group => 2 ).should == "twelve, thirty-four, fifty-six, seventy-eight, ninety"
		end

		it "can transform 1234567890 into english words in triple-digit groups" do
			"1234567890".en.numwords( :group => 3 ).should == "one twenty-three, four fifty-six, seven eighty-nine, zero"
		end


		it "can transform the english words for 1234567890 into an ordinal" do
			"1234567890".en.numwords.en.ordinal.should == "one billion, two hundred and thirty-four million, five hundred and sixty-seven thousand, eight hundred and ninetieth"
		end


		it "can transform 123456789012345 into english words" do
			"123456789012345".en.numwords.should == "one hundred and twenty-three trillion, four hundred and fifty-six billion, seven hundred and eighty-nine million, twelve thousand, three hundred and forty-five"
		end

		it "can transform 123456789012345 into english words in single-digit groups" do
			"123456789012345".en.numwords( :group => 1 ).should == "one, two, three, four, five, six, seven, eight, nine, zero, one, two, three, four, five"
		end

		it "can transform 123456789012345 into english words in double-digit groups" do
			"123456789012345".en.numwords( :group => 2 ).should == "twelve, thirty-four, fifty-six, seventy-eight, ninety, twelve, thirty-four, five"
		end

		it "can transform 123456789012345 into english words in triple-digit groups" do
			"123456789012345".en.numwords( :group => 3 ).should == "one twenty-three, four fifty-six, seven eighty-nine, zero twelve, three forty-five"
		end


		it "can transform the english words for 123456789012345 into an ordinal" do
			"123456789012345".en.numwords.en.ordinal.should == "one hundred and twenty-three trillion, four hundred and fifty-six billion, seven hundred and eighty-nine million, twelve thousand, three hundred and forty-fifth"
		end


		it "can transform 12345678901234567890 into english words" do
			"12345678901234567890".en.numwords.should == "twelve quintillion, three hundred and forty-five quadrillion, six hundred and seventy-eight trillion, nine hundred and one billion, two hundred and thirty-four million, five hundred and sixty-seven thousand, eight hundred and ninety"
		end

		it "can transform 12345678901234567890 into english words in single-digit groups" do
			"12345678901234567890".en.numwords( :group => 1 ).should == "one, two, three, four, five, six, seven, eight, nine, zero, one, two, three, four, five, six, seven, eight, nine, zero"
		end

		it "can transform 12345678901234567890 into english words in double-digit groups" do
			"12345678901234567890".en.numwords( :group => 2 ).should == "twelve, thirty-four, fifty-six, seventy-eight, ninety, twelve, thirty-four, fifty-six, seventy-eight, ninety"
		end

		it "can transform 12345678901234567890 into english words in triple-digit groups" do
			"12345678901234567890".en.numwords( :group => 3 ).should == "one twenty-three, four fifty-six, seven eighty-nine, zero twelve, three forty-five, six seventy-eight, ninety"
		end


		it "can transform the english words for 12345678901234567890 into an ordinal" do
			"12345678901234567890".en.numwords.en.ordinal.should == "twelve quintillion, three hundred and forty-five quadrillion, six hundred and seventy-eight trillion, nine hundred and one billion, two hundred and thirty-four million, five hundred and sixty-seven thousand, eight hundred and ninetieth"
		end


		it "can transform 0.987654 into english words" do
			"0.987654".en.numwords.should == "zero point nine eight seven six five four"
		end

		it "can transform 0.987654 into english words in single-digit groups" do
			"0.987654".en.numwords( :group => 1 ).should == "zero, point, nine, eight, seven, six, five, four"
		end

		it "can transform 0.987654 into english words in double-digit groups" do
			"0.987654".en.numwords( :group => 2 ).should == "zero, point, ninety-eight, seventy-six, fifty-four"
		end

		it "can transform 0.987654 into english words in triple-digit groups" do
			"0.987654".en.numwords( :group => 3 ).should == "zero, point, nine eighty-seven, six fifty-four"
		end


		it "can transform the english words for 0.987654 into an ordinal" do
			"0.987654".en.numwords.en.ordinal.should == "zero point nine eight seven six five fourth"
		end


		it "can transform .987654 into english words" do
			".987654".en.numwords.should == "point nine eight seven six five four"
		end

		it "can transform .987654 into english words in single-digit groups" do
			".987654".en.numwords( :group => 1 ).should == "point, nine, eight, seven, six, five, four"
		end

		it "can transform .987654 into english words in double-digit groups" do
			".987654".en.numwords( :group => 2 ).should == "point, ninety-eight, seventy-six, fifty-four"
		end

		it "can transform .987654 into english words in triple-digit groups" do
			".987654".en.numwords( :group => 3 ).should == "point, nine eighty-seven, six fifty-four"
		end


		it "can transform the english words for .987654 into an ordinal" do
			".987654".en.numwords.en.ordinal.should == "point nine eight seven six five fourth"
		end


		it "can transform 9.87654 into english words" do
			"9.87654".en.numwords.should == "nine point eight seven six five four"
		end

		it "can transform 9.87654 into english words in single-digit groups" do
			"9.87654".en.numwords( :group => 1 ).should == "nine, point, eight, seven, six, five, four"
		end

		it "can transform 9.87654 into english words in double-digit groups" do
			"9.87654".en.numwords( :group => 2 ).should == "nine, point, eighty-seven, sixty-five, four"
		end

		it "can transform 9.87654 into english words in triple-digit groups" do
			"9.87654".en.numwords( :group => 3 ).should == "nine, point, eight seventy-six, fifty-four"
		end


		it "can transform the english words for 9.87654 into an ordinal" do
			"9.87654".en.numwords.en.ordinal.should == "nine point eight seven six five fourth"
		end


		it "can transform 98.7654 into english words" do
			"98.7654".en.numwords.should == "ninety-eight point seven six five four"
		end

		it "can transform 98.7654 into english words in single-digit groups" do
			"98.7654".en.numwords( :group => 1 ).should == "nine, eight, point, seven, six, five, four"
		end

		it "can transform 98.7654 into english words in double-digit groups" do
			"98.7654".en.numwords( :group => 2 ).should == "ninety-eight, point, seventy-six, fifty-four"
		end

		it "can transform 98.7654 into english words in triple-digit groups" do
			"98.7654".en.numwords( :group => 3 ).should == "ninety-eight, point, seven sixty-five, four"
		end


		it "can transform the english words for 98.7654 into an ordinal" do
			"98.7654".en.numwords.en.ordinal.should == "ninety-eight point seven six five fourth"
		end


		it "can transform 987.654 into english words" do
			"987.654".en.numwords.should == "nine hundred and eighty-seven point six five four"
		end

		it "can transform 987.654 into english words in single-digit groups" do
			"987.654".en.numwords( :group => 1 ).should == "nine, eight, seven, point, six, five, four"
		end

		it "can transform 987.654 into english words in double-digit groups" do
			"987.654".en.numwords( :group => 2 ).should == "ninety-eight, seven, point, sixty-five, four"
		end

		it "can transform 987.654 into english words in triple-digit groups" do
			"987.654".en.numwords( :group => 3 ).should == "nine eighty-seven, point, six fifty-four"
		end


		it "can transform the english words for 987.654 into an ordinal" do
			"987.654".en.numwords.en.ordinal.should == "nine hundred and eighty-seven point six five fourth"
		end


		it "can transform 9876.54 into english words" do
			"9876.54".en.numwords.should == "nine thousand, eight hundred and seventy-six point five four"
		end

		it "can transform 9876.54 into english words in single-digit groups" do
			"9876.54".en.numwords( :group => 1 ).should == "nine, eight, seven, six, point, five, four"
		end

		it "can transform 9876.54 into english words in double-digit groups" do
			"9876.54".en.numwords( :group => 2 ).should == "ninety-eight, seventy-six, point, fifty-four"
		end

		it "can transform 9876.54 into english words in triple-digit groups" do
			"9876.54".en.numwords( :group => 3 ).should == "nine eighty-seven, six, point, fifty-four"
		end


		it "can transform the english words for 9876.54 into an ordinal" do
			"9876.54".en.numwords.en.ordinal.should == "nine thousand, eight hundred and seventy-six point five fourth"
		end


		it "can transform 98765.4 into english words" do
			"98765.4".en.numwords.should == "ninety-eight thousand, seven hundred and sixty-five point four"
		end

		it "can transform 98765.4 into english words in single-digit groups" do
			"98765.4".en.numwords( :group => 1 ).should == "nine, eight, seven, six, five, point, four"
		end

		it "can transform 98765.4 into english words in double-digit groups" do
			"98765.4".en.numwords( :group => 2 ).should == "ninety-eight, seventy-six, five, point, four"
		end

		it "can transform 98765.4 into english words in triple-digit groups" do
			"98765.4".en.numwords( :group => 3 ).should == "nine eighty-seven, sixty-five, point, four"
		end


		it "can transform the english words for 98765.4 into an ordinal" do
			"98765.4".en.numwords.en.ordinal.should == "ninety-eight thousand, seven hundred and sixty-five point fourth"
		end


		it "can transform 101.202.303 into english words" do
			"101.202.303".en.numwords.should == "one hundred and one point two zero two three zero three"
		end

		it "can transform 101.202.303 into english words in single-digit groups" do
			"101.202.303".en.numwords( :group => 1 ).should == "one, zero, one, point, two, zero, two, point, three, zero, three"
		end

		it "can transform 101.202.303 into english words in double-digit groups" do
			"101.202.303".en.numwords( :group => 2 ).should == "ten, one, point, twenty, two, point, thirty, three"
		end

		it "can transform 101.202.303 into english words in triple-digit groups" do
			"101.202.303".en.numwords( :group => 3 ).should == "one zero one, point, two zero two, point, three zero three"
		end
	end


	describe "quantification" do
		it "quantifies 0 objects as 'no'" do
			"driver".en.quantify( 0 ).should == 'no drivers'
		end

		it "quantifies 1 object as 'a'" do
			"driver".en.quantify( 1 ).should == 'a driver'
		end

		it "quantifies 1 object that starts with a vowel sound as 'an'" do
			"hour".en.quantify( 1 ).should == 'an hour'
		end

		it "quantifies 2-5 objects as 'several'" do
			"driver".en.quantify( 4 ).should == 'several drivers'
		end

		it "quantifies 6-19 objects as 'a number of'" do
			"driver".en.quantify( 11 ).should == 'a number of drivers'
		end

		it "quantifies 20-45 objects as 'numerous'" do
			"driver".en.quantify( 41 ).should == 'numerous drivers'
		end

		it "quantifies 46-99 objects as 'many'" do
			"driver".en.quantify( 58 ).should == 'many drivers'
		end

		it "quantifies 100-999 objects as 'hundreds of'" do
			"driver".en.quantify( 318 ).should == 'hundreds of drivers'
		end

		it "quantifies 1000-9999 objects as 'thousands of'" do
			"driver".en.quantify( 4158 ).should == 'thousands of drivers'
		end

		it "quantifies 10000-99999 objects as 'tens of thousands of'" do
			"driver".en.quantify( 14158 ).should == 'tens of thousands of drivers'
		end

		it "quantifies 100000-999999 objects as 'hundreds of thousands of'" do
			"driver".en.quantify( 614158 ).should == 'hundreds of thousands of drivers'
		end

		it "quantifies 2.6M objects as 'millions of'" do
			"driver".en.quantify( 2614158 ).should == 'millions of drivers'
		end

		it "quantifies 8.122B objects as 'billions of'" do
			"driver".en.quantify( 8122614158 ).should == 'billions of drivers'
		end


	end

end

