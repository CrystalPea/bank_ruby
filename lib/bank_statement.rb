require "operation"

class BankStatement
  attr_reader :history

  def initialize
    @history = []
  end

  def add_operation(operation)
    self.history << operation
  end

  def prepare_statement
    statement = "date       || credit || debit  || balance\n"
    history.each do |operation|
      statement += "#{operation.date.strftime("%Y/%m/%d")} || #{operation.type == :credit ? operation.amount : "       "}|| #{operation.type == :debit ? operation.amount : "       "} || #{operation.balance}\n"
    end
    statement
  end

  def print_statement
    print prepare_statement
  end

end
