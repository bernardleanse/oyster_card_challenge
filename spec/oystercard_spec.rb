require 'oystercard'

describe Oystercard do

  it "should have a balance" do   
    expect(subject.balance).to eq 0
  end  

  describe "#top_up" do
    it "should allow topping up balance" do
      subject.top_up(20) 
      expect(subject.balance).to eq 20
    end
  end

  
end