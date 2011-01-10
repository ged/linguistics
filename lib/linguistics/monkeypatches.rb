#!/usr/bin/env ruby -w

module Linguistics

	### A collection of extensions that get added to Array.
	module ArrayExtensions

		### Returns a new Array that has had a new member inserted between all of
		### the current ones. The value used is the given +value+ argument unless a
		### block is given, in which case the block is called once for each pair of
		### the Array, and the return value is used as the separator.
		def separate( *args, &block )
			ary = self.dup
			ary.separate!( *args, &block )
			return ary
		end

		### The same as #separate, but modifies the Array in place.
		def separate!( *args )
			raise LocalJumpError, "no block given for no-arg #separate!" if
				args.empty? && !block_given?
			value = args.first

			(1..( (self.length * 2) - 2 )).step(2) do |i|
				if block_given?
					self.insert( i, yield(self[i-1,2]) )
				else
					self.insert( i, value )
				end
			end
			self
		end

	end # module ArrayExtensions

end # module Linguistics

### Extend Array
class Array
	include Linguistics::ArrayExtensions
end

