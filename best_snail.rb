require 'pry'

def snail(array)
  array.empty? ? [] : array.shift + snail(array.transpose.reverse)
end

arr = [[1,2,3],[4,5,6],[7,8,9]]
p snail(arr)
