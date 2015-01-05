# -*- coding: utf-8 -*-
# INTEGER
################################################################################
# SUCC
# Return the successor to this integer (this integer + 1)
my_int = 4
puts my_int.succ

# TIMES
# Perform a block a number of times equal to this integer
my_int = 4
puts my_int.times { puts "foo" }

# GCD
# Returns the greatest common divisor of this integer and another,
# provided integer.
my_int = 4
puts my_int.gcd(6)

# RATIONALIZE
# Returns the rationalized version of the integer.
my_int = 4
puts my_int.rationalize

# CHR
# Returns a string containing the character represented by the int‘s
# value according to encoding.
# NOTE: My example is a non-printing character!
my_int = 4
puts my_int.chr

# FLOAT
################################################################################
# HASH
# Returns a hash code for this float.
my_float = 3.14
puts my_float.hash

# NEXT_FLOAT
# Returns the next representable floating-point number.
my_float = 3.14
puts my_float.next_float

# TO_R
# Returns the value as rational.
my_float = 3.14
puts my_float.to_r

# ROUND
# Rounds flt to a given precision in decimal digits (default 0
# digits). Precision may be negative. Returns a floating point number
# when ndigits is more than zero.
my_float = 3.14
puts my_float.round(1)

# TRUNCATE
# Returns flt truncated to an Integer.
my_float = 3.14
puts my_float.truncate

# STRING
################################################################################
# CENTER
# If integer is greater than the length of str, returns a new String
# of length integer with str centered and padded with padstr;
# otherwise, returns str.
my_string = "foo"
puts my_string.center 20

# EACH_CHAR
# Passes each character in str to the given block, or returns an
# enumerator if no block is given.
my_string = "foo"
my_string.each_char { |c| print c, ' ' }

# CHOP
# Returns a new String with the last character removed. If the string
# ends with \r\n, both characters are removed. Applying chop to an
# empty string returns an empty string. String#chomp is often a safer
# alternative, as it leaves the string unchanged if it doesn’t end in
# a record separator.
my_string = "foobar"
puts my_string.chop

# CRYPT
# Applies a one-way cryptographic hash to str by invoking the standard
# library function crypt. The argument is the salt string, which
# should be two characters long, each character drawn from
# [a-zA-Z0-9./].
my_string = "foo"
puts my_string.crypt "A3"

# DELETES
# Returns a copy of str with all characters in the intersection of its
# arguments deleted. Uses the same rules for building the set of
# characters as String#count.
my_string = "foobar"
puts my_string.delete "bar"

# BOOLEAN
################################################################################
# INSPECT
# Returns string representation.
puts true.inspect

# AND
# Returns false if obj is nil or false, true otherwise.
puts true & false
puts true & true

# OR
# Returns false if either obj is true.
puts true | true
puts true | false
puts false | false

# EXCLUSIVE_OR
# Returns true if and only if only one term is true (this gets tricky
# with chained operations!).
puts true ^ false
puts true ^ true
# because this is evaluated left to right ( true ^ true ) is false, so
# then false ^ true is true
puts true ^ true ^ true

# TO_S
# Returns the string representation of value.
puts true.to_s
puts false.to_s
