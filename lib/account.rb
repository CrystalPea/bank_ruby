require_relative "operation"
require_relative "bank_statement"

class Account
  attr_reader :balance, :bank_statement

  def initialize(hash)
    @balance = 0
    @bank_statement = hash[:bank_statement]
    @operation_klass = hash[:operation_klass]
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
    self.bank_statement.history << operation
  end

  def make_withdrawal(amount)
    self.balance -= amount
    create_operation(amount, :debit)
  end

  def see_history
    bank_statement.history
  end

  def show_bank_statement
    bank_statement.print_statement
  end

  private
  attr_writer :balance, :bank_statement
  attr_accessor :operation_klass

end
