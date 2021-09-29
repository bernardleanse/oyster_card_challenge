class Journey
  attr_reader :entry_station, :exit_station, :fare
  PENALTY_FARE = 1
  def initialize(entry_station = nil, exit_station = nil)
    @entry_station = entry_station
    @exit_station = exit_station
    @fare = PENALTY_FARE
  end
 
end