def reverser (&prc)
  sentence = prc.call
  sentence.split(" ").map { |word| word.reverse }.join(" ")
end

def adder (num_to_add = 1, &prc)
  prc.call + num_to_add
end

def repeater (times_to_repeat = 1, &prc)
  times_to_repeat.times { prc.call }
end
