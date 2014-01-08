require_relative 'spec_helper'

# Write a class called "Mother" that tracks all inheritances that are done to her (and her kids), together with a class method "phone_kids" that calls in turn the class method "phone" of all kids.

class Mother
  @@subclasses = []
  
  # Add a method (or more) to track all kids
  def self.inherited(subclass)
    @@subclasses.push(subclass)
  end
  
  def self.phone_kids
    @@subclasses.each do |sc|
      sc.send(:phone)
    end
  end
end

describe Mother do
  
  # So if you have two kids
  class Foo < Mother
    def self.phone ; end
  end

  class Bar < Mother
    def self.phone ; end
  end

  context '::phone_kids' do
    it 'should call ::phone on all children/subclasses of Mother' do
      Foo.should_receive(:phone)
      Bar.should_receive(:phone)
      Mother.phone_kids
    end
  end
end