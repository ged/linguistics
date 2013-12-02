#!/usr/bin/env spec -cfs

require_relative '../../helpers'

require 'rspec'

require 'linguistics'
require 'linguistics/en/numbers'


describe Linguistics::EN::Numbers do

	before( :all ) do
		Linguistics.use( :en )
	end


	it "adds EN::Numbers to the list of English language modules" do
		expect( Linguistics::EN ).to have_extension( :numbers )
	end


	describe "numbers to words" do

		it "can transform 0 into english words" do
			expect( "0".en.numwords ).to eq( "zero" )
		end

		it "can transform 0 into english words in single-digit groups" do
			expect( "0".en.numwords(group: 1) ).to eq( "zero" )
		end

		it "can transform 0 into english words in double-digit groups" do
			expect( "0".en.numwords(group: 2) ).to eq( "zero" )
		end

		it "can transform 0 into english words in triple-digit groups" do
			expect( "0".en.numwords(group: 3) ).to eq( "zero" )
		end


		it "can transform the english words for 0 into an ordinal" do
			expect( "0".en.numwords.en.ordinal ).to eq( "zeroth" )
		end


		it "can transform 1 into english words" do
			expect( "1".en.numwords ).to eq( "one" )
		end

		it "can transform 1 into english words in single-digit groups" do
			expect( "1".en.numwords(group: 1) ).to eq( "one" )
		end

		it "can transform 1 into english words in double-digit groups" do
			expect( "1".en.numwords(group: 2) ).to eq( "one" )
		end

		it "can transform 1 into english words in triple-digit groups" do
			expect( "1".en.numwords(group: 3) ).to eq( "one" )
		end


		it "can transform the english words for 1 into an ordinal" do
			expect( "1".en.numwords.en.ordinal ).to eq( "first" )
		end


		it "can transform 2 into english words" do
			expect( "2".en.numwords ).to eq( "two" )
		end

		it "can transform 2 into english words in single-digit groups" do
			expect( "2".en.numwords(group: 1) ).to eq( "two" )
		end

		it "can transform 2 into english words in double-digit groups" do
			expect( "2".en.numwords(group: 2) ).to eq( "two" )
		end

		it "can transform 2 into english words in triple-digit groups" do
			expect( "2".en.numwords(group: 3) ).to eq( "two" )
		end


		it "can transform the english words for 2 into an ordinal" do
			expect( "2".en.numwords.en.ordinal ).to eq( "second" )
		end


		it "can transform 3 into english words" do
			expect( "3".en.numwords ).to eq( "three" )
		end

		it "can transform 3 into english words in single-digit groups" do
			expect( "3".en.numwords(group: 1) ).to eq( "three" )
		end

		it "can transform 3 into english words in double-digit groups" do
			expect( "3".en.numwords(group: 2) ).to eq( "three" )
		end

		it "can transform 3 into english words in triple-digit groups" do
			expect( "3".en.numwords(group: 3) ).to eq( "three" )
		end


		it "can transform the english words for 3 into an ordinal" do
			expect( "3".en.numwords.en.ordinal ).to eq( "third" )
		end


		it "can transform 4 into english words" do
			expect( "4".en.numwords ).to eq( "four" )
		end

		it "can transform 4 into english words in single-digit groups" do
			expect( "4".en.numwords(group: 1) ).to eq( "four" )
		end

		it "can transform 4 into english words in double-digit groups" do
			expect( "4".en.numwords(group: 2) ).to eq( "four" )
		end

		it "can transform 4 into english words in triple-digit groups" do
			expect( "4".en.numwords(group: 3) ).to eq( "four" )
		end


		it "can transform the english words for 4 into an ordinal" do
			expect( "4".en.numwords.en.ordinal ).to eq( "fourth" )
		end


		it "can transform 5 into english words" do
			expect( "5".en.numwords ).to eq( "five" )
		end

		it "can transform 5 into english words in single-digit groups" do
			expect( "5".en.numwords(group: 1) ).to eq( "five" )
		end

		it "can transform 5 into english words in double-digit groups" do
			expect( "5".en.numwords(group: 2) ).to eq( "five" )
		end

		it "can transform 5 into english words in triple-digit groups" do
			expect( "5".en.numwords(group: 3) ).to eq( "five" )
		end


		it "can transform the english words for 5 into an ordinal" do
			expect( "5".en.numwords.en.ordinal ).to eq( "fifth" )
		end


		it "can transform 6 into english words" do
			expect( "6".en.numwords ).to eq( "six" )
		end

		it "can transform 6 into english words in single-digit groups" do
			expect( "6".en.numwords(group: 1) ).to eq( "six" )
		end

		it "can transform 6 into english words in double-digit groups" do
			expect( "6".en.numwords(group: 2) ).to eq( "six" )
		end

		it "can transform 6 into english words in triple-digit groups" do
			expect( "6".en.numwords(group: 3) ).to eq( "six" )
		end


		it "can transform the english words for 6 into an ordinal" do
			expect( "6".en.numwords.en.ordinal ).to eq( "sixth" )
		end


		it "can transform 7 into english words" do
			expect( "7".en.numwords ).to eq( "seven" )
		end

		it "can transform 7 into english words in single-digit groups" do
			expect( "7".en.numwords(group: 1) ).to eq( "seven" )
		end

		it "can transform 7 into english words in double-digit groups" do
			expect( "7".en.numwords(group: 2) ).to eq( "seven" )
		end

		it "can transform 7 into english words in triple-digit groups" do
			expect( "7".en.numwords(group: 3) ).to eq( "seven" )
		end


		it "can transform the english words for 7 into an ordinal" do
			expect( "7".en.numwords.en.ordinal ).to eq( "seventh" )
		end


		it "can transform 8 into english words" do
			expect( "8".en.numwords ).to eq( "eight" )
		end

		it "can transform 8 into english words in single-digit groups" do
			expect( "8".en.numwords(group: 1) ).to eq( "eight" )
		end

		it "can transform 8 into english words in double-digit groups" do
			expect( "8".en.numwords(group: 2) ).to eq( "eight" )
		end

		it "can transform 8 into english words in triple-digit groups" do
			expect( "8".en.numwords(group: 3) ).to eq( "eight" )
		end


		it "can transform the english words for 8 into an ordinal" do
			expect( "8".en.numwords.en.ordinal ).to eq( "eighth" )
		end


		it "can transform 9 into english words" do
			expect( "9".en.numwords ).to eq( "nine" )
		end

		it "can transform 9 into english words in single-digit groups" do
			expect( "9".en.numwords(group: 1) ).to eq( "nine" )
		end

		it "can transform 9 into english words in double-digit groups" do
			expect( "9".en.numwords(group: 2) ).to eq( "nine" )
		end

		it "can transform 9 into english words in triple-digit groups" do
			expect( "9".en.numwords(group: 3) ).to eq( "nine" )
		end


		it "can transform the english words for 9 into an ordinal" do
			expect( "9".en.numwords.en.ordinal ).to eq( "ninth" )
		end


		it "can transform 10 into english words" do
			expect( "10".en.numwords ).to eq( "ten" )
		end

		it "can transform 10 into english words in single-digit groups" do
			expect( "10".en.numwords(group: 1) ).to eq( "one, zero" )
		end

		it "can transform 10 into english words in double-digit groups" do
			expect( "10".en.numwords(group: 2) ).to eq( "ten" )
		end

		it "can transform 10 into english words in triple-digit groups" do
			expect( "10".en.numwords(group: 3) ).to eq( "ten" )
		end


		it "can transform the english words for 10 into an ordinal" do
			expect( "10".en.numwords.en.ordinal ).to eq( "tenth" )
		end


		it "can transform 11 into english words" do
			expect( "11".en.numwords ).to eq( "eleven" )
		end

		it "can transform 11 into english words in single-digit groups" do
			expect( "11".en.numwords(group: 1) ).to eq( "one, one" )
		end

		it "can transform 11 into english words in double-digit groups" do
			expect( "11".en.numwords(group: 2) ).to eq( "eleven" )
		end

		it "can transform 11 into english words in triple-digit groups" do
			expect( "11".en.numwords(group: 3) ).to eq( "eleven" )
		end


		it "can transform the english words for 11 into an ordinal" do
			expect( "11".en.numwords.en.ordinal ).to eq( "eleventh" )
		end


		it "can transform 12 into english words" do
			expect( "12".en.numwords ).to eq( "twelve" )
		end

		it "can transform 12 into english words in single-digit groups" do
			expect( "12".en.numwords(group: 1) ).to eq( "one, two" )
		end

		it "can transform 12 into english words in double-digit groups" do
			expect( "12".en.numwords(group: 2) ).to eq( "twelve" )
		end

		it "can transform 12 into english words in triple-digit groups" do
			expect( "12".en.numwords(group: 3) ).to eq( "twelve" )
		end


		it "can transform the english words for 12 into an ordinal" do
			expect( "12".en.numwords.en.ordinal ).to eq( "twelfth" )
		end


		it "can transform 13 into english words" do
			expect( "13".en.numwords ).to eq( "thirteen" )
		end

		it "can transform 13 into english words in single-digit groups" do
			expect( "13".en.numwords(group: 1) ).to eq( "one, three" )
		end

		it "can transform 13 into english words in double-digit groups" do
			expect( "13".en.numwords(group: 2) ).to eq( "thirteen" )
		end

		it "can transform 13 into english words in triple-digit groups" do
			expect( "13".en.numwords(group: 3) ).to eq( "thirteen" )
		end


		it "can transform the english words for 13 into an ordinal" do
			expect( "13".en.numwords.en.ordinal ).to eq( "thirteenth" )
		end


		it "can transform 14 into english words" do
			expect( "14".en.numwords ).to eq( "fourteen" )
		end

		it "can transform 14 into english words in single-digit groups" do
			expect( "14".en.numwords(group: 1) ).to eq( "one, four" )
		end

		it "can transform 14 into english words in double-digit groups" do
			expect( "14".en.numwords(group: 2) ).to eq( "fourteen" )
		end

		it "can transform 14 into english words in triple-digit groups" do
			expect( "14".en.numwords(group: 3) ).to eq( "fourteen" )
		end


		it "can transform the english words for 14 into an ordinal" do
			expect( "14".en.numwords.en.ordinal ).to eq( "fourteenth" )
		end


		it "can transform 15 into english words" do
			expect( "15".en.numwords ).to eq( "fifteen" )
		end

		it "can transform 15 into english words in single-digit groups" do
			expect( "15".en.numwords(group: 1) ).to eq( "one, five" )
		end

		it "can transform 15 into english words in double-digit groups" do
			expect( "15".en.numwords(group: 2) ).to eq( "fifteen" )
		end

		it "can transform 15 into english words in triple-digit groups" do
			expect( "15".en.numwords(group: 3) ).to eq( "fifteen" )
		end


		it "can transform the english words for 15 into an ordinal" do
			expect( "15".en.numwords.en.ordinal ).to eq( "fifteenth" )
		end


		it "can transform 16 into english words" do
			expect( "16".en.numwords ).to eq( "sixteen" )
		end

		it "can transform 16 into english words in single-digit groups" do
			expect( "16".en.numwords(group: 1) ).to eq( "one, six" )
		end

		it "can transform 16 into english words in double-digit groups" do
			expect( "16".en.numwords(group: 2) ).to eq( "sixteen" )
		end

		it "can transform 16 into english words in triple-digit groups" do
			expect( "16".en.numwords(group: 3) ).to eq( "sixteen" )
		end


		it "can transform the english words for 16 into an ordinal" do
			expect( "16".en.numwords.en.ordinal ).to eq( "sixteenth" )
		end


		it "can transform 17 into english words" do
			expect( "17".en.numwords ).to eq( "seventeen" )
		end

		it "can transform 17 into english words in single-digit groups" do
			expect( "17".en.numwords(group: 1) ).to eq( "one, seven" )
		end

		it "can transform 17 into english words in double-digit groups" do
			expect( "17".en.numwords(group: 2) ).to eq( "seventeen" )
		end

		it "can transform 17 into english words in triple-digit groups" do
			expect( "17".en.numwords(group: 3) ).to eq( "seventeen" )
		end


		it "can transform the english words for 17 into an ordinal" do
			expect( "17".en.numwords.en.ordinal ).to eq( "seventeenth" )
		end


		it "can transform 18 into english words" do
			expect( "18".en.numwords ).to eq( "eighteen" )
		end

		it "can transform 18 into english words in single-digit groups" do
			expect( "18".en.numwords(group: 1) ).to eq( "one, eight" )
		end

		it "can transform 18 into english words in double-digit groups" do
			expect( "18".en.numwords(group: 2) ).to eq( "eighteen" )
		end

		it "can transform 18 into english words in triple-digit groups" do
			expect( "18".en.numwords(group: 3) ).to eq( "eighteen" )
		end


		it "can transform the english words for 18 into an ordinal" do
			expect( "18".en.numwords.en.ordinal ).to eq( "eighteenth" )
		end


		it "can transform 19 into english words" do
			expect( "19".en.numwords ).to eq( "nineteen" )
		end

		it "can transform 19 into english words in single-digit groups" do
			expect( "19".en.numwords(group: 1) ).to eq( "one, nine" )
		end

		it "can transform 19 into english words in double-digit groups" do
			expect( "19".en.numwords(group: 2) ).to eq( "nineteen" )
		end

		it "can transform 19 into english words in triple-digit groups" do
			expect( "19".en.numwords(group: 3) ).to eq( "nineteen" )
		end


		it "can transform the english words for 19 into an ordinal" do
			expect( "19".en.numwords.en.ordinal ).to eq( "nineteenth" )
		end


		it "can transform 20 into english words" do
			expect( "20".en.numwords ).to eq( "twenty" )
		end

		it "can transform 20 into english words in single-digit groups" do
			expect( "20".en.numwords(group: 1) ).to eq( "two, zero" )
		end

		it "can transform 20 into english words in double-digit groups" do
			expect( "20".en.numwords(group: 2) ).to eq( "twenty" )
		end

		it "can transform 20 into english words in triple-digit groups" do
			expect( "20".en.numwords(group: 3) ).to eq( "twenty" )
		end


		it "can transform the english words for 20 into an ordinal" do
			expect( "20".en.numwords.en.ordinal ).to eq( "twentieth" )
		end


		it "can transform 21 into english words" do
			expect( "21".en.numwords ).to eq( "twenty-one" )
		end

		it "can transform 21 into english words in single-digit groups" do
			expect( "21".en.numwords(group: 1) ).to eq( "two, one" )
		end

		it "can transform 21 into english words in double-digit groups" do
			expect( "21".en.numwords(group: 2) ).to eq( "twenty-one" )
		end

		it "can transform 21 into english words in triple-digit groups" do
			expect( "21".en.numwords(group: 3) ).to eq( "twenty-one" )
		end


		it "can transform the english words for 21 into an ordinal" do
			expect( "21".en.numwords.en.ordinal ).to eq( "twenty-first" )
		end


		it "can transform 29 into english words" do
			expect( "29".en.numwords ).to eq( "twenty-nine" )
		end

		it "can transform 29 into english words in single-digit groups" do
			expect( "29".en.numwords(group: 1) ).to eq( "two, nine" )
		end

		it "can transform 29 into english words in double-digit groups" do
			expect( "29".en.numwords(group: 2) ).to eq( "twenty-nine" )
		end

		it "can transform 29 into english words in triple-digit groups" do
			expect( "29".en.numwords(group: 3) ).to eq( "twenty-nine" )
		end


		it "can transform the english words for 29 into an ordinal" do
			expect( "29".en.numwords.en.ordinal ).to eq( "twenty-ninth" )
		end


		it "can transform 99 into english words" do
			expect( "99".en.numwords ).to eq( "ninety-nine" )
		end

		it "can transform 99 into english words in single-digit groups" do
			expect( "99".en.numwords(group: 1) ).to eq( "nine, nine" )
		end

		it "can transform 99 into english words in double-digit groups" do
			expect( "99".en.numwords(group: 2) ).to eq( "ninety-nine" )
		end

		it "can transform 99 into english words in triple-digit groups" do
			expect( "99".en.numwords(group: 3) ).to eq( "ninety-nine" )
		end


		it "can transform the english words for 99 into an ordinal" do
			expect( "99".en.numwords.en.ordinal ).to eq( "ninety-ninth" )
		end


		it "can transform 100 into english words" do
			expect( "100".en.numwords ).to eq( "one hundred" )
		end

		it "can transform 100 into english words in single-digit groups" do
			expect( "100".en.numwords(group: 1) ).to eq( "one, zero, zero" )
		end

		it "can transform 100 into english words in double-digit groups" do
			expect( "100".en.numwords(group: 2) ).to eq( "ten, zero" )
		end

		it "can transform 100 into english words in triple-digit groups" do
			expect( "100".en.numwords(group: 3) ).to eq( "one zero zero" )
		end


		it "can transform the english words for 100 into an ordinal" do
			expect( "100".en.numwords.en.ordinal ).to eq( "one hundredth" )
		end


		it "can transform 101 into english words" do
			expect( "101".en.numwords ).to eq( "one hundred and one" )
		end

		it "can transform 101 into english words in single-digit groups" do
			expect( "101".en.numwords(group: 1) ).to eq( "one, zero, one" )
		end

		it "can transform 101 into english words in double-digit groups" do
			expect( "101".en.numwords(group: 2) ).to eq( "ten, one" )
		end

		it "can transform 101 into english words in triple-digit groups" do
			expect( "101".en.numwords(group: 3) ).to eq( "one zero one" )
		end


		it "can transform the english words for 101 into an ordinal" do
			expect( "101".en.numwords.en.ordinal ).to eq( "one hundred and first" )
		end

		it "can transform the english words for 101 into an ordinal" do
			expect( "101".en.numwords.en.ordinal ).to eq( "one hundred and first" )
		end


		it "can transform 110 into english words" do
			expect( "110".en.numwords ).to eq( "one hundred and ten" )
		end

		it "can transform 110 into english words in single-digit groups" do
			expect( "110".en.numwords(group: 1) ).to eq( "one, one, zero" )
		end

		it "can transform 110 into english words in double-digit groups" do
			expect( "110".en.numwords(group: 2) ).to eq( "eleven, zero" )
		end

		it "can transform 110 into english words in triple-digit groups" do
			expect( "110".en.numwords(group: 3) ).to eq( "one ten" )
		end


		it "can transform the english words for 110 into an ordinal" do
			expect( "110".en.numwords.en.ordinal ).to eq( "one hundred and tenth" )
		end


		it "can transform 111 into english words" do
			expect( "111".en.numwords ).to eq( "one hundred and eleven" )
		end

		it "can transform 111 into english words in single-digit groups" do
			expect( "111".en.numwords(group: 1) ).to eq( "one, one, one" )
		end

		it "can transform 111 into english words in double-digit groups" do
			expect( "111".en.numwords(group: 2) ).to eq( "eleven, one" )
		end

		it "can transform 111 into english words in triple-digit groups" do
			expect( "111".en.numwords(group: 3) ).to eq( "one eleven" )
		end


		it "can transform the english words for 111 into an ordinal" do
			expect( "111".en.numwords.en.ordinal ).to eq( "one hundred and eleventh" )
		end


		it "can transform 900 into english words" do
			expect( "900".en.numwords ).to eq( "nine hundred" )
		end

		it "can transform 900 into english words in single-digit groups" do
			expect( "900".en.numwords(group: 1) ).to eq( "nine, zero, zero" )
		end

		it "can transform 900 into english words in double-digit groups" do
			expect( "900".en.numwords(group: 2) ).to eq( "ninety, zero" )
		end

		it "can transform 900 into english words in triple-digit groups" do
			expect( "900".en.numwords(group: 3) ).to eq( "nine zero zero" )
		end


		it "can transform the english words for 900 into an ordinal" do
			expect( "900".en.numwords.en.ordinal ).to eq( "nine hundredth" )
		end


		it "can transform 999 into english words" do
			expect( "999".en.numwords ).to eq( "nine hundred and ninety-nine" )
		end

		it "can transform 999 into english words in single-digit groups" do
			expect( "999".en.numwords(group: 1) ).to eq( "nine, nine, nine" )
		end

		it "can transform 999 into english words in double-digit groups" do
			expect( "999".en.numwords(group: 2) ).to eq( "ninety-nine, nine" )
		end

		it "can transform 999 into english words in triple-digit groups" do
			expect( "999".en.numwords(group: 3) ).to eq( "nine ninety-nine" )
		end


		it "can transform the english words for 999 into an ordinal" do
			expect( "999".en.numwords.en.ordinal ).to eq( "nine hundred and ninety-ninth" )
		end


		it "can transform 1000 into english words" do
			expect( "1000".en.numwords ).to eq( "one thousand" )
		end

		it "can transform 1000 into english words in single-digit groups" do
			expect( "1000".en.numwords(group: 1) ).to eq( "one, zero, zero, zero" )
		end

		it "can transform 1000 into english words in double-digit groups" do
			expect( "1000".en.numwords(group: 2) ).to eq( "ten, zero zero" )
		end

		it "can transform 1000 into english words in triple-digit groups" do
			expect( "1000".en.numwords(group: 3) ).to eq( "one zero zero, zero" )
		end


		it "can transform the english words for 1000 into an ordinal" do
			expect( "1000".en.numwords.en.ordinal ).to eq( "one thousandth" )
		end


		it "can transform 1001 into english words" do
			expect( "1001".en.numwords ).to eq( "one thousand and one" )
		end

		it "can transform 1001 into english words in single-digit groups" do
			expect( "1001".en.numwords(group: 1) ).to eq( "one, zero, zero, one" )
		end

		it "can transform 1001 into english words in double-digit groups" do
			expect( "1001".en.numwords(group: 2) ).to eq( "ten, zero one" )
		end

		it "can transform 1001 into english words in triple-digit groups" do
			expect( "1001".en.numwords(group: 3) ).to eq( "one zero zero, one" )
		end


		it "can transform the english words for 1001 into an ordinal" do
			expect( "1001".en.numwords.en.ordinal ).to eq( "one thousand and first" )
		end


		it "can transform 1010 into english words" do
			expect( "1010".en.numwords ).to eq( "one thousand and ten" )
		end

		it "can transform 1010 into english words in single-digit groups" do
			expect( "1010".en.numwords(group: 1) ).to eq( "one, zero, one, zero" )
		end

		it "can transform 1010 into english words in double-digit groups" do
			expect( "1010".en.numwords(group: 2) ).to eq( "ten, ten" )
		end

		it "can transform 1010 into english words in triple-digit groups" do
			expect( "1010".en.numwords(group: 3) ).to eq( "one zero one, zero" )
		end


		it "can transform the english words for 1010 into an ordinal" do
			expect( "1010".en.numwords.en.ordinal ).to eq( "one thousand and tenth" )
		end


		it "can transform 1100 into english words" do
			expect( "1100".en.numwords ).to eq( "one thousand, one hundred" )
		end

		it "can transform 1100 into english words in single-digit groups" do
			expect( "1100".en.numwords(group: 1) ).to eq( "one, one, zero, zero" )
		end

		it "can transform 1100 into english words in double-digit groups" do
			expect( "1100".en.numwords(group: 2) ).to eq( "eleven, zero zero" )
		end

		it "can transform 1100 into english words in triple-digit groups" do
			expect( "1100".en.numwords(group: 3) ).to eq( "one ten, zero" )
		end


		it "can transform the english words for 1100 into an ordinal" do
			expect( "1100".en.numwords.en.ordinal ).to eq( "one thousand, one hundredth" )
		end


		it "can transform 2000 into english words" do
			expect( "2000".en.numwords ).to eq( "two thousand" )
		end

		it "can transform 2000 into english words in single-digit groups" do
			expect( "2000".en.numwords(group: 1) ).to eq( "two, zero, zero, zero" )
		end

		it "can transform 2000 into english words in double-digit groups" do
			expect( "2000".en.numwords(group: 2) ).to eq( "twenty, zero zero" )
		end

		it "can transform 2000 into english words in triple-digit groups" do
			expect( "2000".en.numwords(group: 3) ).to eq( "two zero zero, zero" )
		end


		it "can transform the english words for 2000 into an ordinal" do
			expect( "2000".en.numwords.en.ordinal ).to eq( "two thousandth" )
		end


		it "can transform 10000 into english words" do
			expect( "10000".en.numwords ).to eq( "ten thousand" )
		end

		it "can transform 10000 into english words in single-digit groups" do
			expect( "10000".en.numwords(group: 1) ).to eq( "one, zero, zero, zero, zero" )
		end

		it "can transform 10000 into english words in double-digit groups" do
			expect( "10000".en.numwords(group: 2) ).to eq( "ten, zero zero, zero" )
		end

		it "can transform 10000 into english words in triple-digit groups" do
			expect( "10000".en.numwords(group: 3) ).to eq( "one zero zero, zero zero" )
		end


		it "can transform the english words for 10000 into an ordinal" do
			expect( "10000".en.numwords.en.ordinal ).to eq( "ten thousandth" )
		end


		it "can transform 100000 into english words" do
			expect( "100000".en.numwords ).to eq( "one hundred thousand" )
		end

		it "can transform 100000 into english words in single-digit groups" do
			expect( "100000".en.numwords(group: 1) ).to eq( "one, zero, zero, zero, zero, zero" )
		end

		it "can transform 100000 into english words in double-digit groups" do
			expect( "100000".en.numwords(group: 2) ).to eq( "ten, zero zero, zero zero" )
		end

		it "can transform 100000 into english words in triple-digit groups" do
			expect( "100000".en.numwords(group: 3) ).to eq( "one zero zero, zero zero zero" )
		end


		it "can transform the english words for 100000 into an ordinal" do
			expect( "100000".en.numwords.en.ordinal ).to eq( "one hundred thousandth" )
		end


		it "can transform 100001 into english words" do
			expect( "100001".en.numwords ).to eq( "one hundred thousand and one" )
		end

		it "can transform 100001 into english words in single-digit groups" do
			expect( "100001".en.numwords(group: 1) ).to eq( "one, zero, zero, zero, zero, one" )
		end

		it "can transform 100001 into english words in double-digit groups" do
			expect( "100001".en.numwords(group: 2) ).to eq( "ten, zero zero, zero one" )
		end

		it "can transform 100001 into english words in triple-digit groups" do
			expect( "100001".en.numwords(group: 3) ).to eq( "one zero zero, zero zero one" )
		end


		it "can transform the english words for 100001 into an ordinal" do
			expect( "100001".en.numwords.en.ordinal ).to eq( "one hundred thousand and first" )
		end


		it "can transform 123456 into english words" do
			expect( "123456".en.numwords ).to eq( "one hundred and twenty-three thousand, four hundred and fifty-six" )
		end

		it "can transform 123456 into english words in single-digit groups" do
			expect( "123456".en.numwords(group: 1) ).to eq( "one, two, three, four, five, six" )
		end

		it "can transform 123456 into english words in double-digit groups" do
			expect( "123456".en.numwords(group: 2) ).to eq( "twelve, thirty-four, fifty-six" )
		end

		it "can transform 123456 into english words in triple-digit groups" do
			expect( "123456".en.numwords(group: 3) ).to eq( "one twenty-three, four fifty-six" )
		end


		it "can transform the english words for 123456 into an ordinal" do
			expect( "123456".en.numwords.en.ordinal ).to eq( "one hundred and twenty-three thousand, four hundred and fifty-sixth" )
		end


		it "can transform 0123456 into english words" do
			expect( "0123456".en.numwords ).to eq( "one hundred and twenty-three thousand, four hundred and fifty-six" )
		end

		it "can transform 0123456 into english words in single-digit groups" do
			expect( "0123456".en.numwords(group: 1) ).to eq( "zero, one, two, three, four, five, six" )
		end

		it "can transform 0123456 into english words in double-digit groups" do
			expect( "0123456".en.numwords(group: 2) ).to eq( "zero one, twenty-three, forty-five, six" )
		end

		it "can transform 0123456 into english words in triple-digit groups" do
			expect( "0123456".en.numwords(group: 3) ).to eq( "zero twelve, three forty-five, six" )
		end


		it "can transform the english words for 0123456 into an ordinal" do
			expect( "0123456".en.numwords.en.ordinal ).to eq( "one hundred and twenty-three thousand, four hundred and fifty-sixth" )
		end


		it "can transform 1234567 into english words" do
			expect( "1234567".en.numwords ).to eq( "one million, two hundred and thirty-four thousand, five hundred and sixty-seven" )
		end

		it "can transform 1234567 into english words in single-digit groups" do
			expect( "1234567".en.numwords(group: 1) ).to eq( "one, two, three, four, five, six, seven" )
		end

		it "can transform 1234567 into english words in double-digit groups" do
			expect( "1234567".en.numwords(group: 2) ).to eq( "twelve, thirty-four, fifty-six, seven" )
		end

		it "can transform 1234567 into english words in triple-digit groups" do
			expect( "1234567".en.numwords(group: 3) ).to eq( "one twenty-three, four fifty-six, seven" )
		end


		it "can transform the english words for 1234567 into an ordinal" do
			expect( "1234567".en.numwords.en.ordinal ).to eq( "one million, two hundred and thirty-four thousand, five hundred and sixty-seventh" )
		end


		it "can transform 12345678 into english words" do
			expect( "12345678".en.numwords ).to eq( "twelve million, three hundred and forty-five thousand, six hundred and seventy-eight" )
		end

		it "can transform 12345678 into english words in single-digit groups" do
			expect( "12345678".en.numwords(group: 1) ).to eq( "one, two, three, four, five, six, seven, eight" )
		end

		it "can transform 12345678 into english words in double-digit groups" do
			expect( "12345678".en.numwords(group: 2) ).to eq( "twelve, thirty-four, fifty-six, seventy-eight" )
		end

		it "can transform 12345678 into english words in triple-digit groups" do
			expect( "12345678".en.numwords(group: 3) ).to eq( "one twenty-three, four fifty-six, seventy-eight" )
		end


		it "can transform the english words for 12345678 into an ordinal" do
			expect( "12345678".en.numwords.en.ordinal ).to eq( "twelve million, three hundred and forty-five thousand, six hundred and seventy-eighth" )
		end


		it "can transform 12_345_678 into english words" do
			expect( "12_345_678".en.numwords ).to eq( "twelve million, three hundred and forty-five thousand, six hundred and seventy-eight" )
		end

		it "can transform 12_345_678 into english words in single-digit groups" do
			expect( "12_345_678".en.numwords(group: 1) ).to eq( "one, two, three, four, five, six, seven, eight" )
		end

		it "can transform 12_345_678 into english words in double-digit groups" do
			expect( "12_345_678".en.numwords(group: 2) ).to eq( "twelve, thirty-four, fifty-six, seventy-eight" )
		end

		it "can transform 12_345_678 into english words in triple-digit groups" do
			expect( "12_345_678".en.numwords(group: 3) ).to eq( "one twenty-three, four fifty-six, seventy-eight" )
		end


		it "can transform 1234,5678 into english words" do
			expect( "1234,5678".en.numwords ).to eq( "twelve million, three hundred and forty-five thousand, six hundred and seventy-eight" )
		end

		it "can transform 1234,5678 into english words in single-digit groups" do
			expect( "1234,5678".en.numwords(group: 1) ).to eq( "one, two, three, four, five, six, seven, eight" )
		end

		it "can transform 1234,5678 into english words in double-digit groups" do
			expect( "1234,5678".en.numwords(group: 2) ).to eq( "twelve, thirty-four, fifty-six, seventy-eight" )
		end

		it "can transform 1234,5678 into english words in triple-digit groups" do
			expect( "1234,5678".en.numwords(group: 3) ).to eq( "one twenty-three, four fifty-six, seventy-eight" )
		end


		it "can transform 1234567890 into english words" do
			expect( "1234567890".en.numwords ).to eq( "one billion, two hundred and thirty-four million, five hundred and sixty-seven thousand, eight hundred and ninety" )
		end

		it "can transform 1234567890 into english words in single-digit groups" do
			expect( "1234567890".en.numwords(group: 1) ).to eq( "one, two, three, four, five, six, seven, eight, nine, zero" )
		end

		it "can transform 1234567890 into english words in double-digit groups" do
			expect( "1234567890".en.numwords(group: 2) ).to eq( "twelve, thirty-four, fifty-six, seventy-eight, ninety" )
		end

		it "can transform 1234567890 into english words in triple-digit groups" do
			expect( "1234567890".en.numwords(group: 3) ).to eq( "one twenty-three, four fifty-six, seven eighty-nine, zero" )
		end


		it "can transform the english words for 1234567890 into an ordinal" do
			expect( "1234567890".en.numwords.en.ordinal ).to eq( "one billion, two hundred and thirty-four million, five hundred and sixty-seven thousand, eight hundred and ninetieth" )
		end


		it "can transform 123456789012345 into english words" do
			expect( "123456789012345".en.numwords ).to eq( "one hundred and twenty-three trillion, four hundred and fifty-six billion, seven hundred and eighty-nine million, twelve thousand, three hundred and forty-five" )
		end

		it "can transform 123456789012345 into english words in single-digit groups" do
			expect( "123456789012345".en.numwords(group: 1) ).to eq( "one, two, three, four, five, six, seven, eight, nine, zero, one, two, three, four, five" )
		end

		it "can transform 123456789012345 into english words in double-digit groups" do
			expect( "123456789012345".en.numwords(group: 2) ).to eq( "twelve, thirty-four, fifty-six, seventy-eight, ninety, twelve, thirty-four, five" )
		end

		it "can transform 123456789012345 into english words in triple-digit groups" do
			expect( "123456789012345".en.numwords(group: 3) ).to eq( "one twenty-three, four fifty-six, seven eighty-nine, zero twelve, three forty-five" )
		end


		it "can transform the english words for 123456789012345 into an ordinal" do
			expect( "123456789012345".en.numwords.en.ordinal ).to eq( "one hundred and twenty-three trillion, four hundred and fifty-six billion, seven hundred and eighty-nine million, twelve thousand, three hundred and forty-fifth" )
		end


		it "can transform 12345678901234567890 into english words" do
			expect( "12345678901234567890".en.numwords ).to eq( "twelve quintillion, three hundred and forty-five quadrillion, six hundred and seventy-eight trillion, nine hundred and one billion, two hundred and thirty-four million, five hundred and sixty-seven thousand, eight hundred and ninety" )
		end

		it "can transform 12345678901234567890 into english words in single-digit groups" do
			expect( "12345678901234567890".en.numwords(group: 1) ).to eq( "one, two, three, four, five, six, seven, eight, nine, zero, one, two, three, four, five, six, seven, eight, nine, zero" )
		end

		it "can transform 12345678901234567890 into english words in double-digit groups" do
			expect( "12345678901234567890".en.numwords(group: 2) ).to eq( "twelve, thirty-four, fifty-six, seventy-eight, ninety, twelve, thirty-four, fifty-six, seventy-eight, ninety" )
		end

		it "can transform 12345678901234567890 into english words in triple-digit groups" do
			expect( "12345678901234567890".en.numwords(group: 3) ).to eq( "one twenty-three, four fifty-six, seven eighty-nine, zero twelve, three forty-five, six seventy-eight, ninety" )
		end


		it "can transform the english words for 12345678901234567890 into an ordinal" do
			expect( "12345678901234567890".en.numwords.en.ordinal ).to eq( "twelve quintillion, three hundred and forty-five quadrillion, six hundred and seventy-eight trillion, nine hundred and one billion, two hundred and thirty-four million, five hundred and sixty-seven thousand, eight hundred and ninetieth" )
		end


		it "can transform 0.987654 into english words" do
			expect( "0.987654".en.numwords ).to eq( "zero point nine eight seven six five four" )
		end

		it "can transform 0.987654 into english words in single-digit groups" do
			expect( "0.987654".en.numwords(group: 1) ).to eq( "zero, point, nine, eight, seven, six, five, four" )
		end

		it "can transform 0.987654 into english words in double-digit groups" do
			expect( "0.987654".en.numwords(group: 2) ).to eq( "zero, point, ninety-eight, seventy-six, fifty-four" )
		end

		it "can transform 0.987654 into english words in triple-digit groups" do
			expect( "0.987654".en.numwords(group: 3) ).to eq( "zero, point, nine eighty-seven, six fifty-four" )
		end


		it "can transform the english words for 0.987654 into an ordinal" do
			expect( "0.987654".en.numwords.en.ordinal ).to eq( "zero point nine eight seven six five fourth" )
		end


		it "can transform .987654 into english words" do
			expect( ".987654".en.numwords ).to eq( "point nine eight seven six five four" )
		end

		it "can transform .987654 into english words in single-digit groups" do
			expect( ".987654".en.numwords(group: 1) ).to eq( "point, nine, eight, seven, six, five, four" )
		end

		it "can transform .987654 into english words in double-digit groups" do
			expect( ".987654".en.numwords(group: 2) ).to eq( "point, ninety-eight, seventy-six, fifty-four" )
		end

		it "can transform .987654 into english words in triple-digit groups" do
			expect( ".987654".en.numwords(group: 3) ).to eq( "point, nine eighty-seven, six fifty-four" )
		end


		it "can transform the english words for .987654 into an ordinal" do
			expect( ".987654".en.numwords.en.ordinal ).to eq( "point nine eight seven six five fourth" )
		end


		it "can transform 9.87654 into english words" do
			expect( "9.87654".en.numwords ).to eq( "nine point eight seven six five four" )
		end

		it "can transform 9.87654 into english words in single-digit groups" do
			expect( "9.87654".en.numwords(group: 1) ).to eq( "nine, point, eight, seven, six, five, four" )
		end

		it "can transform 9.87654 into english words in double-digit groups" do
			expect( "9.87654".en.numwords(group: 2) ).to eq( "nine, point, eighty-seven, sixty-five, four" )
		end

		it "can transform 9.87654 into english words in triple-digit groups" do
			expect( "9.87654".en.numwords(group: 3) ).to eq( "nine, point, eight seventy-six, fifty-four" )
		end


		it "can transform the english words for 9.87654 into an ordinal" do
			expect( "9.87654".en.numwords.en.ordinal ).to eq( "nine point eight seven six five fourth" )
		end


		it "can transform 98.7654 into english words" do
			expect( "98.7654".en.numwords ).to eq( "ninety-eight point seven six five four" )
		end

		it "can transform 98.7654 into english words in single-digit groups" do
			expect( "98.7654".en.numwords(group: 1) ).to eq( "nine, eight, point, seven, six, five, four" )
		end

		it "can transform 98.7654 into english words in double-digit groups" do
			expect( "98.7654".en.numwords(group: 2) ).to eq( "ninety-eight, point, seventy-six, fifty-four" )
		end

		it "can transform 98.7654 into english words in triple-digit groups" do
			expect( "98.7654".en.numwords(group: 3) ).to eq( "ninety-eight, point, seven sixty-five, four" )
		end


		it "can transform the english words for 98.7654 into an ordinal" do
			expect( "98.7654".en.numwords.en.ordinal ).to eq( "ninety-eight point seven six five fourth" )
		end


		it "can transform 987.654 into english words" do
			expect( "987.654".en.numwords ).to eq( "nine hundred and eighty-seven point six five four" )
		end

		it "can transform 987.654 into english words in single-digit groups" do
			expect( "987.654".en.numwords(group: 1) ).to eq( "nine, eight, seven, point, six, five, four" )
		end

		it "can transform 987.654 into english words in double-digit groups" do
			expect( "987.654".en.numwords(group: 2) ).to eq( "ninety-eight, seven, point, sixty-five, four" )
		end

		it "can transform 987.654 into english words in triple-digit groups" do
			expect( "987.654".en.numwords(group: 3) ).to eq( "nine eighty-seven, point, six fifty-four" )
		end


		it "can transform the english words for 987.654 into an ordinal" do
			expect( "987.654".en.numwords.en.ordinal ).to eq( "nine hundred and eighty-seven point six five fourth" )
		end


		it "can transform 9876.54 into english words" do
			expect( "9876.54".en.numwords ).to eq( "nine thousand, eight hundred and seventy-six point five four" )
		end

		it "can transform 9876.54 into english words in single-digit groups" do
			expect( "9876.54".en.numwords(group: 1) ).to eq( "nine, eight, seven, six, point, five, four" )
		end

		it "can transform 9876.54 into english words in double-digit groups" do
			expect( "9876.54".en.numwords(group: 2) ).to eq( "ninety-eight, seventy-six, point, fifty-four" )
		end

		it "can transform 9876.54 into english words in triple-digit groups" do
			expect( "9876.54".en.numwords(group: 3) ).to eq( "nine eighty-seven, six, point, fifty-four" )
		end


		it "can transform the english words for 9876.54 into an ordinal" do
			expect( "9876.54".en.numwords.en.ordinal ).to eq( "nine thousand, eight hundred and seventy-six point five fourth" )
		end


		it "can transform 98765.4 into english words" do
			expect( "98765.4".en.numwords ).to eq( "ninety-eight thousand, seven hundred and sixty-five point four" )
		end

		it "can transform 98765.4 into english words in single-digit groups" do
			expect( "98765.4".en.numwords(group: 1) ).to eq( "nine, eight, seven, six, five, point, four" )
		end

		it "can transform 98765.4 into english words in double-digit groups" do
			expect( "98765.4".en.numwords(group: 2) ).to eq( "ninety-eight, seventy-six, five, point, four" )
		end

		it "can transform 98765.4 into english words in triple-digit groups" do
			expect( "98765.4".en.numwords(group: 3) ).to eq( "nine eighty-seven, sixty-five, point, four" )
		end


		it "can transform the english words for 98765.4 into an ordinal" do
			expect( "98765.4".en.numwords.en.ordinal ).to eq( "ninety-eight thousand, seven hundred and sixty-five point fourth" )
		end


		it "can transform 101.202.303 into english words" do
			expect( "101.202.303".en.numwords ).to eq( "one hundred and one point two zero two three zero three" )
		end

		it "can transform 101.202.303 into english words in single-digit groups" do
			expect( "101.202.303".en.numwords(group: 1) ).to eq( "one, zero, one, point, two, zero, two, point, three, zero, three" )
		end

		it "can transform 101.202.303 into english words in double-digit groups" do
			expect( "101.202.303".en.numwords(group: 2) ).to eq( "ten, one, point, twenty, two, point, thirty, three" )
		end

		it "can transform 101.202.303 into english words in triple-digit groups" do
			expect( "101.202.303".en.numwords(group: 3) ).to eq( "one zero one, point, two zero two, point, three zero three" )
		end
	end


	describe "quantification" do
		it "quantifies 0 objects as 'no'" do
			expect( "driver".en.quantify( 0 ) ).to eq( 'no drivers' )
		end

		it "quantifies 1 object as 'a'" do
			expect( "driver".en.quantify( 1 ) ).to eq( 'a driver' )
		end

		it "quantifies 1 object that starts with a vowel sound as 'an'" do
			expect( "hour".en.quantify( 1 ) ).to eq( 'an hour' )
		end

		it "quantifies 2-5 objects as 'several'" do
			expect( "driver".en.quantify( 4 ) ).to eq( 'several drivers' )
		end

		it "quantifies 6-19 objects as 'a number of'" do
			expect( "driver".en.quantify( 11 ) ).to eq( 'a number of drivers' )
		end

		it "quantifies 20-45 objects as 'numerous'" do
			expect( "driver".en.quantify( 41 ) ).to eq( 'numerous drivers' )
		end

		it "quantifies 46-99 objects as 'many'" do
			expect( "driver".en.quantify( 58 ) ).to eq( 'many drivers' )
		end

		it "quantifies 100-999 objects as 'hundreds of'" do
			expect( "driver".en.quantify( 318 ) ).to eq( 'hundreds of drivers' )
		end

		it "quantifies 1000-9999 objects as 'thousands of'" do
			expect( "driver".en.quantify( 4158 ) ).to eq( 'thousands of drivers' )
		end

		it "quantifies 10000-99999 objects as 'tens of thousands of'" do
			expect( "driver".en.quantify( 14158 ) ).to eq( 'tens of thousands of drivers' )
		end

		it "quantifies 100000-999999 objects as 'hundreds of thousands of'" do
			expect( "driver".en.quantify( 614158 ) ).to eq( 'hundreds of thousands of drivers' )
		end

		it "quantifies 2.6M objects as 'millions of'" do
			expect( "driver".en.quantify( 2614158 ) ).to eq( 'millions of drivers' )
		end

		it "quantifies 8.122B objects as 'billions of'" do
			expect( "driver".en.quantify( 8122614158 ) ).to eq( 'billions of drivers' )
		end


	end

end

