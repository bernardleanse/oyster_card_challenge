class Oystercard
  MAX_BALANCE = 90

  attr_accessor :balance, :in_journey
  def initialize
    @balance = 0
    @in_journey = false
  end

  def top_up(amount)
    raise "Maximum balance is #{MAX_BALANCE}" if @balance + amount > 90
    @balance += amount
  end

  def deduct(amount)
    @balance -= amount
  end

  def touch_in
    in_journey?(true)
  end

  def in_journey?(bool)
    raise "Error" unless [true, false].include? bool
    @in_journey = bool
  end

  def touch_out
    in_journey?(false)
  end

  


  # private
  # def over_max?
  #   @balance > 90
  # end

end