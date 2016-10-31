class Timer
  attr_accessor :seconds

  def initialize(seconds = 0)
    @seconds = seconds
  end

  def padding(num)
    if num < 10
      "0#{num}"
    else
      "#{num}"
    end
  end

  def hours
    seconds / 3600
  end

  def minutes
    (seconds % 3600) / 60
  end

  def remaining_seconds
    seconds % 60
  end

  def time_string
    "#{padding(hours)}:#{padding(minutes)}:#{padding(remaining_seconds)}"
  end

end