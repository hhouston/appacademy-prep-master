#repeat word
def echo (word)
  p (word)
end

#make capitalized
def shout (word)
  p (word).upcase
end

#make take one or two arguments
def repeat (word, int = 2)

    array = Array.new(int, word)
    p (array.join(" "))

end

# return letters from start of word
def start_of_word (word, int)
  new_word = word.slice(0,int)
end

#return the first word
def first_word(string)
  word = string.split(" ")
  p(word[0])
end

#capitalize a word
#don't capitalize little words?
def titleize (string)
  p string.split.each.with_index { |word,i| word.capitalize! if (word.length > 4 || i == 0 || word == "kwai") }.join(' ')


end
