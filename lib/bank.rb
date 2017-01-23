require_relative "account"
require_relative "operation"
require_relative "bank_statement"

class Bank

  attr_reader :account, :operation_klass, :bank_statement

  def initialize(hash)
    @bank_statement = hash[:bank_statement]
    @operation_klass = hash[:operation_klass]
    @account = hash[:account]
  end

  def make_deposit(amount)
    self.account.make_deposit(amount)
    create_operation(amount, :credit)
  end

  def make_withdrawal(amount)
    self.account.make_withdrawal(amount)
    create_operation(amount, :debit)
  end

  def create_operation(amount, type)
    operation = operation_klass.new({ amount: amount.to_f, type: type, balance: account.balance })
    register_operation(operation)
  end

  def register_operation(operation)
    self.bank_statement.history << operation
  end

  def see_history
    bank_statement.history
  end

  def show_bank_statement
    bank_statement.print_statement
  end

  private
  attr_writer :account, :operation_klass, :bank_statement
end
