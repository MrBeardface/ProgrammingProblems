## Project Recursion

###Warmup: Fibonnacci

Write iterative and recursive methods.

###Merge-Sort

Write Merge-sort sorting method.


I found this implementation of merge sort and based mine off of it.

From [Wikipedia](http://en.wikibooks.org/wiki/Algorithm_Implementation/Sorting/Merge_sort#Python):

```
def mergesort(list)
  return list if list.size <= 1
  mid = list.size / 2
  left  = list[0, mid]
  right = list[mid, list.size-mid]
  merge(mergesort(left), mergesort(right))
end
 
def merge(left, right)
  sorted = []
  until left.empty? or right.empty?
    if left.first <= right.first
      sorted << left.shift
    else
      sorted << right.shift
    end
  end
  sorted.concat(left).concat(right)
end
```