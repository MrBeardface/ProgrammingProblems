file = ARGV.first

puts "You have opened: #{file}"
puts "If you want to exit, please press CTRL-C (^C)."
puts 'If you want to process, press enter'

$stdin.gets

print "Please, write something to this file: "
line1 = $stdin.gets.chomp
print "Please, write something to this file: "
line2 = $stdin.gets.chomp

target = open(file, 'r+') do |f|
	f << line1
	f << line2
end

puts "You have written, #{line1} and #{line2} "