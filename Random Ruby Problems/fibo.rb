a = [1, 2]
	while a[-1] + a[-2] < 4000000
		a << a[-1] + a[-2]
end
	sum = 0
	a.each { |x| sum += x if x.even? }

puts sum