require_relative 'spec_helper'

def solution(pairs)
  pairs.map { |key, value| "#{key} = #{value}"}.join(",")
end

describe '#solution' do

  it "converts the hash key-values to a string" do
    expect(solution({a: 1, b: '2'})).to eq "a = 1,b = 2"
    expect(solution({c: 5, d: '22'})).to eq "c = 5,d = 22"
  end

end
