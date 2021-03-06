require_relative 'spec_helper'

# Complete the function so that it returns the number of seconds that have elapsed between the start and end times given.

# Tips:

# The start/end times are given as Date (JS/CoffeeScript) and Time (Ruby) instances.
# The start time will always be before the end time.

def elapsed_seconds(start_time, end_time)
  Integer(end_time - start_time)
end

describe '#elapsed seconds' do
  it 'returns the # of seconds elapsed between the start_ and end_time' do
    expect(elapsed_seconds(Time.now, Time.now + 5)).to eq(5)
    expect(elapsed_seconds(Time.at(946702800), Time.at(946702810))).to eq(10)
  end
end