def add (param1, param2)
  return param1 + param2
end

def subtract (param1, param2)
  return_value = param1 - param2
  return return_value
end

def sum (array)
  sum = 0
  array.each{|number| sum += number}
  return sum
end

def multiply(*numbers)
  sum = 1
  numbers.each {|number| sum *= number}
  return sum
end

def power(base_num, power)
  sum = 1
  power.times do
    sum *= base_num
  end
  return sum
end

def factorial(number)
  sum = 1

  if number == 0
    return 1
  end

  while (number > 0) do
    sum = number * sum
    number -= 1
  end
  return sum
end
