require 'csv'
puts "Cleaning Numbers"

contents = CSV.open "event_attendees.csv", headers: true, header_converters: :symbol
contents.each do |row|
	name = row[:first_name]
	homephone = row[5]
	
	homephone = homephone.split("")	

	homephones = homephone.collect do |num|
		num = num.gsub(/[^0-9A-Za-z]/, '')	
		new_num = num.gsub(/\D/, '')
	end

	array = []
	array << homephones.join("")

	array.each do |phone|

		if phone.length < 10
			  puts "#{name} - phone number is bad"
		elsif phone.length == 11 && phone[0] == "1"
			puts "#{name} #{phone[1..10]} - stripped the first number off"
		elsif phone.length == 11 && phone[0] != "1"
			puts "#{name} - phone number is bad"
		elsif phone.length > 11
			puts "#{name} - phone number is too long"
		else
			puts "#{name} #{phone}"
		end
	end
end






##If the phone number is less than 10 digits assume that it is a bad number
##If the phone number is 10 digits assume that it is good
##If the phone number is 11 digits and the first number is 1, trim the 1 and use the first 10 digits
##If the phone number is 11 digits and the first number is not 1, then it is a bad number
##If the phone number is more than 11 digits assume that it is a bad number
