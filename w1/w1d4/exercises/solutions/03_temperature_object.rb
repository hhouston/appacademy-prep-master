require 'byebug'

class Temperature

  def self.from_fahrenheit(temp)
    debugger
    self.new(f: temp)
  end

  def self.from_celsius(temp)
    debugger
    self.new(c: temp)
  end

  def self.ctof(temp)
    debugger
    (temp * 9 / 5.0) + 32
  end

  def self.ftoc(temp)
    debugger
    (temp - 32) * (5 / 9.0)
  end

  def initialize(options)
    debugger
    if options[:f]
      self.fahrenheit = options[:f]
    else
      self.celsius = options[:c]
    end
  end

  def fahrenheit=(temp)
    debugger
    @temperature = self.class.ftoc(temp)
  end

  def celsius=(temp)
    debugger
    @temperature = temp
  end

  def in_fahrenheit
    debugger
    self.class.ctof(@temperature)
  end

  def in_celsius
    debugger
    @temperature
  end
end

class Celsius < Temperature
  debugger
  def initialize(temp)
    debugger
    self.celsius = temp
  end
end

class Fahrenheit < Temperature
  debugger
  def initialize(temp)
    debugger
    self.fahrenheit = temp
  end
end

p Temperature.new(:c => 32).in_cel