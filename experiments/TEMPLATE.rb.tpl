#!/usr/bin/ruby
#
# (>>>description<<<)
# 
# Time-stamp: <24-Aug-2003 16:11:13 deveiant>
#

BEGIN {
	base = File::dirname( File::dirname(File::expand_path(__FILE__)) )
	$LOAD_PATH.unshift "#{base}/lib"

	require "#{base}/utils.rb"
	include UtilityFunctions
}

try( "(>>>FILE_SANS<<<)" ) {
	(>>>POINT<<<)
}


>>>TEMPLATE-DEFINITION-SECTION<<<
("description" "Experiment description: ")


