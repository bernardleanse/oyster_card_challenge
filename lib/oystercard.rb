class Oystercard
  MAX_BALANCE = 90
  MIN_FARE = 1
  INIT_BALANCE = 0

  attr_accessor :balance, :entry_station
  def initialize(balance = INIT_BALANCE, entry_station = nil)
    @balance = balance
    @entry_station = entry_station
  end

  def top_up(amount)
    raise "Maximum balance is #{MAX_BALANCE}" if @balance + amount > MAX_BALANCE
    @balance += amount
  end

  def touch_in(entry_station)
    raise "Insufficient funds: you need at least  #{MIN_FARE}" if @balance <= MIN_FARE
    @entry_station = entry_station
  end

  def touch_out
    @balance -= MIN_FARE
    @entry_station = nil
  end

  def in_journey?
    return true if @entry_station
    return false
  end

  private
  def deduct(amount)
    @balance -= amount
  end

  # private
  # def over_max?
  #   @balance > 90
  # end

end