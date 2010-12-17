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
			"0".en.numwords == "zero"
		end

		it "can transform 0 into english words in single-digit groups" do
			"0".en.numwords( :group => 1 ) == "zero"
		end

		it "can transform 0 into english words in double-digit groups" do
			"0".en.numwords( :group => 2 ) == "zero"
		end

		it "can transform 0 into english words in triple-digit groups" do
			"0".en.numwords( :group => 3 ) == "zero"
		end


		it "can transform the english words for 0 into an ordinal" do
			"0".en.numwords.en.ordinal.should == "zeroth"
		end


		it "can transform 1 into english words" do
			"1".en.numwords == "one"
		end

		it "can transform 1 into english words in single-digit groups" do
			"1".en.numwords( :group => 1 ) == "one"
		end

		it "can transform 1 into english words in double-digit groups" do
			"1".en.numwords( :group => 2 ) == "one"
		end

		it "can transform 1 into english words in triple-digit groups" do
			"1".en.numwords( :group => 3 ) == "one"
		end


		it "can transform the english words for 1 into an ordinal" do
			"1".en.numwords.en.ordinal.should == "first"
		end


		it "can transform 2 into english words" do
			"2".en.numwords == "two"
		end

		it "can transform 2 into english words in single-digit groups" do
			"2".en.numwords( :group => 1 ) == "two"
		end

		it "can transform 2 into english words in double-digit groups" do
			"2".en.numwords( :group => 2 ) == "two"
		end

		it "can transform 2 into english words in triple-digit groups" do
			"2".en.numwords( :group => 3 ) == "two"
		end


		it "can transform the english words for 2 into an ordinal" do
			"2".en.numwords.en.ordinal.should == "second"
		end


		it "can transform 3 into english words" do
			"3".en.numwords == "three"
		end

		it "can transform 3 into english words in single-digit groups" do
			"3".en.numwords( :group => 1 ) == "three"
		end

		it "can transform 3 into english words in double-digit groups" do
			"3".en.numwords( :group => 2 ) == "three"
		end

		it "can transform 3 into english words in triple-digit groups" do
			"3".en.numwords( :group => 3 ) == "three"
		end


		it "can transform the english words for 3 into an ordinal" do
			"3".en.numwords.en.ordinal.should == "third"
		end


		it "can transform 4 into english words" do
			"4".en.numwords == "four"
		end

		it "can transform 4 into english words in single-digit groups" do
			"4".en.numwords( :group => 1 ) == "four"
		end

		it "can transform 4 into english words in double-digit groups" do
			"4".en.numwords( :group => 2 ) == "four"
		end

		it "can transform 4 into english words in triple-digit groups" do
			"4".en.numwords( :group => 3 ) == "four"
		end


		it "can transform the english words for 4 into an ordinal" do
			"4".en.numwords.en.ordinal.should == "fourth"
		end


		it "can transform 5 into english words" do
			"5".en.numwords == "five"
		end

		it "can transform 5 into english words in single-digit groups" do
			"5".en.numwords( :group => 1 ) == "five"
		end

		it "can transform 5 into english words in double-digit groups" do
			"5".en.numwords( :group => 2 ) == "five"
		end

		it "can transform 5 into english words in triple-digit groups" do
			"5".en.numwords( :group => 3 ) == "five"
		end


		it "can transform the english words for 5 into an ordinal" do
			"5".en.numwords.en.ordinal.should == "fifth"
		end


		it "can transform 6 into english words" do
			"6".en.numwords == "six"
		end

		it "can transform 6 into english words in single-digit groups" do
			"6".en.numwords( :group => 1 ) == "six"
		end

		it "can transform 6 into english words in double-digit groups" do
			"6".en.numwords( :group => 2 ) == "six"
		end

		it "can transform 6 into english words in triple-digit groups" do
			"6".en.numwords( :group => 3 ) == "six"
		end


		it "can transform the english words for 6 into an ordinal" do
			"6".en.numwords.en.ordinal.should == "sixth"
		end


		it "can transform 7 into english words" do
			"7".en.numwords == "seven"
		end

		it "can transform 7 into english words in single-digit groups" do
			"7".en.numwords( :group => 1 ) == "seven"
		end

		it "can transform 7 into english words in double-digit groups" do
			"7".en.numwords( :group => 2 ) == "seven"
		end

		it "can transform 7 into english words in triple-digit groups" do
			"7".en.numwords( :group => 3 ) == "seven"
		end


		it "can transform the english words for 7 into an ordinal" do
			"7".en.numwords.en.ordinal.should == "seventh"
		end


		it "can transform 8 into english words" do
			"8".en.numwords == "eight"
		end

		it "can transform 8 into english words in single-digit groups" do
			"8".en.numwords( :group => 1 ) == "eight"
		end

		it "can transform 8 into english words in double-digit groups" do
			"8".en.numwords( :group => 2 ) == "eight"
		end

		it "can transform 8 into english words in triple-digit groups" do
			"8".en.numwords( :group => 3 ) == "eight"
		end


		it "can transform the english words for 8 into an ordinal" do
			"8".en.numwords.en.ordinal.should == "eighth"
		end


		it "can transform 9 into english words" do
			"9".en.numwords == "nine"
		end

		it "can transform 9 into english words in single-digit groups" do
			"9".en.numwords( :group => 1 ) == "nine"
		end

		it "can transform 9 into english words in double-digit groups" do
			"9".en.numwords( :group => 2 ) == "nine"
		end

		it "can transform 9 into english words in triple-digit groups" do
			"9".en.numwords( :group => 3 ) == "nine"
		end


		it "can transform the english words for 9 into an ordinal" do
			"9".en.numwords.en.ordinal.should == "ninth"
		end


		it "can transform 10 into english words" do
			"10".en.numwords == "ten"
		end

		it "can transform 10 into english words in single-digit groups" do
			"10".en.numwords( :group => 1 ) == "one, zero"
		end

		it "can transform 10 into english words in double-digit groups" do
			"10".en.numwords( :group => 2 ) == "ten"
		end

		it "can transform 10 into english words in triple-digit groups" do
			"10".en.numwords( :group => 3 ) == "ten"
		end


		it "can transform the english words for 10 into an ordinal" do
			"10".en.numwords.en.ordinal.should == "tenth"
		end


		it "can transform 11 into english words" do
			"11".en.numwords == "eleven"
		end

		it "can transform 11 into english words in single-digit groups" do
			"11".en.numwords( :group => 1 ) == "one, one"
		end

		it "can transform 11 into english words in double-digit groups" do
			"11".en.numwords( :group => 2 ) == "eleven"
		end

		it "can transform 11 into english words in triple-digit groups" do
			"11".en.numwords( :group => 3 ) == "eleven"
		end


		it "can transform the english words for 11 into an ordinal" do
			"11".en.numwords.en.ordinal.should == "eleventh"
		end


		it "can transform 12 into english words" do
			"12".en.numwords == "twelve"
		end

		it "can transform 12 into english words in single-digit groups" do
			"12".en.numwords( :group => 1 ) == "one, two"
		end

		it "can transform 12 into english words in double-digit groups" do
			"12".en.numwords( :group => 2 ) == "twelve"
		end

		it "can transform 12 into english words in triple-digit groups" do
			"12".en.numwords( :group => 3 ) == "twelve"
		end


		it "can transform the english words for 12 into an ordinal" do
			"12".en.numwords.en.ordinal.should == "twelfth"
		end


		it "can transform 13 into english words" do
			"13".en.numwords == "thirteen"
		end

		it "can transform 13 into english words in single-digit groups" do
			"13".en.numwords( :group => 1 ) == "one, three"
		end

		it "can transform 13 into english words in double-digit groups" do
			"13".en.numwords( :group => 2 ) == "thirteen"
		end

		it "can transform 13 into english words in triple-digit groups" do
			"13".en.numwords( :group => 3 ) == "thirteen"
		end


		it "can transform the english words for 13 into an ordinal" do
			"13".en.numwords.en.ordinal.should == "thirteenth"
		end


		it "can transform 14 into english words" do
			"14".en.numwords == "fourteen"
		end

		it "can transform 14 into english words in single-digit groups" do
			"14".en.numwords( :group => 1 ) == "one, four"
		end

		it "can transform 14 into english words in double-digit groups" do
			"14".en.numwords( :group => 2 ) == "fourteen"
		end

		it "can transform 14 into english words in triple-digit groups" do
			"14".en.numwords( :group => 3 ) == "fourteen"
		end


		it "can transform the english words for 14 into an ordinal" do
			"14".en.numwords.en.ordinal.should == "fourteenth"
		end


		it "can transform 15 into english words" do
			"15".en.numwords == "fifteen"
		end

		it "can transform 15 into english words in single-digit groups" do
			"15".en.numwords( :group => 1 ) == "one, five"
		end

		it "can transform 15 into english words in double-digit groups" do
			"15".en.numwords( :group => 2 ) == "fifteen"
		end

		it "can transform 15 into english words in triple-digit groups" do
			"15".en.numwords( :group => 3 ) == "fifteen"
		end


		it "can transform the english words for 15 into an ordinal" do
			"15".en.numwords.en.ordinal.should == "fifteenth"
		end


		it "can transform 16 into english words" do
			"16".en.numwords == "sixteen"
		end

		it "can transform 16 into english words in single-digit groups" do
			"16".en.numwords( :group => 1 ) == "one, six"
		end

		it "can transform 16 into english words in double-digit groups" do
			"16".en.numwords( :group => 2 ) == "sixteen"
		end

		it "can transform 16 into english words in triple-digit groups" do
			"16".en.numwords( :group => 3 ) == "sixteen"
		end


		it "can transform the english words for 16 into an ordinal" do
			"16".en.numwords.en.ordinal.should == "sixteenth"
		end


		it "can transform 17 into english words" do
			"17".en.numwords == "seventeen"
		end

		it "can transform 17 into english words in single-digit groups" do
			"17".en.numwords( :group => 1 ) == "one, seven"
		end

		it "can transform 17 into english words in double-digit groups" do
			"17".en.numwords( :group => 2 ) == "seventeen"
		end

		it "can transform 17 into english words in triple-digit groups" do
			"17".en.numwords( :group => 3 ) == "seventeen"
		end


		it "can transform the english words for 17 into an ordinal" do
			"17".en.numwords.en.ordinal.should == "seventeenth"
		end


		it "can transform 18 into english words" do
			"18".en.numwords == "eighteen"
		end

		it "can transform 18 into english words in single-digit groups" do
			"18".en.numwords( :group => 1 ) == "one, eight"
		end

		it "can transform 18 into english words in double-digit groups" do
			"18".en.numwords( :group => 2 ) == "eighteen"
		end

		it "can transform 18 into english words in triple-digit groups" do
			"18".en.numwords( :group => 3 ) == "eighteen"
		end


		it "can transform the english words for 18 into an ordinal" do
			"18".en.numwords.en.ordinal.should == "eighteenth"
		end


		it "can transform 19 into english words" do
			"19".en.numwords == "nineteen"
		end

		it "can transform 19 into english words in single-digit groups" do
			"19".en.numwords( :group => 1 ) == "one, nine"
		end

		it "can transform 19 into english words in double-digit groups" do
			"19".en.numwords( :group => 2 ) == "nineteen"
		end

		it "can transform 19 into english words in triple-digit groups" do
			"19".en.numwords( :group => 3 ) == "nineteen"
		end


		it "can transform the english words for 19 into an ordinal" do
			"19".en.numwords.en.ordinal.should == "nineteenth"
		end


		it "can transform 20 into english words" do
			"20".en.numwords == "twenty"
		end

		it "can transform 20 into english words in single-digit groups" do
			"20".en.numwords( :group => 1 ) == "two, zero"
		end

		it "can transform 20 into english words in double-digit groups" do
			"20".en.numwords( :group => 2 ) == "twenty"
		end

		it "can transform 20 into english words in triple-digit groups" do
			"20".en.numwords( :group => 3 ) == "twenty"
		end


		it "can transform the english words for 20 into an ordinal" do
			"20".en.numwords.en.ordinal.should == "twentieth"
		end


		it "can transform 21 into english words" do
			"21".en.numwords == "twenty-one"
		end

		it "can transform 21 into english words in single-digit groups" do
			"21".en.numwords( :group => 1 ) == "two, one"
		end

		it "can transform 21 into english words in double-digit groups" do
			"21".en.numwords( :group => 2 ) == "twenty-one"
		end

		it "can transform 21 into english words in triple-digit groups" do
			"21".en.numwords( :group => 3 ) == "twenty-one"
		end


		it "can transform the english words for 21 into an ordinal" do
			"21".en.numwords.en.ordinal.should == "twenty-first"
		end


		it "can transform 29 into english words" do
			"29".en.numwords == "twenty-nine"
		end

		it "can transform 29 into english words in single-digit groups" do
			"29".en.numwords( :group => 1 ) == "two, nine"
		end

		it "can transform 29 into english words in double-digit groups" do
			"29".en.numwords( :group => 2 ) == "twenty-nine"
		end

		it "can transform 29 into english words in triple-digit groups" do
			"29".en.numwords( :group => 3 ) == "twenty-nine"
		end


		it "can transform the english words for 29 into an ordinal" do
			"29".en.numwords.en.ordinal.should == "twenty-ninth"
		end


		it "can transform 99 into english words" do
			"99".en.numwords == "ninety-nine"
		end

		it "can transform 99 into english words in single-digit groups" do
			"99".en.numwords( :group => 1 ) == "nine, nine"
		end

		it "can transform 99 into english words in double-digit groups" do
			"99".en.numwords( :group => 2 ) == "ninety-nine"
		end

		it "can transform 99 into english words in triple-digit groups" do
			"99".en.numwords( :group => 3 ) == "ninety-nine"
		end


		it "can transform the english words for 99 into an ordinal" do
			"99".en.numwords.en.ordinal.should == "ninety-ninth"
		end


		it "can transform 100 into english words" do
			"100".en.numwords == "one hundred"
		end

		it "can transform 100 into english words in single-digit groups" do
			"100".en.numwords( :group => 1 ) == "one, zero, zero"
		end

		it "can transform 100 into english words in double-digit groups" do
			"100".en.numwords( :group => 2 ) == "ten, zero"
		end

		it "can transform 100 into english words in triple-digit groups" do
			"100".en.numwords( :group => 3 ) == "one zero zero"
		end


		it "can transform the english words for 100 into an ordinal" do
			"100".en.numwords.en.ordinal.should == "one hundredth"
		end


		it "can transform 101 into english words" do
			"101".en.numwords == "one hundred and one"
		end

		it "can transform 101 into english words in single-digit groups" do
			"101".en.numwords( :group => 1 ) == "one, zero, one"
		end

		it "can transform 101 into english words in double-digit groups" do
			"101".en.numwords( :group => 2 ) == "ten, one"
		end

		it "can transform 101 into english words in triple-digit groups" do
			"101".en.numwords( :group => 3 ) == "one zero one"
		end


		it "can transform the english words for 101 into an ordinal" do
			"101".en.numwords.en.ordinal.should == "one hundred and first"
		end

		it "can transform the english words for 101 into an ordinal" do
			"101".en.numwords.en.ordinal.should == "one hundred and first"
		end


		it "can transform 110 into english words" do
			"110".en.numwords == "one hundred and ten"
		end

		it "can transform 110 into english words in single-digit groups" do
			"110".en.numwords( :group => 1 ) == "one, one, zero"
		end

		it "can transform 110 into english words in double-digit groups" do
			"110".en.numwords( :group => 2 ) == "eleven, zero"
		end

		it "can transform 110 into english words in triple-digit groups" do
			"110".en.numwords( :group => 3 ) == "one ten"
		end


		it "can transform the english words for 110 into an ordinal" do
			"110".en.numwords.en.ordinal.should == "one hundred and tenth"
		end


		it "can transform 111 into english words" do
			"111".en.numwords == "one hundred and eleven"
		end

		it "can transform 111 into english words in single-digit groups" do
			"111".en.numwords( :group => 1 ) == "one, one, one"
		end

		it "can transform 111 into english words in double-digit groups" do
			"111".en.numwords( :group => 2 ) == "eleven, one"
		end

		it "can transform 111 into english words in triple-digit groups" do
			"111".en.numwords( :group => 3 ) == "one eleven"
		end


		it "can transform the english words for 111 into an ordinal" do
			"111".en.numwords.en.ordinal.should == "one hundred and eleventh"
		end


		it "can transform 900 into english words" do
			"900".en.numwords == "nine hundred"
		end

		it "can transform 900 into english words in single-digit groups" do
			"900".en.numwords( :group => 1 ) == "nine, zero, zero"
		end

		it "can transform 900 into english words in double-digit groups" do
			"900".en.numwords( :group => 2 ) == "ninety, zero"
		end

		it "can transform 900 into english words in triple-digit groups" do
			"900".en.numwords( :group => 3 ) == "nine zero zero"
		end


		it "can transform the english words for 900 into an ordinal" do
			"900".en.numwords.en.ordinal.should == "nine hundredth"
		end


		it "can transform 999 into english words" do
			"999".en.numwords == "nine hundred and ninety-nine"
		end

		it "can transform 999 into english words in single-digit groups" do
			"999".en.numwords( :group => 1 ) == "nine, nine, nine"
		end

		it "can transform 999 into english words in double-digit groups" do
			"999".en.numwords( :group => 2 ) == "ninety-nine, nine"
		end

		it "can transform 999 into english words in triple-digit groups" do
			"999".en.numwords( :group => 3 ) == "nine ninety-nine"
		end


		it "can transform the english words for 999 into an ordinal" do
			"999".en.numwords.en.ordinal.should == "nine hundred and ninety-ninth"
		end


		it "can transform 1000 into english words" do
			"1000".en.numwords == "one thousand"
		end

		it "can transform 1000 into english words in single-digit groups" do
			"1000".en.numwords( :group => 1 ) == "one, zero, zero, zero"
		end

		it "can transform 1000 into english words in double-digit groups" do
			"1000".en.numwords( :group => 2 ) == "ten, zero zero"
		end

		it "can transform 1000 into english words in triple-digit groups" do
			"1000".en.numwords( :group => 3 ) == "one zero zero, zero"
		end


		it "can transform the english words for 1000 into an ordinal" do
			"1000".en.numwords.en.ordinal.should == "one thousandth"
		end


		it "can transform 1001 into english words" do
			"1001".en.numwords == "one thousand and one"
		end

		it "can transform 1001 into english words in single-digit groups" do
			"1001".en.numwords( :group => 1 ) == "one, zero, zero, one"
		end

		it "can transform 1001 into english words in double-digit groups" do
			"1001".en.numwords( :group => 2 ) == "ten, zero one"
		end

		it "can transform 1001 into english words in triple-digit groups" do
			"1001".en.numwords( :group => 3 ) == "one zero zero, one"
		end


		it "can transform the english words for 1001 into an ordinal" do
			"1001".en.numwords.en.ordinal.should == "one thousand and first"
		end


		it "can transform 1010 into english words" do
			"1010".en.numwords == "one thousand and ten"
		end

		it "can transform 1010 into english words in single-digit groups" do
			"1010".en.numwords( :group => 1 ) == "one, zero, one, zero"
		end

		it "can transform 1010 into english words in double-digit groups" do
			"1010".en.numwords( :group => 2 ) == "ten, ten"
		end

		it "can transform 1010 into english words in triple-digit groups" do
			"1010".en.numwords( :group => 3 ) == "one zero one, zero"
		end


		it "can transform the english words for 1010 into an ordinal" do
			"1010".en.numwords.en.ordinal.should == "one thousand and tenth"
		end


		it "can transform 1100 into english words" do
			"1100".en.numwords == "one thousand, one hundred"
		end

		it "can transform 1100 into english words in single-digit groups" do
			"1100".en.numwords( :group => 1 ) == "one, one, zero, zero"
		end

		it "can transform 1100 into english words in double-digit groups" do
			"1100".en.numwords( :group => 2 ) == "eleven, zero zero"
		end

		it "can transform 1100 into english words in triple-digit groups" do
			"1100".en.numwords( :group => 3 ) == "one ten, zero"
		end


		it "can transform the english words for 1100 into an ordinal" do
			"1100".en.numwords.en.ordinal.should == "one thousand, one hundredth"
		end


		it "can transform 2000 into english words" do
			"2000".en.numwords == "two thousand"
		end

		it "can transform 2000 into english words in single-digit groups" do
			"2000".en.numwords( :group => 1 ) == "two, zero, zero, zero"
		end

		it "can transform 2000 into english words in double-digit groups" do
			"2000".en.numwords( :group => 2 ) == "twenty, zero zero"
		end

		it "can transform 2000 into english words in triple-digit groups" do
			"2000".en.numwords( :group => 3 ) == "two zero zero, zero"
		end


		it "can transform the english words for 2000 into an ordinal" do
			"2000".en.numwords.en.ordinal.should == "two thousandth"
		end


		it "can transform 10000 into english words" do
			"10000".en.numwords == "ten thousand"
		end

		it "can transform 10000 into english words in single-digit groups" do
			"10000".en.numwords( :group => 1 ) == "one, zero, zero, zero, zero"
		end

		it "can transform 10000 into english words in double-digit groups" do
			"10000".en.numwords( :group => 2 ) == "ten, zero zero, zero"
		end

		it "can transform 10000 into english words in triple-digit groups" do
			"10000".en.numwords( :group => 3 ) == "one zero zero, zero zero"
		end


		it "can transform the english words for 10000 into an ordinal" do
			"10000".en.numwords.en.ordinal.should == "ten thousandth"
		end


		it "can transform 100000 into english words" do
			"100000".en.numwords == "one hundred thousand"
		end

		it "can transform 100000 into english words in single-digit groups" do
			"100000".en.numwords( :group => 1 ) == "one, zero, zero, zero, zero, zero"
		end

		it "can transform 100000 into english words in double-digit groups" do
			"100000".en.numwords( :group => 2 ) == "ten, zero zero, zero zero"
		end

		it "can transform 100000 into english words in triple-digit groups" do
			"100000".en.numwords( :group => 3 ) == "one zero zero, zero zero zero"
		end


		it "can transform the english words for 100000 into an ordinal" do
			"100000".en.numwords.en.ordinal.should == "one hundred thousandth"
		end


		it "can transform 100001 into english words" do
			"100001".en.numwords == "one hundred thousand and one"
		end

		it "can transform 100001 into english words in single-digit groups" do
			"100001".en.numwords( :group => 1 ) == "one, zero, zero, zero, zero, one"
		end

		it "can transform 100001 into english words in double-digit groups" do
			"100001".en.numwords( :group => 2 ) == "ten, zero zero, zero one"
		end

		it "can transform 100001 into english words in triple-digit groups" do
			"100001".en.numwords( :group => 3 ) == "one zero zero, zero zero one"
		end


		it "can transform the english words for 100001 into an ordinal" do
			"100001".en.numwords.en.ordinal.should == "one hundred thousand and first"
		end


		it "can transform 123456 into english words" do
			"123456".en.numwords == "one hundred and twenty-three thousand, four hundred and fifty-six"
		end

		it "can transform 123456 into english words in single-digit groups" do
			"123456".en.numwords( :group => 1 ) == "one, two, three, four, five, six"
		end

		it "can transform 123456 into english words in double-digit groups" do
			"123456".en.numwords( :group => 2 ) == "twelve, thirty-four, fifty-six"
		end

		it "can transform 123456 into english words in triple-digit groups" do
			"123456".en.numwords( :group => 3 ) == "one twenty-three, four fifty-six"
		end


		it "can transform the english words for 123456 into an ordinal" do
			"123456".en.numwords.en.ordinal.should == "one hundred and twenty-three thousand, four hundred and fifty-sixth"
		end


		it "can transform 0123456 into english words" do
			"0123456".en.numwords == "one hundred and twenty-three thousand, four hundred and fifty-six"
		end

		it "can transform 0123456 into english words in single-digit groups" do
			"0123456".en.numwords( :group => 1 ) == "zero, one, two, three, four, five, six"
		end

		it "can transform 0123456 into english words in double-digit groups" do
			"0123456".en.numwords( :group => 2 ) == "zero one, twenty-three, forty-five, six"
		end

		it "can transform 0123456 into english words in triple-digit groups" do
			"0123456".en.numwords( :group => 3 ) == "zero twelve, three forty-five, six"
		end


		it "can transform the english words for 0123456 into an ordinal" do
			"0123456".en.numwords.en.ordinal.should == "one hundred and twenty-three thousand, four hundred and fifty-sixth"
		end


		it "can transform 1234567 into english words" do
			"1234567".en.numwords == "one million, two hundred and thirty-four thousand, five hundred and sixty-seven"
		end

		it "can transform 1234567 into english words in single-digit groups" do
			"1234567".en.numwords( :group => 1 ) == "one, two, three, four, five, six, seven"
		end

		it "can transform 1234567 into english words in double-digit groups" do
			"1234567".en.numwords( :group => 2 ) == "twelve, thirty-four, fifty-six, seven"
		end

		it "can transform 1234567 into english words in triple-digit groups" do
			"1234567".en.numwords( :group => 3 ) == "one twenty-three, four fifty-six, seven"
		end


		it "can transform the english words for 1234567 into an ordinal" do
			"1234567".en.numwords.en.ordinal.should == "one million, two hundred and thirty-four thousand, five hundred and sixty-seventh"
		end


		it "can transform 12345678 into english words" do
			"12345678".en.numwords == "twelve million, three hundred and forty-five thousand, six hundred and seventy-eight"
		end

		it "can transform 12345678 into english words in single-digit groups" do
			"12345678".en.numwords( :group => 1 ) == "one, two, three, four, five, six, seven, eight"
		end

		it "can transform 12345678 into english words in double-digit groups" do
			"12345678".en.numwords( :group => 2 ) == "twelve, thirty-four, fifty-six, seventy-eight"
		end

		it "can transform 12345678 into english words in triple-digit groups" do
			"12345678".en.numwords( :group => 3 ) == "one twenty-three, four fifty-six, seventy-eight"
		end


		it "can transform the english words for 12345678 into an ordinal" do
			"12345678".en.numwords.en.ordinal.should == "twelve million, three hundred and forty-five thousand, six hundred and seventy-eighth"
		end


		it "can transform 12_345_678 into english words" do
			"12_345_678".en.numwords == "twelve million, three hundred and forty-five thousand, six hundred and seventy-eight"
		end

		it "can transform 12_345_678 into english words in single-digit groups" do
			"12_345_678".en.numwords( :group => 1 ) == "one, two, three, four, five, six, seven, eight"
		end

		it "can transform 12_345_678 into english words in double-digit groups" do
			"12_345_678".en.numwords( :group => 2 ) == "twelve, thirty-four, fifty-six, seventy-eight"
		end

		it "can transform 12_345_678 into english words in triple-digit groups" do
			"12_345_678".en.numwords( :group => 3 ) == "one twenty-three, four fifty-six, seventy-eight"
		end


		it "can transform 1234,5678 into english words" do
			"1234,5678".en.numwords == "twelve million, three hundred and forty-five thousand, six hundred and seventy-eight"
		end

		it "can transform 1234,5678 into english words in single-digit groups" do
			"1234,5678".en.numwords( :group => 1 ) == "one, two, three, four, five, six, seven, eight"
		end

		it "can transform 1234,5678 into english words in double-digit groups" do
			"1234,5678".en.numwords( :group => 2 ) == "twelve, thirty-four, fifty-six, seventy-eight"
		end

		it "can transform 1234,5678 into english words in triple-digit groups" do
			"1234,5678".en.numwords( :group => 3 ) == "one twenty-three, four fifty-six, seventy-eight"
		end


		it "can transform 1234567890 into english words" do
			"1234567890".en.numwords == "one billion, two hundred and thirty-four million, five hundred and sixty-seven thousand, eight hundred and ninety"
		end

		it "can transform 1234567890 into english words in single-digit groups" do
			"1234567890".en.numwords( :group => 1 ) == "one, two, three, four, five, six, seven, eight, nine, zero"
		end

		it "can transform 1234567890 into english words in double-digit groups" do
			"1234567890".en.numwords( :group => 2 ) == "twelve, thirty-four, fifty-six, seventy-eight, ninety"
		end

		it "can transform 1234567890 into english words in triple-digit groups" do
			"1234567890".en.numwords( :group => 3 ) == "one twenty-three, four fifty-six, seven eighty-nine, zero"
		end


		it "can transform the english words for 1234567890 into an ordinal" do
			"1234567890".en.numwords.en.ordinal.should == "one billion, two hundred and thirty-four million, five hundred and sixty-seven thousand, eight hundred and ninetieth"
		end


		it "can transform 123456789012345 into english words" do
			"123456789012345".en.numwords == "one hundred and twenty-three trillion, four hundred and fifty-six billion, seven hundred and eighty-nine million, twelve thousand, three hundred and forty-five"
		end

		it "can transform 123456789012345 into english words in single-digit groups" do
			"123456789012345".en.numwords( :group => 1 ) == "one, two, three, four, five, six, seven, eight, nine, zero, one, two, three, four, five"
		end

		it "can transform 123456789012345 into english words in double-digit groups" do
			"123456789012345".en.numwords( :group => 2 ) == "twelve, thirty-four, fifty-six, seventy-eight, ninety, twelve, thirty-four, five"
		end

		it "can transform 123456789012345 into english words in triple-digit groups" do
			"123456789012345".en.numwords( :group => 3 ) == "one twenty-three, four fifty-six, seven eighty-nine, zero twelve, three forty-five"
		end


		it "can transform the english words for 123456789012345 into an ordinal" do
			"123456789012345".en.numwords.en.ordinal.should == "one hundred and twenty-three trillion, four hundred and fifty-six billion, seven hundred and eighty-nine million, twelve thousand, three hundred and forty-fifth"
		end


		it "can transform 12345678901234567890 into english words" do
			"12345678901234567890".en.numwords == "twelve quintillion, three hundred and forty-five quadrillion, six hundred and seventy-eight trillion, nine hundred and one billion, two hundred and thirty-four million, five hundred and sixty-seven thousand, eight hundred and ninety"
		end

		it "can transform 12345678901234567890 into english words in single-digit groups" do
			"12345678901234567890".en.numwords( :group => 1 ) == "one, two, three, four, five, six, seven, eight, nine, zero, one, two, three, four, five, six, seven, eight, nine, zero"
		end

		it "can transform 12345678901234567890 into english words in double-digit groups" do
			"12345678901234567890".en.numwords( :group => 2 ) == "twelve, thirty-four, fifty-six, seventy-eight, ninety, twelve, thirty-four, fifty-six, seventy-eight, ninety"
		end

		it "can transform 12345678901234567890 into english words in triple-digit groups" do
			"12345678901234567890".en.numwords( :group => 3 ) == "one twenty-three, four fifty-six, seven eighty-nine, zero twelve, three forty-five, six seventy-eight, ninety"
		end


		it "can transform the english words for 12345678901234567890 into an ordinal" do
			"12345678901234567890".en.numwords.en.ordinal.should == "twelve quintillion, three hundred and forty-five quadrillion, six hundred and seventy-eight trillion, nine hundred and one billion, two hundred and thirty-four million, five hundred and sixty-seven thousand, eight hundred and ninetieth"
		end


		it "can transform 0.987654 into english words" do
			"0.987654".en.numwords == "zero point nine eight seven six five four"
		end

		it "can transform 0.987654 into english words in single-digit groups" do
			"0.987654".en.numwords( :group => 1 ) == "zero, point, nine, eight, seven, six, five, four"
		end

		it "can transform 0.987654 into english words in double-digit groups" do
			"0.987654".en.numwords( :group => 2 ) == "zero, point, ninety-eight, seventy-six, fifty-four"
		end

		it "can transform 0.987654 into english words in triple-digit groups" do
			"0.987654".en.numwords( :group => 3 ) == "zero, point, nine eighty-seven, six fifty-four"
		end


		it "can transform the english words for 0.987654 into an ordinal" do
			"0.987654".en.numwords.en.ordinal.should == "zero point nine eight seven six five fourth"
		end


		it "can transform .987654 into english words" do
			".987654".en.numwords == "point nine eight seven six five four"
		end

		it "can transform .987654 into english words in single-digit groups" do
			".987654".en.numwords( :group => 1 ) == "point, nine, eight, seven, six, five, four"
		end

		it "can transform .987654 into english words in double-digit groups" do
			".987654".en.numwords( :group => 2 ) == "point, ninety-eight, seventy-six, fifty-four"
		end

		it "can transform .987654 into english words in triple-digit groups" do
			".987654".en.numwords( :group => 3 ) == "point, nine eighty-seven, six fifty-four"
		end


		it "can transform the english words for .987654 into an ordinal" do
			".987654".en.numwords.en.ordinal.should == "point nine eight seven six five fourth"
		end


		it "can transform 9.87654 into english words" do
			"9.87654".en.numwords == "nine point eight seven six five four"
		end

		it "can transform 9.87654 into english words in single-digit groups" do
			"9.87654".en.numwords( :group => 1 ) == "nine, point, eight, seven, six, five, four"
		end

		it "can transform 9.87654 into english words in double-digit groups" do
			"9.87654".en.numwords( :group => 2 ) == "nine, point, eighty-seven, sixty-five, four"
		end

		it "can transform 9.87654 into english words in triple-digit groups" do
			"9.87654".en.numwords( :group => 3 ) == "nine, point, eight seventy-six, fifty-four"
		end


		it "can transform the english words for 9.87654 into an ordinal" do
			"9.87654".en.numwords.en.ordinal.should == "nine point eight seven six five fourth"
		end


		it "can transform 98.7654 into english words" do
			"98.7654".en.numwords == "ninety-eight point seven six five four"
		end

		it "can transform 98.7654 into english words in single-digit groups" do
			"98.7654".en.numwords( :group => 1 ) == "nine, eight, point, seven, six, five, four"
		end

		it "can transform 98.7654 into english words in double-digit groups" do
			"98.7654".en.numwords( :group => 2 ) == "ninety-eight, point, seventy-six, fifty-four"
		end

		it "can transform 98.7654 into english words in triple-digit groups" do
			"98.7654".en.numwords( :group => 3 ) == "ninety-eight, point, seven sixty-five, four"
		end


		it "can transform the english words for 98.7654 into an ordinal" do
			"98.7654".en.numwords.en.ordinal.should == "ninety-eight point seven six five fourth"
		end


		it "can transform 987.654 into english words" do
			"987.654".en.numwords == "nine hundred and eighty-seven point six five four"
		end

		it "can transform 987.654 into english words in single-digit groups" do
			"987.654".en.numwords( :group => 1 ) == "nine, eight, seven, point, six, five, four"
		end

		it "can transform 987.654 into english words in double-digit groups" do
			"987.654".en.numwords( :group => 2 ) == "ninety-eight, seven, point, sixty-five, four"
		end

		it "can transform 987.654 into english words in triple-digit groups" do
			"987.654".en.numwords( :group => 3 ) == "nine eighty-seven, point, six fifty-four"
		end


		it "can transform the english words for 987.654 into an ordinal" do
			"987.654".en.numwords.en.ordinal.should == "nine hundred and eighty-seven point six five fourth"
		end


		it "can transform 9876.54 into english words" do
			"9876.54".en.numwords == "nine thousand, eight hundred and seventy-six point five four"
		end

		it "can transform 9876.54 into english words in single-digit groups" do
			"9876.54".en.numwords( :group => 1 ) == "nine, eight, seven, six, point, five, four"
		end

		it "can transform 9876.54 into english words in double-digit groups" do
			"9876.54".en.numwords( :group => 2 ) == "ninety-eight, seventy-six, point, fifty-four"
		end

		it "can transform 9876.54 into english words in triple-digit groups" do
			"9876.54".en.numwords( :group => 3 ) == "nine eighty-seven, six, point, fifty-four"
		end


		it "can transform the english words for 9876.54 into an ordinal" do
			"9876.54".en.numwords.en.ordinal.should == "nine thousand, eight hundred and seventy-six point five fourth"
		end


		it "can transform 98765.4 into english words" do
			"98765.4".en.numwords == "ninety-eight thousand, seven hundred and sixty-five point four"
		end

		it "can transform 98765.4 into english words in single-digit groups" do
			"98765.4".en.numwords( :group => 1 ) == "nine, eight, seven, six, five, point, four"
		end

		it "can transform 98765.4 into english words in double-digit groups" do
			"98765.4".en.numwords( :group => 2 ) == "ninety-eight, seventy-six, five, point, four"
		end

		it "can transform 98765.4 into english words in triple-digit groups" do
			"98765.4".en.numwords( :group => 3 ) == "nine eighty-seven, sixty-five, point, four"
		end


		it "can transform the english words for 98765.4 into an ordinal" do
			"98765.4".en.numwords.en.ordinal.should == "ninety-eight thousand, seven hundred and sixty-five point fourth"
		end


		it "can transform 101.202.303 into english words" do
			"101.202.303".en.numwords == "one hundred and one point two zero two three zero three"
		end

		it "can transform 101.202.303 into english words in single-digit groups" do
			"101.202.303".en.numwords( :group => 1 ) == "one, zero, one, point, two, zero, two, point, three, zero, three"
		end

		it "can transform 101.202.303 into english words in double-digit groups" do
			"101.202.303".en.numwords( :group => 2 ) == "ten, one, point, twenty, two, point, thirty, three"
		end

		it "can transform 101.202.303 into english words in triple-digit groups" do
			"101.202.303".en.numwords( :group => 3 ) == "one zero one, point, two zero two, point, three zero three"
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

