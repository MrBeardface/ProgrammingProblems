from = 100
to = 999

highest = (from..to).map do |i|
  (i..to).map do |j|
    i * j
  end.select{|n| n.to_s == n.to_s.reverse}
end.max

puts highest

