class Bank
  attr_reader :balance

  def initialize
    @balance = 0
  end

  def make_deposit(amount)
    self.balance += amount
  end

  def make_withdrawal(amount)
    amount
  end

  private
  attr_writer :balance

end
