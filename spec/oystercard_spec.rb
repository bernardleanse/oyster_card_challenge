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

    it "should raise error when balance exceeds limit" do
      expect {subject.top_up(91)}.to raise_error "Maximum balance is #{Oystercard::MAX_BALANCE}"
    end
  end

  describe "#deduct" do
    it "should allow deduction from the balance" do
      subject.top_up(80)
      subject.deduct(20) 
      expect(subject.balance).to eq 60
    end
  end

  describe "#touch_in" do
    it "should allow card to touch in" do
      expect(subject).to respond_to(:touch_in)
    end
  end

  describe "#in_journey" do
    it "should be in journey after touching in" do
      subject.touch_in
      expect(subject.in_journey).to eq(true) 
    end
   
  end

  describe "#touch_out" do
    it "should end the journey" do
      subject.in_journey = true
      subject.touch_out
      expect(subject.in_journey).to eq false

    end
  end


  
end