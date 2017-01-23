require_relative "operation"

class Account
  attr_reader :balance, :history

  def initialize(operation_klass)
    @balance = 0
    @history = []
    @operation_klass = operation_klass
  end

  def make_deposit(amount)
    self.balance += amount

    create_operation(amount, :credit)
  end

  def create_operation(amount, type)
    operation = operation_klass.new({ amount: amount.to_f, type: type, balance: balance })
    register_operation(operation)
  end

  def register_operation(operation)
    self.history << operation
  end

  def make_withdrawal(amount)
    self.balance -= amount
    create_operation(amount, :debit)
  end

  private
  attr_writer :balance
  attr_accessor :operation_klass

end
