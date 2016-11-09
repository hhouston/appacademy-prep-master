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
    value
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

end

# if __FILE__ == $PROGRAM_NAME
#
# end


# @calculator = RPNCalculator.new
# @calculator.push(2)
# @calculator.push(3)
# @calculator.push(4)
# @calculator.divide
# p @calculator.value == (3.0 / 4.0)
# @calculator.times
# p @calculator.value == (2.0 * (3.0 / 4.0))
# p @calculator.value

# p @calculator.evaluate("1 2 3 * +")
