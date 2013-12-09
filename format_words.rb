require_relative 'spec_helper'

def format_words(words)
  words.nil? ? (return "") : words.reject! { |w| w.empty? || w.nil? }
  if words.size > 1
    csv, final_item = words[0, words.size - 1], words.last
    csv.join(", ") + " and #{final_item}"
  elsif words.size == 1
    words.first
  else
    ""
  end
end

def refactored_format_words(words)
  return '' if words.nil? || words.empty?
  words.delete('')
  words.join(', ').gsub(/(.*)(, )/, '\1 and ')
end

describe '#format_words' do

  it "formats the words into a single comma separated value" do
    expect(format_words ['ninja', 'samurai', 'ronin']).to eq "ninja, samurai and ronin"
    expect(format_words(['one'])).to eq 'one'
  end

  it "the last word should be separated by the word 'and' instead of a comma" do
    expect(format_words ['ninja', '', 'ronin']).to eq "ninja and ronin"
  end

  it "empty arrays or null/nil values being passed into the method should result in an empty string being returned" do
    expect(format_words([])).to eq ""
  end

end
