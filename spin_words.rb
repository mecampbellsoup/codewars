require_relative 'spec_helper'

def spinWords(string)
  string.split(" ").map { |word| next word.reverse if word.length > 4 ; word }.join(" ")
end

describe '#spinWords' do

  it 'only spins those words with 5 or more characters' do
    expect( spinWords "Hey fellow warriors" ).to eq "Hey wollef sroirraw"
    expect( spinWords "This is another test" ).to eq "This is rehtona test"
  end

  it 'does not spin words with 5 or less characters' do
    expect( spinWords( "This is a test") ).to eq "This is a test"
  end

  it 'only includes spaces when more than 1 word is present' do 
    expect( spinWords "nope" ).to eq "nope"
    expect( spinWords "racecar" ).to eq "racecar"
    expect( spinWords "palindrome").to eq "emordnilap"
  end

end

