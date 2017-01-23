require_relative "transaction"

#holds transaction history and shows bank statement
class BankStatement

  def prepare_statement(history)
    statement = "date       || credit || debit  || balance\n"
    history.reverse.each do |transaction|
      statement += "#{transaction.date.strftime("%d/%m/%Y")} || #{transaction.type == :credit ? transaction.amount : "      "}|| #{transaction.type == :debit ? transaction.amount : "     "} || #{transaction.balance}\n"
    end
    statement
  end

  def print_statement(history)
    print prepare_statement(history)
  end

end
