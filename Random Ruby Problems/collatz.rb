max_l = 0
max_i = 0
i = 1000000

(1..i).each do |i|
	l = 0
	j = i
	while j > 1
	 if j.even?
	   j = j/2     
	 else
	   j = 3 * j + 1
	end
		l += 1
end
	if l > max_l
		max_l = l
		max_i = i
	end
end

puts max_i