require_relative 'spec_helper'

def str_to_hash(str)
  mod = str.split(", ").map { |eq| eq.split("=") }.flatten
  mod.map! do |elem|
    if elem.to_i.to_s == elem
      elem.to_i
    else
      elem.to_sym
    end
  end
  Hash[*mod]
end  

describe '#str_to_hash' do

  let(:input) { "a=1, b=2, c=3, d=4" }

  it 'convert the string to a hash of key-value pairs' do
    expect(str_to_hash(input)).to eq({ :a => 1, :b => 2, :c => 3, :d => 4})
  end

end

