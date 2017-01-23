require_relative "account"
require_relative "transaction"
require_relative "bank_statement"

#interacts with the user
class Bank

  attr_reader :account, :transaction_klass, :bank_statement

  def initialize(hash)
    @bank_statement = hash[:bank_statement]
    @transaction_klass = hash[:transaction_klass]
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
    transaction = transaction_klass.new({ amount: amount.to_f, type: type, balance: account.balance })
    register_transaction(transaction)
  end

  def register_transaction(transaction)
    self.bank_statement.history << transaction
  end

  def see_history
    bank_statement.history
  end

  def show_bank_statement
    bank_statement.print_statement
  end

  private
  attr_writer :account, :transaction_klass, :bank_statement
end
