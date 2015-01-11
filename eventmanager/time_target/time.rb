require 'csv'
require 'date'

puts "Cleaning Dates"

def best_hours(all_hours)
	total = all_hours.values.inject(0) { |sum, i| sum + i }
  peak_hours = all_hours.sort_by { |k, v| v }.reverse.first 3
  peak_hours.each do |hour, count|
    puts "hour: #{hour} count: #{count} (#{(count.to_f / total * 100).round(1)}%)"
  end
  puts '\n'
end

def best_days(all_days)
	total = all_days.values.inject(0) { |sum, i| sum + i }
  best_days = all_days.sort_by { |k, v| v }.reverse.first 3
  best_days.each do |day, count|
    puts "#{day}:".rjust(10, ' ') + " #{count.to_s.rjust(4, ' ')} (#{(count.to_f / total * 100).round(1)}%)"
  end
  puts '\n'
end

contents = CSV.open "event_attendees.csv", headers: true, header_converters: :symbol

all_hours = Hash.new(0)
all_days = Hash.new(0)

contents.each do |row|
	name = row[:first_name]
	regdate = DateTime.strptime(row[1], "%m/%d/%Y %H:%M") 

	all_hours[regdate.hour] += 1
	all_days[regdate.strftime('%A')] += 1
end

puts "\n"
best_hours(all_hours)
best_days(all_days)



