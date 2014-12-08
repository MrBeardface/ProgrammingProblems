require 'mathn'

puts Prime.take_while { |n| n < 2000000}.reduce(:+)

# n = 2000000

# def primes?(n)
# 	sum = 0 
# 	a = []
# 	factor = (2..n).each {|x| return false if n % x == 0 }
# 	true 
# 	(2..factor).each { |i| a << i if primes? i; puts i }
# end

# def primed(x)
# 	a = []
# 	(2..x).each { |i| a << i if primes? i; puts i }
# 	p a
# end

# def array_sum(a)
# 	a.reduce(:+)
# end

# primed(2000000)