require 'byebug'

class Temperature

  def ftoc(temp)
    (temp - 32) * (5 / 9.0)
  end

  def ctof(temp)
    (9/5.0)*temp + 32
  end

  def initialize(options)

    if options[:f]
      self.fahrenheit = options[:f]
    else
      self.celsius = options[:c]
    end

  end

  def fahrenheit=(temp)
    @temperature = self.ftoc(temp)
  end

  def celsius=(temp)
    @temperature = temp
  end

  def in_fahrenheit
    self.ctof(@temperature)
  end

  def in_celsius
    @temperature
  end

  #needs self.method to be accessed
  def self.from_fahrenheit(temp)
    self.new(:f => temp)
  end

  def self.from_celsius(temp)
    self.new(:c => temp)
  end
end

class Fahrenheit < Temperature
  def initialize(temp)
    self.fahrenheit = temp
  end
end

class Celsius < Temperature
  def initialize(temp)
    self.celsius = temp
  end
end