class Bank

  attr_reader :account, :operation_klass, :bank_statement

  def initialize(hash)
    @bank_statement = hash[:bank_statement]
    @operation_klass = hash[:operation_klass]
    @account = hash[:account]
  end

  def make_deposit(amount)
    self.account.make_deposit(amount)
  end

  private
  attr_writer :account, :operation_klass, :bank_statement
end
