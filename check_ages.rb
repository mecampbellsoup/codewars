require 'rspec'

def check_ages?(data, sex, age_is_greater_than)
  to_check = data.select { |d| d[:sex] == sex } # now I have an array of the same-gender hashes
  checked = to_check.select { |d| d[:age] > age_is_greater_than }
  return true if checked.size == to_check.size
  false
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

describe '#check_ages?' do

  let(:data) {
    [
      {age: 40, sex: :m},
      {age: 24, sex: :f},
      {age: 56, sex: :m},
      {age: 45, sex: :m},
      {age: 23, sex: :f} 
    ]
  } 

  it 'returns true if all of the data items matching the sex value have ages greater than the value provided' do
    expect(check_ages?(data, :f, 22)).to be true
    expect(check_ages?(data, :m, 30)).to be true
  end

  it 'returns false if not all of the data items matching the sex value have ages greater than the value provided' do
    expect(check_ages?(data, :f, 23)).to be false
    expect(check_ages?(data, :m, 40)).to be false
  end
end