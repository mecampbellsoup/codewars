require 'rspec'

def compute(&block)
  if block
    yield
  else
    "Do not compute"
  end
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

describe '#compute' do

  it "yields to the block if a block is given" do
    expect(compute { "Block" }).to eq "Block"
  end

  it "returns 'Do not compute' if no block is given" do
    expect(compute).to eq "Do not compute"
  end
end
