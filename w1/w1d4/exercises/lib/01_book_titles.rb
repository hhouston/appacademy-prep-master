class Book
  attr_accessor :title

  UNCAPITALIZED_WORDS = ["and","the","an","a","in","of"]
  def title=(title)
    new_title = []

    title.split(" ").each_with_index do |word, index|
      unless UNCAPITALIZED_WORDS.include?(word) && index != 0
        new_title[index] = word.capitalize
      else
        new_title[index] = word
      end
    end

    @title = new_title.join(" ")

  end
end