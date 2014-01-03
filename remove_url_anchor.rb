require_relative 'spec_helper'

# Complete the function/method so that it returns the url with anything after the anchor (#) removed.

def remove_url_anchor(url)
  url.split(/#/).first
end

describe 'remove_url_anchor' do

  it 'removes all parts of the URL that follow the anchor (i.e. pound sign)' do
    expect(remove_url_anchor('www.codewars.com#about')).to eq 'www.codewars.com'
    expect(remove_url_anchor('www.codewars.com?page=1')).to eq 'www.codewars.com?page=1'
  end

end