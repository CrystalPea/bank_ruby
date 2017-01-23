class Account
  attr_reader :balance, :history

  def initialize
    @balance = 0
    @history = []
  end

  def make_deposit(amount)
    self.balance += amount
    register_operation(amount, :credit)
  end

  def register_operation(amount, type)
    self.history << {date: Date.today, type => amount.to_f, balance: balance }
  end

  def make_withdrawal(amount)
    self.balance -= amount
    register_operation(amount, :debit)
  end

  private
  attr_writer :balance

end
