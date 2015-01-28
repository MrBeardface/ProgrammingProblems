def merge_sort(a)
  #base case, return array if array length is less than or equal to 1
  return a if a.length <= 1
  #get half the length of the array 
  half = a.length / 2
  #continually split up the array into sub-parts
  left_side = merge_sort(a[0..half - 1])
  right_side = merge_sort(a[half..-1] )
  #pass the sub-parts into the merge method
  merge(left_side, right_side)
end

#will evaluate each of the parts and produce the sorted output
def merge(left, right)
  #set your counters
  i, j = 0, 0
  #create an array to store sorted values within
  merged_list = []

  length_left_side, length_right_side = left.length, right.length

  while i < length_left_side || j < length_right_side
    if i < length_left_side && j < length_right_side
      if left[i] <= right[j]
        merged_list << left[i]
        i += 1
      else
        merged_list << right[j]
        j += 1
      end   
    elsif i < length_left_side
      merged_list << left[i]
      i += 1
    elsif j < length_right_side
      merged_list << right[j]
      j+= 1
    end
  end
  merged_list
end

p merge_sort([2,100,4,2,234,45,54,22,0,55,-32,5,44])