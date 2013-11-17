require 'rspec'

def triangular(n)
  (1..n).inject(0) { |sum, elem| sum + elem } 
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

describe '#triangular' do
  context 'it should return the number of total dots to make the n-th triangular dot pattern' do
    it 'should return the correct number of dots' do 
      expect(triangular(2)).to eq(3)
      expect(triangular(5)).to eq(15)
    end
    it 'should return zero for the zero-th triangular pattern' do
      expect(triangular(0)).to eq(0)
    end
  end
end