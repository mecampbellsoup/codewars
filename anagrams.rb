require_relative 'spec_helper'

# What is an anagram? Well, two words are anagrams of each other if they both contain the same letters. For example:

# 'abba' & 'baab' == true

# 'abba' & 'bbaa' == true

# 'abba' & 'abbba' == false

# Write a function that will find all the anagrams of a word from a list. You will be given two inputs: a word and an array with words. You should return an array of all the anagrams or an empty array if there are none. For example:

# anagrams('abba', ['aabb', 'abcd', 'bbaa', 'dada']) => ['aabb', 'bbaa']

# anagrams('racer', ['crazer', 'carer', 'racar', 'caers', 'racer']) => ['carer', racer']

# anagrams('laser', ['lazing', 'lazy', 'lacer'] => []

# def anagrams(string, potential_matches)
#   string_as_freq_hash = string.split("").freq
#   potential_matches.select do |word|
#     #convert to a hash where each letter is a key, and its # of occurrences is the value at that key
#     word_as_freq_hash = word.split("").freq
#     word_as_freq_hash == string_as_freq_hash
#   end
# end

# class Array
#   def freq
#     inject(Hash.new(0)) { |h,v| h[v] += 1; h }
#   end
# end

def anagrams(word, words)
  words.select do |w|
    w.chars.sort == word.chars.sort
  end
end

describe 'anagrams' do

  let(:hello)     { "hello" }
  let(:matches)   { ["helol", "hlleo", "holle", "elloh", "nomatch", "testing"]}
  let(:unmatches) { ["racecar", "helloo", "isayhello", "test123"]}

  it 'should return an Array' do
    expect(anagrams(hello, matches)).to be_a Array
    expect(anagrams(hello, unmatches)).to be_a Array
  end

  it 'should only return anagrams of the first word argument string' do
    expect(anagrams(hello, matches)).to eq ["helol", "hlleo", "holle", "elloh"]
  end

  it 'should return an empty array if there are no anagrams of the first arg string in the 2nd arg array' do
    expect(anagrams(hello, unmatches)).to be_empty
  end

end