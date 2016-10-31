def translate(string)
  vowels = "aeiou"

  string.split(" ").each do |word|
    add_to_end = ""
    capital = false
    if(word[0] == word[0].upcase )
      capital = true
    end
    if vowels.include?(word[0])
      word << add_to_end + "ay"
    else
      while word.length > 0 && vowels.include?(word[0]) == false
        if word[0] == "q"
          add_to_end << word[0] + word[1]
          word[0] = ""
          word[0] = ""
          break;
        end

        if capital == true
          word[0] = word[0].downcase
        end

        add_to_end << word[0]
        word[0] = ""
      end

      word << add_to_end + "ay"
      if capital == true
        word[0] = word[0].upcase
      end

      p word
    end
  end.join(" ")
end
