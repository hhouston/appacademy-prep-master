require 'byebug'
class Dictionary
  attr_accessor :entries

  def initialize
    @entries = {}
  end

  def add(new_entries)

    if new_entries.is_a?(String)
      @entries[new_entries] = nil
    elsif new_entries.is_a?(Hash)
      @entries.merge!(new_entries)
    end
  end

  def keywords
    @entries.keys.sort { |x,y| x <=> y }
  end

  def include?(key)
    @entries.has_key?(key)
  end

  def find(key_query)
    @entries.select do |key|
      key.match(key_query)
    end
  end

  def printable
    keywords.map do |key|
      %Q{[#{key}] "#{@entries[key]}"}
    end.join("\n")
  end
end