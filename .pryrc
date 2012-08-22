#!/usr/bin/env ruby
# vim: set nosta noet ts=4 sw=4:

BEGIN {
    require 'pathname'
	$LOAD_PATH.unshift( Pathname.new( __FILE__ ).dirname + 'lib' )
}

begin
	require 'loggability'
	require 'linguistics'

	Loggability.level = :debug
	Loggability.format_with( :color )

	# Linguistics.use( :en )
	# Linguistics.use( :en, monkeypatch: true )
rescue Exception => err
	$stderr.puts "Linguistics failed to load: %p: %s" % [ err.class, err.message ]
	$stderr.puts( err.backtrace )
end

