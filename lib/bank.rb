require_relative "account"
require_relative "transaction"
require_relative "bank_statement"
require_relative "transaction_history"

#interacts with the user
class Bank

  attr_reader :account, :transaction_klass, :bank_statement, :transaction_history

  def initialize(hash)
    @bank_statement = hash[:bank_statement]
    @transaction_klass = hash[:transaction_klass]
    @transaction_history = hash[:transaction_history]
    @account = hash[:account]
  end

  def make_deposit(amount)
    self.account.make_deposit(amount)
    create_transaction(amount, :credit)
  end

  def make_withdrawal(amount)
    self.account.make_withdrawal(amount)
    create_transaction(amount, :debit)
  end

  def create_transaction(amount, type)
    transaction = transaction_klass.new({ amount: amount, type: type, balance: account.balance })
    register_transaction(transaction)
  end

  def register_transaction(transaction)
    self.transaction_history.history << transaction
  end

  def see_history
    transaction_history.history
  end

  def show_bank_statement
    bank_statement.print_statement(see_history)
  end

  private
  attr_writer :account, :transaction_klass, :bank_statement, :transaction_history
end
