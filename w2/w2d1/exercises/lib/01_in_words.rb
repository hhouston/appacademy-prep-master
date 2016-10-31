  ONES = ["zero","one","two","three", "four", "five", "six", "seven", "eight", "nine"]
  TEENS = ["ten", "eleven", "tweleve", "thirteen", "fourteen", "fifteen", "sixteen", "seventeen", "eighteen", "nineteen"]

MAGNITUDES = {
    100 => "hundred",
    1000 => "thousand",
    1_000_000 => "million",
    1_000_000_000 => "billion",
    1_000_000_000_000 => "trillion"
  }

class Fixnum
  def in_words
      digits = (Math.log10(self).to_i+1)

      if (self < 10)
        p ONES[self]
      elsif (self < 20)
        p TEENS[self]
      end
      number = ""
      p number = self.to_s
      p number.to_i % 1000
      p number.slice(number.length-3, number.length)

      (0..number.length-1).each do |index|
        p index
      end

  end
end

136_010_005.in_words
