require_relative "transaction"

#holds transaction history and shows bank statement
class BankStatement
  TITLE = "   date   ||  credit  ||  debit   || balance  \n"
  LENGTH = 10

  def prepare_statement(history)
    statement = TITLE
    history.reverse.each do |transaction|
      date = format_date(transaction)
      credit = format_credit(transaction)
      debit = format_debit(transaction)
      balance = format_balance(transaction)
      statement += "#{date}||#{credit}||#{debit}||#{balance}\n"
    end
    statement
  end

  def print_statement(history)
    print prepare_statement(history)
  end

  private
  def format_cell(string)
    string.rjust(LENGTH)
  end

  def format_date(transaction)
    format_cell(transaction.date.strftime("%d/%m/%Y"))
  end

  def format_credit(transaction)
    if transaction.type == :credit
      format_cell("#{transaction.amount[:pounds]}.#{'%02d' % transaction.amount[:pence]}")
    else format_cell('')
    end
  end

  def format_debit(transaction)
    if transaction.type == :debit
      format_cell("#{transaction.amount[:pounds]}.#{'%02d' % transaction.amount[:pence]}")
    else format_cell('')
    end
  end

  def format_balance(transaction)
    format_cell("#{transaction.balance[:pounds]}.#{'%02d' % transaction.balance[:pence]}")
  end

end
