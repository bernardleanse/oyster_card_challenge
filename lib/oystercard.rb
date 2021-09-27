class Oystercard
  MAX_BALANCE = 90

  attr_accessor :balance
  def initialize
    @balance = 0
  end

  def top_up(amount)
    raise "Maximum balance is #{MAX_BALANCE}" if @balance + amount > 90
    @balance += amount
  end

  def deduct(amount)
    @balance -= amount
  end

  # private
  # def over_max?
  #   @balance > 90
  # end

end