#calculates the balance

class Account
  attr_reader :balance

  def initialize
    @balance = 0.00
  end

  def make_deposit(amount)
    self.balance += amount
  end

  def make_withdrawal(amount)
    self.balance -= amount
  end

  private
  attr_writer :balance

end
