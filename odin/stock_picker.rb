def stock_picker(array)
	#set your initial variables
	i, buy, sell, total = 0, 0, 0, 0
	#the variable i is equal to 0, which when you begin the loop represents the value at index 0 within the array
	#so if we have an array, [15,2,3,7] index 0 would be 15.
	#During that first loop(iteration) the computer grabs that value 15.
	while i < array.length
		#Now you need to get the arrays next value so you can evaluate two numbers.
		#This next value would be at index 1, which is the number 2.
		i2 = i + 1
		while i2 < array.length
			#Now you're in the inner loop.
			#Until the computer has looped through all the values, it won't exit and go to the next value of the outer loop
			#example:  iteration 1 => array[1] - array[0] or 2 - 15 = -13, iteration 2 => array[2] - array[0] 3 - 15 = -12, iteration 3 => array[3] - array[0] or 7 - 15 = -8
			#and so on until it evaluates all the numbers within the array.
			#When it completes the inner loop, it exits out and gets the next number in the outer loop, index 1 which is 2 then does the whole process all over again.
			if array[i2] - array[i] > total
				#now in that first iteration on the outer loops you have index 0 and on the inner loop you have index 1 (as stated above) and total is equal to 0.
				#array[1] - array[0] or 2 - 15 = -13.
				#Now you need a conditional to say, "If the difference of these two numbers is greater then the total value, that difference becomes the toatl" 
				#Because its the first iteration through and total is set to 0, total will remain at 0 because -13 isn't larger then 0.
				#until you find a value bigger then 0, both the buy and sell variables will be 0.
				buy, sell = i2, i
				#until you find a total greater than 0, total will remain at 0
				total = array[i2] - array[i]
			end
			#this increments the inner loops initial value(0) because the computer doesn't understand how to get to the next value.
		i2 +=1
		end
		#this does the same as above, except for the outer loop.
		i += 1
	end
	#when it has looped through completely and found the largest total, return the two indexes that produces this total value.
	return [sell, buy]
end