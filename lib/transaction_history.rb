class TransactionHistory

  attr_reader :history

  def initialize
    @history = []
  end

  def add_transaction(transaction)
    self.history << transaction
  end

end
