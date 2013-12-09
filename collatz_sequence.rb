# n -> n/2 (n is even) n -> 3n + 1 (n is odd)

# Using the rule above and starting with 13, we generate the following sequence:

class Collatz
  @@sequences = {}

  attr_reader :starting_num
  attr_accessor :sequence

  def initialize(starting_num)
    @starting_num = starting_num
  end

  def length
    # where s_n == 13, we get:  13 40 20 10 5 16 8 4 2 1 
    # which starting number, under one million, produces the longest chain?
    self.sequence = [starting_num]
    # last_element = sequence.last
    while sequence.last != 1
      if @@sequences[sequence.last].nil?
        # if there's no value at that key, then do the logic of next step
        next_step
      else
        # if there is a sequence at that key, just combine that sequence to the sequence so far
        sequence = (sequence + @@sequences[sequence.last]).uniq
      end
    end
    # put the new sequence into our collection of sequences/ the class variable
    @@sequences[starting_num] = sequence
    # return the sequence length
    self.sequence.size
  end

  def next_step
    # check even or odd and return the next number
    sequence.last.odd? ? sequence.push(sequence.last * 3 + 1) : sequence.push(sequence.last/2)
  end

end

biggest = Collatz.new(1)
biggest_length = biggest.length

(1..10**6).each do |i|
  collatz = Collatz.new(i)
  collatz_length = collatz.length
  if collatz_length > biggest_length
    biggest = collatz
    biggest_length = collatz_length
  end
end

puts biggest_length
puts biggest.starting_num
