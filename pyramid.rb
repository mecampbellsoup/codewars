require_relative 'spec_helper'

# Write a function that when given a number >= 0, returns an Array of ascending length subarrays.
# pyramid(0) => [ ]
# pyramid(1) => [ [1] ]
# pyramid(2) => [ [1], [1, 1] ]
# pyramid(3) => [ [1], [1, 1], [1, 1, 1] ]
  
def pyramid(n)
  outer_array = []
  0.upto(n) do |i|
    next if i == 0
    outer_array << Array.new(i, i)
  end
  outer_array
end

def pyrmaid_refactored(number)
  (1..number).map { |n| [1]*n }
end

describe 'Object#pyramid' do

  it 'should return an array with zero subarrays' do
    expect(pyramid(0)).to be_an Array
    expect(pyramid(0)).to be_empty
  end

  it 'should return an array with one subarray with one element' do
    expect(pyramid(1).size).to eq 1
    pyramid(1).each_with_index { |subarray, n| expect(subarray.size).to eq n+1 }
  end
  it 'should return an array with two subarrays, each with 2 elements' do
    expect(pyramid(2).size).to eq 2
    pyramid(2).each_with_index { |subarray, n| expect(subarray.size).to eq n+1 }
  end

  it 'should return an array with three subarrays, each with 3 elements' do
    expect(pyramid(3).size).to eq 3
    pyramid(3).each_with_index { |subarray, n| expect(subarray.size).to eq n+1 }
  end
end

