
# return true if a is divisible by b
  def div_by(a,b)
    a.modulo(b) == 0
  end

  results = []

  (1..100).each do |number|
    if div_by(number,3) && div_by(number,5)
      results.push 'FizzBuzz'
    else
      if div_by(number,3)
        results.push 'Fizz'
      else
        if div_by(number,5)
          results.push 'Buzz'
        else
          results.push number.to_s
        end
      end
    end
  end

results
