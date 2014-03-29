require 'pry'
require 'minitest/autorun'

class Element
  attr_reader :val
  attr_accessor :visited

  def initialize(val)
    @val = val
    @visited = false
  end
end

class Map
  attr_reader :data, :size, :result

  def initialize(array)
    @result = []
    @size = array.size
    @data = []
    array.each do |arr|
      arr.each do |val|
        @data << Element.new(val)
      end
    end
  end

  def snail
    position = 0
    until result.size >= data.size do
      position = go_right(position)
      position = go_down(position)
      position = go_left(position)
      position = go_up(position)
    end
    result.uniq
  end

  private

  def go_right(position)
    data[position, size].each do |elem|
      result << elem.val unless elem.visited
      elem.visited = true if data[position]
    end
    data[result.last - 1].val - 1
  end

  def go_left(position)
    data[position - size, size].reverse.each do |elem|
      result << elem.val unless elem.visited
      elem.visited = true if data[position]
    end
    data[result.last - 1].val - 1
  end

  def go_down(position)
    while position < data.size - 1
      position += size
      unless data[position].nil?
        result << data[position].val unless data[position].visited
        data[position].visited = true if data[position]
      end
    end
    data[result.last - 1].val - 1
  end

  def go_up(position)
    position -= size
    while position > 0
      result << data[position].val unless data[position].visited
      data[position].visited = true if data[position]
      position -= size
    end
    data[result.last - 1].val - 1
  end
end

describe Map do
  small = [[1,2], [3,4]]
  big = [[1,2,3,4], [5,6,7,8], [9,10,11,12], [13,14,15,16]]
  bigger = [[1,2,3,4,5], [6,7,8,9,10], [11,12,13,14,15], [16,17,18,19,20], [21,22,23,24,25]]

  map = Map.new(small)

  describe "#initialize" do
    it "casts each data value into an Element" do
      map.data.must_be_instance_of Array
      map.data.first.must_be_instance_of Element
      map.data.last.must_be_instance_of Element
    end

    it "assigns positions correctly to each Element" do
      map.data[0].val.must_equal 1
      map.data[1].val.must_equal 2
      map.data[2].val.must_equal 3
    end

    it "initializes each Element with false visited value" do
      map.data.first.visited.must_equal false
    end
  end

  describe "#snail" do
    it "returns a snail-snorted flattened array" do
      map.snail.must_equal [1,2,4,3]
      Map.new(big).snail.must_equal [1,2,3,4,8,12,16,15,14,13,9,5,6,7,11,10]
      Map.new(bigger).snail.must_equal [1,2,3,4,5,10,15,20,25,24,23,22,21,16,11,6,7,8,9,14,19,18,17,12,13]
    end
  end
end
