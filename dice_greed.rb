require_relative 'spec_helper'

class Array
  def mode
    max = freq.values.max                   # we're only interested in the key(s) with the highest frequency
    freq.select { |k, f| f == max }         # extract the keys that have the max frequency
  end

  def freq
    inject(Hash.new(0)) { |h,v| h[v] += 1; h }
  end
end

def score(dice)
  # Here we instantiate our score hashes for points lookup
  triples_hash = { 1 => 1000, 6 => 600, 5 => 500, 4 => 400, 3 => 300, 2 => 200}
  singles_hash = { 1 => 100, 5 => 50}

  # Score initialized to zero at start
  score = 0
  mode = nil
  # If a triple is present, add it to the score and remove those 3 elements from dice
  if dice.uniq.size <= 3
    binding.pry if dice == [1, 1, 1, 5, 1]
    mode = dice.mode.keys.first
    score += triples_hash[mode]
    3.times { dice.delete(mode) }
  end
  # Check all values in dice - skip if it's already counted for in a triple - else score as a single
  dice.each do |value|
    score += singles_hash[value] if singles_hash[value]
  end
  score
end

# def triple(value)
#   # calculate points and add them to the Dice instance's score attr
#   score += @@triples_hash[value]
# end

# def single(value)
#   score += @@singles_hash[value]
# end

describe "Scorer Function" do
  it "should value this as worthless" do
    expect( score( [2, 3, 4, 6, 2] )).to eq 0
  end
  
  it "should value this triplet correctly" do
    expect( score( [2, 2, 2, 3, 3] )).to eq 200
    expect( score( [1, 1, 1, 5, 5] )).to eq 1100
    expect( score( [6, 4, 5, 5, 5] )).to eq 500
  end
  
  it "should value this mixed set correctly" do
    expect( score( [2, 4, 4, 5, 4] )).to eq 450
    expect( score( [1, 1, 1, 5, 1] )).to eq 1150
    expect( score( [1, 4, 1, 1, 1] )).to eq 1100
    expect( score( [1, 1, 4, 5, 4] )).to eq 250
  end
end

 # Throw       Score
 # ---------   ------------------
 # 5 1 3 4 1   50 + 2 * 100 = 250
 # 1 1 1 3 1   1000 + 100 = 1100
 # 2 4 4 5 4   400 + 50 = 450

 # A single die can only be counted once in each roll. For example, a "5" can only count as part of a triplet (contributing to the 500 points) or as a single 50 points, but not both in the same roll.

 # Three 1's => 1000 points
 # Three 6's =>  600 points
 # Three 5's =>  500 points
 # Three 4's =>  400 points
 # Three 3's =>  300 points
 # Three 2's =>  200 points
 # One   1   =>  100 points
 # One   5   =>   50 point
