require_relative 'spec_helper'

class Array
  
  def contains_all?(other_array)
    return true if (self & other_array).length == other_array.length
    false
  end

end

describe Array do
  context 'Array#contains_all?' do

    let(:items) { [1, 2, 3, 4, 5, 6, 7, 8, 9] }

    it 'should be true if the arrays fully overlap' do
      expect(items.contains_all?([1, 2, 3])).to be true
    end

    it 'should be true despite the order' do
      expect(items.contains_all?([3, 2, 1])).to be true
    end
    it 'should be false if the arrays do not fully intersect' do
      expect(items.contains_all?([1, 5, 13])).to be false
    end

    it 'should be true' do
      #expect(items.contains_all?([9,2,5,4,10])).to be true
    end
  end
end

