require 'pry'
require 'minitest/autorun'

class Snail
  attr_reader :array, :results

  def initialize(array)
    @array = array
    @results = []
  end

  def solve(array)
    return array if array.size == 0
    return array.first if array.size == 1
    path = travel(array)
    path + solve(shrink_array(array, path))
  end

  def shrink_array(array, traveled)
    arr = array.flatten - traveled
    return [] if arr.empty?
    arr.each_slice(Math.sqrt(arr.size)).to_a 
  end

  def travel(array)
    # Returns a single, traveled array path
    go_right(array) +
    go_down(array)  +
    go_left(array)  +
    go_up(array)
  end

  private

  def go_right(array)
    array.first[0...-1]
  end

  def go_down(array)
    result = array.map do |arr|
      arr.last
    end
    result[0...-1]
  end

  def go_left(array)
    array.last.reverse[0...-1]
  end

  def go_up(array)
    result = array.drop(1).reverse.map do |arr|
      arr.first
    end
  end
end


describe Snail do
  small = [[1,2,3], [4,5,6], [7,8,9]]
  array = [[1,2,3,4], [5,6,7,8], [9,10,11,12], [13,14,15,16]]
  snail = Snail.new(array)
  little = Snail.new(small)

  describe "#solve" do
    it "returns the correctly snail-solved array" do
      little.solve(small).must_equal [1,2,3,6,9,8,7,4,5]
      snail.solve(array).must_equal [1,2,3,4,8,12,16,15,14,13,9,5,6,7,11,10]
    end
  end

  describe "#travel" do
    it "returns a single, traveled array path" do
      snail.travel(snail.array).must_equal [1,2,3,4,8,12,16,15,14,13,9,5]
    end
  end

  describe "#shrink_array" do
    it "returns the untraveled shrunken array" do
      snail.shrink_array(snail.array, snail.travel(snail.array)).must_equal [[6,7],[10,11]]
    end
  end
end
