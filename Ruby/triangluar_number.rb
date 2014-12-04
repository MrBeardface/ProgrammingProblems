i = 10
greater = 0 
(1..i).each do |n|
	sum = 0
	sum += n

	while sum > 1
		some_array = []
		l = 0
		(1..sum).each do |num|
			if sum % num == 0
				some_array << num
			  l += 1
			end
		end

		if l == 500 || 501
			greater = sum
		end
	end
end

puts greater

# require 'mathn'

# primer  = Prime.new
# primes  = [ primer.next ]
# seed    = 500
# n       = (seed * (seed + 1)) / 2
# i       = seed + 1

# def count_prime_factors primer, primes, n
#   total = 1
#   max   = Math.sqrt(n).to_i

#   while primes.last < max
#     primes << primer.next
#   end
  
#   primes.each do |i|
#     count = 0
#     while n % i == 0
#       n = n / i
#       count += 1
#     end
#     if count > 0
#       total *= count + 1
#     end
#   end

#   total
# end

# while(count_prime_factors(primer, primes, n) < seed)
#   n += i
#   i += 1
# end

# puts n

# ---------------------------------------

# require 'mathn'
 
# timer_start = Time.now
 
# class Integer
#   def divisor_count
#     sum = 1
#     self.prime_division.each do |x| 
#       sum *= (x[1] + 1)  
#     end
#     sum
#   end
# end
 
# i, triangle_number = 1, 1
# while(triangle_number.divisor_count <= 500)  
#   i += 1
#   triangle_number += i  
# end 
 
# puts triangle_number
 
# puts "Elapsed Time: #{(Time.now - timer_start)*1000} milliseconds"