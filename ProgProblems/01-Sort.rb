
# our test data
a = [3,4,6,1,3,6,7,8,9,2,4,5,6,7,10,146,3,4,7,8,74]

def sort_array(a)
  # if the array has a length of less than or equal to 1, simply
  # return the array (this is our stopping point for recursion)
  if a.length <= 1
    return a
  end
  # otherwise, pick a mid value
  mid_value = a.delete_at a.length/2
  # create hi and lo arrays
  lo = []
  hi = []
  # loop through our current array, putting everything less than our
  # mid_value in lo and everything else in hi
  a.each do |this_value|
    if this_value < mid_value
      lo.push this_value
    else
      hi.push this_value
    end
  end
  # we then need to recursively sort the lo and hi arrays until we
  # have lengths of 1
  return sort_array(lo) + [mid_value] + sort_array(hi)
end

# run on our test data
p sort_array(a)
