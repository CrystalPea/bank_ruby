require_relative "transaction"

#holds transaction history and shows bank statement
class BankStatement
  TITLE = "date      ||  credit  ||  debit   || balance  \n"
  LENGTH = 10

  def prepare_statement(history)
    statement = TITLE
    history.reverse.each do |transaction|
      date = format_cell(transaction.date.strftime("%d/%m/%Y"))
      credit = transaction.type == :credit ? format_cell(transaction.amount.to_s) : format_cell('')
      debit = transaction.type == :debit ? format_cell(transaction.amount.to_s): format_cell('')
      balance = format_cell(transaction.balance.to_s)
      statement += "#{date}||#{credit}||#{debit}||#{balance}\n"
    end
    statement
  end

  def print_statement(history)
    print prepare_statement(history)
  end

  private
  def format_cell(string)
    (string + ' ' * LENGTH )[0, LENGTH]
  end

end
