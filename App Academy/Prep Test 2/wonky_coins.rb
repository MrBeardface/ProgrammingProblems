require 'benchmark'

beginning_time = Time.now
def wonky_coins(n)
	return 1 if n == 0
	
	return wonky_coins(n / 2) + wonky_coins(n / 3) + wonky_coins(n / 4) 
end
end_time = Time.now

puts "Time elapsed #{(end_time - beginning_time)*1000} milliseconds"
puts wonky_coins(1)