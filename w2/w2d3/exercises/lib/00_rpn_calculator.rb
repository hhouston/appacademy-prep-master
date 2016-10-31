require 'byebug'

class RPNCalculator

  OPERATORS = [:+, :-, :*, :/]

  def initialize
    @stack = []
  end


  def operator?(char)
    if OPERATORS.include?(char.to_sym)
      true
    end
  end

  def tokens(string)
    chars = string.split(" ")
    chars.map do |char|
      operator?(char) ? char.to_sym : char.to_i
    end
  end

  def evaluate(string)
    tokens(string).each do |char|
      if char.class == Symbol
        perform_op(char)
      elsif char.class == Fixnum
        self.push(char)
      end
    end
    p value
  end

  def push(num)
    @stack.push(num)
  end

  def perform_op(operator)
    if @stack.length > 1
      right_num = @stack.pop
      left_num = @stack.pop
    else
      raise "calculator is empty"
    end

    case operator
      when :*
        @stack << left_num * right_num
      when :/
        @stack << left_num / right_num.to_f
      when :+
        @stack << left_num + right_num
      when :-
        @stack << left_num - right_num
    end
    self
  end

  def plus
    perform_op(:+)
  end

  def minus
    perform_op(:-)
  end

  def times
    perform_op(:*)
  end

  def divide
    perform_op(:/)
  end

  def value
    @stack.last
  end

  def evaluate_file(file_name)
    contents = File.readlines(file_name)
    contents.each do |line|
      evaluate(line)
    end
  end

  def prompt
    puts "Enter number or op and press enter. Press ente again to evaluate"
    string = ""
    index = 0
    while true
      temp = gets.chomp
      break if temp.empty?

      string += " "+temp
    end
    evaluate(string)
  end
end

if __FILE__ == $PROGRAM_NAME
  @calculator = RPNCalculator.new
  if ARGV.length == 1
    @calculator.evaluate_file(ARGV.shift)
  else
    @calculator.prompt
  end
end