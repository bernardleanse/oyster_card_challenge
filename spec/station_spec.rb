require 'station'

describe Station do
  let(:station) { Station.new("Earls Court", 1) }
  
  it "should give station name" do
    expect(station.name).to eq "Earls Court"
  end

  it "should give station zone" do
    expect(station.zone).to eq 1
  end
end