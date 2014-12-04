def letter_count(str)
	new_str = str.split("")
	newer_str = new_str.join("")
	newest_str = newer_str.split("")

	hash = Hash.new(0)

	newest_str.each do |l|
		hash[l] += 1
	end
	hash
end