class Oystercard
  MAX_BALANCE = 90
  MIN_FARE = 1
  INIT_BALANCE = 0

  attr_accessor :balance, :in_journey
  def initialize(balance = INIT_BALANCE)
    @balance = balance
    @in_journey = false
  end

  def top_up(amount)
    raise "Maximum balance is #{MAX_BALANCE}" if @balance + amount > MAX_BALANCE
    @balance += amount
  end

  def deduct(amount)
    @balance -= amount
  end

  def touch_in
    raise "Insufficient funds: you need at least  #{MIN_FARE}" if @balance <= MIN_FARE
    @in_journey = true
  end

  def touch_out
    @in_journey = false
  end

  


  # private
  # def over_max?
  #   @balance > 90
  # end

end