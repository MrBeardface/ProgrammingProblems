def nearest_integer(array, i)
	number = array[i]
	n = 0
	#iterate through each number of the array
	while n < array.length 
		#evaluate whether the number at the current index is greater
		#then the passed in index.
		if number > array[n]
			nil
		elsif number == array[n]
			nil
		elsif number < array[n]
			number = array[n]
			new_num = n
		end
		n += 1
	end
	return new_num
end