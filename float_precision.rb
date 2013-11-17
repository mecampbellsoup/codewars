require 'rspec'

def solution(value)
  value.round(2)
end

RSpec.configure do |config|
  # Use color in STDOUT
  config.color_enabled = true

  # Use color not only in STDOUT but also in pagers and files
  config.tty = true
  config.order = 'random'

  # Use the specified formatter
  config.formatter = :progress # :progress, :html, :textmate
end

describe '#solution' do 
  it 'should correctly round the remainder decimal to hundreths and return the rounded number' do
    expect(solution(23.23456)).to eq(23.23)
    expect(solution(1.546)).to eq(1.55)
  end

  it 'should return zeros for values without decimal remainders' do
    expect(solution(5)).to eq(5.00)
  end
end