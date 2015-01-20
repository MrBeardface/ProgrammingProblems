def ordered_vowel_words(string)
	strings = string.split(" ")
	new_string = strings.select do |word|
		ordered_vowel_word?(word)
	end
	new_string.join(" ")
end

def ordered_vowel_word?(word)
	vowels = ["a", "e", "i", "o", "u"]
	new_word = word.split("")
	vowels_arr = new_word.select { |letter| vowels.include?(letter) }
	(0...(vowels_arr.length - 1)).all? do |i|
		vowels_arr[i] <= vowels_arr[i + 1]
	end
end

puts ordered_vowel_words("complicated here")