require_relative "transaction"

#holds transaction history and shows bank statement
class BankStatement
  TITLE = "date      ||  credit  ||  debit   || balance  \n"
  LENGTH = 10

  def prepare_statement(history)
    statement = TITLE
    history.reverse.each do |transaction|
      date = (transaction.date.strftime("%d/%m/%Y") + ' ' * LENGTH )[0, LENGTH]
      credit = (transaction.type == :credit ? ((transaction.amount.to_s) + ' ' * LENGTH )[0, LENGTH] : ' '*LENGTH)
      debit = (transaction.type == :debit ? ((transaction.amount.to_s) + ' ' * LENGTH )[0, LENGTH] : ' '*LENGTH)
      balance = (transaction.balance.to_s + ' ' * LENGTH )[0, LENGTH]
      statement += "#{date}||#{credit}||#{debit}||#{balance}\n"
    end
    statement
  end

  def print_statement(history)
    print prepare_statement(history)
  end

end
