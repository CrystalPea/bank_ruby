require_relative "transaction"

#holds transaction history and shows bank statement
#I need to extract history to a separate class
class BankStatement
  attr_reader :history

  def initialize
    @history = []
  end

  def add_transaction(transaction)
    self.history << transaction
  end

  def prepare_statement
    statement = "date       || credit || debit  || balance\n"
    history.reverse.each do |transaction|
      statement += "#{transaction.date.strftime("%d/%m/%Y")} || #{transaction.type == :credit ? transaction.amount : "      "}|| #{transaction.type == :debit ? transaction.amount : "     "} || #{transaction.balance}\n"
    end
    statement
  end

  def print_statement
    print prepare_statement
  end

end
