def prime_factors(n)
  return [] if n == 1
  factor = (2..n).find {|x| n % x == 0}
  print [factor]
  [factor] + prime_factors(n / factor)
end
puts prime_factors(600851475143).max
