require 'journey'

describe Journey do
  let(:station1) { double :station }
  let(:station2) { double :station }
  
  it "should accept entry station" do
    journey = Journey.new(station1)
    expect(journey.entry_station).to eq station1
  end

  it "should accept exit station" do
    journey = Journey.new(station1, station2)
    expect(journey.exit_station).to eq station2
  end

  it "should have default fare" do
    expect(subject.fare).to eq Journey::DEFAULT_FARE
  end

  it "should "
end

