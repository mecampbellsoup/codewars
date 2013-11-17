require 'rspec'

def solution(array, key)
  array.sort_by{ |h| h[key] }
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

describe Array do
  context '#solution' do
    it 'sorts the array based on the key argument passed' do
      expect(solution([{'a' => 2}, {'a' => 1}], 'a')).to eq [{'a' => 1}, {'a' => 2}]
    end

    it 'sorts the array when the key is a symbol as well' do
      expect(solution([{a: 1}, {a: 5}, {a: 3}], :a)).to eq [{a:1}, {a: 3}, {a: 5}]
    end

    it 'does not sort the array when the key argument is not of the same class as the hash keys' do
      expect(solution([{a: 1}, {a: 5}, {a: 3}], 'a')).to_not eq [{a:1}, {a: 3}, {a: 5}]
    end
  end
end
