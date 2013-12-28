require_relative 'spec_helper'

def guess_gifts(wishlist, presents)
  temp = presents.map do |p|
    wishlist.select do |item|
      p.values == item.values[1, item.values.size-1]
    end
  end.flatten
  temp.map { |i| i[:name] }.uniq
end

# def guess_gifts(wishlist, presents)
#   wishlist.map do |wish|
#     toy = wish.delete(:name)
#     presents.include?(wish) ? toy : nil
#   end.reject{|e| e.nil?}
# end

describe '#guess_gifts' do

  let(:wishlist) do
    [
      {:name => "mini puzzle", :size => "small", :clatters => "yes", :weight => "light"},
      {:name => "toy car", :size => "medium", :clatters => "a bit", :weight => "medium"},
      {:name => "card game", :size => "small", :clatters => "no", :weight => "light"}
    ]
  end

  let(:presents) do
    [
     {:size => "medium", :clatters => "a bit", :weight => "medium"},
     {:size => "small", :clatters => "yes", :weight => "light"}
    ]
  end

  it "returns all presents matches found in the wishlist" do
    expect(guess_gifts(wishlist, presents)).to eq ['toy car', 'mini puzzle']
  end

end