
def possible_steps_for_rungs num_rungs
  # if number of rungs is less than or equal to 2, then the number of
  # possibilities is equal to the number of rungs
  if num_rungs <= 2
    return num_rungs
  end
  # otherwise, add the two ways of getting there (1 step from n-1, or
  # 2 steps from n-2)
  return possible_steps_for_rungs(num_rungs - 1) +
         possible_steps_for_rungs(num_rungs - 2)
end

results = []

(1..15).each do |num_rungs| 
  results.push(possible_steps_for_rungs num_rungs)
end

results
