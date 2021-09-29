require 'oystercard'

describe Oystercard do

  let(:entry_station) {double :entry_station}
  let(:exit_station) {double :exit_station}

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

    before do
      subject.touch_in(entry_station)
      subject.touch_out(exit_station)
    end

    it "should end the journey" do
      expect(subject.in_journey?).to eq false
    end

    it "should deduct after touch_out" do
      expect { subject.touch_out(exit_station) }.to change{ subject.balance }.by(-Oystercard::MIN_FARE)
    end

    it 'should forget the entry station' do
      expect(subject.entry_station).to eq(nil)
    end

    it 'should add an exit station' do
      expect(subject.exit_station).to eq(exit_station)
    end
    oi = 'oi'
    ok 
  end

    it {is_expected.to respond_to(:journeys)}

  describe '#journeys' do 
    let(:journey) { { entry_station: entry_station, exit_station: exit_station } }

    it 'should store a journey' do
      subject.top_up(50)
      subject.touch_in(entry_station)
      subject.touch_out(exit_station)
      expect(subject.journeys).to include(journey)
    end

  end


  
end