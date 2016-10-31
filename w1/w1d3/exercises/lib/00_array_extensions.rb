# Sum
#
# Write an Array method, `sum`, that returns the sum of the elements in the
# array. You may assume that all of the elements are integers.

class Array
  def sum
    sum = 0
    self.each do |num|
      sum += num
    end
    sum
  end
end

# Square
#
# Write an array method, `square`, that returns a new array containing the
# squares of each element. You should also implement a "bang!" version of this
# method, which mutates the original array.

class Array
  def square!
    self.each_with_index do |num, index|
      self[index] = num*num
    end
    self
  end

  def square
    return_array = []
    self.map do |num|
      return_array << num*num
    end
    return_array
  end
end

# Finding Uniques
#
# Monkey-patch the Array class with your own `uniq` method, called
# `my_uniq`. The method should return the unique elements, in the order
# they first appeared:
#
# ```ruby
# [1, 2, 1, 3, 3].my_uniq # => [1, 2, 3]
# ```
#
# Do not use the built-in `uniq` method!

class Array
  def my_uniq
    uniq_array = []
    self.each do |item|
      uniq_array << item unless uniq_array.include?(item)
    end
    uniq_array
  end
end

# Two Sum
#
# Write a new `Array#two_sum` method that finds all pairs of positions
# where the elements at those positions sum to zero.
#
# NB: ordering matters. I want each of the pairs to be sorted smaller
# index before bigger index. I want the array of pairs to be sorted
# "dictionary-wise":
#
# ```ruby
# [-1, 0, 2, -2, 1].two_sum # => [[0, 4], [2, 3]]
# ```
#
# * `[0, 2]` before `[1, 2]` (smaller first elements come first)
# * `[0, 1]` before `[0, 2]` (then smaller second elements come first)

class Array
  def sort_array
    array = self
    self.length.times do |i|
      (self.length-1).downto(i) do |j|
        if array[i][0] > array[j][0]

          array[i],array[j] = array[j],array[i]
        elsif array[i][0] == array[j][0]

          if array[i][1] > array [j][1]
            array[i],array[j] = array[j],array[i]
          end

        end

      end
    end
  array
  end

  def two_sum
    array = []

    self.length.times do |i|
      (self.length-1).downto(i+1) do |j|
        if self[i] + self[j] == 0
          array << [i,j]
        end
      end
    end
    array.sort_array
  end
end

# Median
#
# Write a method that finds the median of a given array of integers. If
# the array has an odd number of integers, return the middle item from the
# sorted array. If the array has an even number of integers, return the
# average of the middle two items from the sorted array.

class Array
  def median
      array = self.sort
    if self.length == 0
      return nil
    end

    if self.length % 2 == 0 #even
      middle_index = self.length / 2
      median = (array[middle_index-1]+array[middle_index])/2.to_f
    else
      middle_index = (self.length / 2.to_f).ceil
      median = (array[middle_index-1])
    end
  median
  end
end

# My Transpose
#
# To represent a *matrix*, or two-dimensional grid of numbers, we can
# write an array containing arrays which represent rows:
#
# ```ruby
# rows = [
#     [0, 1, 2],
#     [3, 4, 5],
#     [6, 7, 8]
#   ]
#
# row1 = rows[0]
# row2 = rows[1]
# row3 = rows[2]
# ```
#
# We could equivalently have stored the matrix as an array of
# columns:
#
# ```ruby
# cols = [
#     [0, 3, 6],
#     [1, 4, 7],
#     [2, 5, 8]
#   ]
# ```
#
# Write a method, `my_transpose`, which will convert between the
# row-oriented and column-oriented representations. You may assume square
# matrices for simplicity's sake. Usage will look like the following:
#
# ```ruby
# matrix = [
#   [0, 1, 2],
#   [3, 4, 5],
#   [6, 7, 8]
# ]
#
# matrix.my_transpose
#  # => [[0, 3, 6],
#  #    [1, 4, 7],
#  #    [2, 5, 8]]
# ```
#
# Don't use the built-in `transpose` method!

# Bonus: Refactor your `Array#my_transpose` method to work with any rectangular
# matrix (not necessarily a square one).

class Array
  def my_transpose
    row = self[0].count
    collumn = self.count
    trans_matrix = Array.new(row) { Array.new(collumn) }
    row.times do |outer_index|
      collumn.times do |inner_index|
        trans_matrix[outer_index][inner_index] = self[inner_index][outer_index]
        #p "["+outer_index.to_s+","+inner_index.to_s+"] = ["+inner_index.to_s+","+outer_index.to_s+"]"
      end
    end
    trans_matrix
  end
end
