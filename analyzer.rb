text=''
line_count = 0
File.open("test.txt").each do |line| 
	line_count += 1 
	text << line
end

puts "#{line_count} lines"

total_characters = text.length
puts "#{total_characters} characters"

total_characters_nospaces = text.gsub(/\s+/, '').length
puts "#{total_characters_nospaces} characters excluding spaces"

word_count = text.split.length
puts "#{word_count} words"

paragraph_count = text.split(/\n\n/).length
puts "#{paragraph_count} paragraphs"

sentence_count = text.split(/\.|\?|!/).length
puts "#{sentence_count} sentences"

stopwords = %w{the a by on for of are with just but and to the my I has some in}
all_words = text.scan(/\w+/)
good_words = all_words.select{ |word| !stopwords.include?(word) }
good_percentage = ((good_words.length.to_f / all_words.length.to_f) * 100).to_i
puts "#{good_percentage}% of words are non-fluff words"

sentences = text.gsub(/\s+/, ' ').strip.split(/\.|\?|!/)
sentences_sorted = sentences.sort_by { |sentence| sentence.length }
one_third = sentences_sorted.length / 3
ideal_sentences = sentences_sorted.slice(one_third, one_third + 1)
ideal_sentences = ideal_sentences.select { |sentence| sentence =~ /is|are/ }

puts "Summary:\n\n" + ideal_sentences.join(". ")
puts "-- End of analysis"
