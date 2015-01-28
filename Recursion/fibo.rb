def fibs(num)
  curr, last = 0, 1
  num.times do
    curr, last = last, curr + last
  end
  curr
end

def fibs_rec(num)
  return 0 if num == 0
  return 1 if num == 1 
  return fibs_rec(num-1) + fibs_rec(num-2)
end