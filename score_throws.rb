require_relative 'spec_helper'

def scoreThrows(radiuses)
  return 0 if radiuses.empty?
  radiuses.map! { |radius| score(radius) }
  bonus = radiuses.select { |r| r == 10 }.size == radiuses.size ? 100 : 0
  radiuses.inject(bonus) { |result, element| result + element }
end

def score(value)
  # takes a value and returns a score
  case value
  when 0...5
    10
  when 5..10
    5
  else
    0
  end
end

describe '#scoreThrows' do

  it 'if all radiuses are less than 5, award 100 bonus points!' do
    expect( scoreThrows [1, 2, 3, 4] ).to eq 140
  end

  it 'zero points awarded for radiuses greater than 10' do
    expect( scoreThrows [11, 13, 15, 20] ).to eq 0
  end

  it 'awards 5 points for radiuses between 5 and 10 inclusive' do 
    expect( scoreThrows [5, 6, 7, 8, 9, 10] ).to eq 30
  end

  it 'awards 10 point for radiuses less than 5' do 
    expect( scoreThrows [1, 2, 3, 5] ).to eq 35
    expect( scoreThrows [1, 5, 11] ).to eq 15 
  end

end

