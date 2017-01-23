class Account
  attr_reader :balance, :history

  def initialize
    @balance = 0
    @history = []
  end

  def make_deposit(amount)
    self.balance += amount
    self.history << {date: Date.today, credit: amount.to_f, debit: nil, balance: balance }
  end

  def make_withdrawal(amount)
    self.balance -= amount
  end

  private
  attr_writer :balance

end
