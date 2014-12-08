#find the next number in the sequence
# 1, 3, 6, 10, 15, 21, 28, 36, 45, 55

#take the last number and subtract it from the second to last number
#add 1 to the difference then add that number to last number.

#take the sum and find the nearest sqaure root of the number
#loop from up to that number and find where the square root and the number given are divisible
#append the divisible numbers to an array and call size on the array until the size is 5000

#iterate through until you find a number that has 5000 divisors
require 'prime'
start = Time.now
array = [1, 3, 6, 10, 15, 21, 28, 36, 45, 55]

for i in array
		difference = array[-1] - array[-2] + 1
		total = difference + array[-1]
		array << total
		new_number = total.prime_division.flatten
 			if new_number.length == 500
				return total
			end
		end
finish = Time.now
diff = finish - start

# square_root = total.square root.round

# (1..square_root).each do |n|
# 	if total % n == 0 || total % n == total
# 		an_array << n 


# puts an_array if array.size == 5000 

require 'mathn' 

class Integer 
  def divisors
    return [1] if self == 1
    primes, powers = 56.prime_division.transpose 
    #primes = [2,7]
    #powers = [3,1]
    exponents = powers.map{|i| (0..i).to_a}
    #exponents = [3,1] ==> [[0,1,2,3], [0,1]] 
    #call exponents, which is [[0, 1, 2, 3], [0, 1]] for the number 56, call shift on exponents
    #which returns the first element, which should be [0,1,2,3], then calls product
    #which return a combination of what remains of exponents, [0,1,2,3], and pass in the old exponents as an argument, [0,1]
    #and creates, [[0, 0], [0, 1], [1, 0], [1, 1], [2, 0], [2, 1], [3, 0], [3, 1]], then call map
    # 
    divisors = exponents.shift.product(*exponents).map do |powers|
    #primes, [2, 7], call zip on primes with the argument powers, which is [[0, 0], [0, 1], [1, 0], [1, 1], [2, 0], [2, 1], [3, 0], [3, 1]],
    #which shoud create [[[2, 0], [7, 0]], [[2, 0], [7, 1]], [[2, 1], [7, 0]], [[2, 1], [7, 1]], [[2, 2], [7, 0]], [[2, 2], [7, 1]], [[2, 3], [7, 0]], [[2, 3], [7, 1]]],
    #
      primes.zip(powers).map{|prime, power| prime ** power}.inject(:*) 
    #call map on this output, and send into a block with two parameters, prime and power, which returns
    #[[1, 1], [1, 7], [2, 1], [2, 7], [4, 1], [4, 7], [8, 1], [8, 7]], then call inject on this which should return
    #[1, 7, 2, 14, 4, 28, 8, 56] 
    end 
    #[1, 7, 2, 14, 4, 28, 8, 56] call sort on this to get numbers in order so that you can divide them.
    #[1,2,4,7,8,14,28,56] should produce [1,56], [2,28], [4,14]...
    puts divisors.sort.map{|div| [div, self / div]} 
  end
end