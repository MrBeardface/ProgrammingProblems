def no_repeats(start, finish)
	years = (start.to_s..finish.to_s).to_a
	array = []
	years.each do |year|
		if no_repeat?(year)
			array << year
		end
	end
	array
end

def no_repeat?(year)
	new_year = year.to_s.split("")
	i = 0
	while i < new_year.length
		i2 = i + 1
		while i2 < new_year.length
			if new_year[i] == new_year[i2]
				return false
	 	end
	 	i2 += 1
	end
	i += 1
end
true
end
