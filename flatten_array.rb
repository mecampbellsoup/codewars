require_relative 'spec_helper'

def flatten(array)
  format = array.select { |elem| elem.is_a? Array }
  if format.size > 0 && array.first.is_a?(Array)
    counter = -1
    checker = array
    until !checker.is_a? Array
      counter += 1
      checker = checker.first
    end
    a = array.flatten
    (counter - 1).times do
      a = [a]
    end
    a
  elsif format.size == 0
    return array
  else
    # this is where we have sub-arrays
    temp = []
    index = array.each_with_index do |elem, i|
      break i if elem.is_a?(Array)
    end
    array.each_with_index do |elem, i|
      # i want to put stuff into temp until i hit the index; then i want to literally pass the values      
      i == index ? array[i].each {|e| temp << e } : temp << elem
    end
    temp
  end
end

describe '#flatten' do
  it "doesn't flatten the array if it's one-level deep" do
    expect(flatten [1,2,3]).to eq [1,2,3]
  end

  it "only does one level of flattening" do 
    expect(flatten [[[1,2,3]]]).to eq [[1,2,3]]
  end 

  it "flattens an array into a flat array" do 
    expect(flatten [[1,2,3],["a","b","c"],[1,2,3]]).to eq [1,2,3,"a","b","c",1,2,3]
  end

  it "flattens the deepest array in a case of nested arrays (not the shallowest)" do
    expect(flatten [2,[1,[3,1],2],2]).to eq [2, 1, [3, 1], 2, 2]
  end
end
