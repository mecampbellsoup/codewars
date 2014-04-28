# Given an array of numbers return an array of numbers from the array that
# qualify as perfect squares. A perfect square is defined as a whole number
# that, when square rooted, is a whole number. (Such as 1, 4, 9, 16, etc, etc.)
#
# Note: Return only one copy of each perfect square in ascending order

# get_squares(1..16) # => [1, 4, 9, 16]
# get_squares(1..100) # => [1, 4, 9, 16, 25, 36, 49, 64, 81, 100]

def get_squares(enumerable)
  enumerable.map do |i|
    val = Math.sqrt(i)
    i if val.to_i == val
  end.compact.uniq
end

p get_squares(1..16)
p get_squares(1..100)
