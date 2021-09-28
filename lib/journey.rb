class Journey
  attr_reader :entry_station, :exit_station, :fare
  DEFAULT_FARE = 1
  def initialize(entry_station = nil, exit_station = nil)
    @entry_station = entry_station
    @exit_station = exit_station
    @fare = DEFAULT_FARE
  end
 
end