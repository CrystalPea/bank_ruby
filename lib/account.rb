#calculates the balance

class Account
  attr_reader :balance

  def initialize
    @balance = {pounds: 0, pence: 0}
  end

  def make_deposit(amount)
    self.balance[:pounds] += amount[:pounds]
    self.balance[:pence] += amount[:pence]
  end

  def make_withdrawal(amount)
    self.balance[:pounds] -= amount[:pounds]
    self.balance[:pence] -= amount[:pence]
  end

  private
  attr_writer :balance

end
