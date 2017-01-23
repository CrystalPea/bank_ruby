require 'bank_statement'
require 'date'

describe BankStatement do
  subject(:statement) { described_class.new }
  let(:transaction) { double :transaction, date: Date.new(2017,1,22), amount: ({pounds: 1000, pence: 0}), type: :credit, balance: ({pounds: 1000, pence: 0})}
  let(:transaction_2) {double :transaction_2, date: Date.new(2017,1,23), amount: ({pounds: 300, pence: 0}), type: :debit, balance: ({pounds: 700, pence: 0}) }
  let(:history) {[transaction, transaction_2]}

  it "prints transactions in reverse chronological order" do
    expect{statement.print_statement(history)}.to output("date      ||  credit  ||  debit   || balance  \n23/01/2017||          ||300.00    ||700.00    \n22/01/2017||1000.00   ||          ||1000.00   \n").to_stdout
  end
end
