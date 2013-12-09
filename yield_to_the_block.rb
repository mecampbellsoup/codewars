require_relative 'spec_helper'

def compute(&block)
  if block
    yield
  else
    "Do not compute"
  end
end

describe '#compute' do

  it "yields to the block if a block is given" do
    expect(compute { "Block" }).to eq "Block"
  end

  it "returns 'Do not compute' if no block is given" do
    expect(compute).to eq "Do not compute"
  end
end
