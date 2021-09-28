require 'oystercard'

describe Oystercard do

  let(:entry_station) {double :entry_station}

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

  describe "#touch_in" do

    it "should allow card to touch in" do
      expect(subject).to respond_to(:touch_in)
    end

    it "should give error when balance is less than minimum fare" do
      subject.balance = 0
      expect{subject.touch_in(entry_station)}.to raise_error "Insufficient funds: you need at least  #{Oystercard::MIN_FARE}"
    end

    it "should record entry station" do
      subject.top_up(20) 
      subject.touch_in(entry_station)
      expect(subject.entry_station).to eq(entry_station)
    end
  end

  describe "#in_journey" do
    it "should be in journey after touching in" do
      subject.top_up(50)
      subject.touch_in(entry_station)
      expect(subject.in_journey?).to eq(true) 
    end
   
  end

  describe "#touch_out" do
    subject {Oystercard.new(50)}
    it "should end the journey" do
      subject.touch_in(entry_station)
      subject.touch_out
      expect(subject.in_journey?).to eq false
    end

    it "should deduct after touch_out" do
      subject.touch_in(entry_station)
      expect { subject.touch_out }.to change { subject.balance }.by(-Oystercard::MIN_FARE)
    end

    it 'should forget the entry station' do
      subject.touch_in(entry_station)
      subject.touch_out
      expect(subject.entry_station).to eq(nil)
    end


  end


  
end