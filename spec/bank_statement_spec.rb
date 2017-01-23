require 'bank_statement'
require 'date'

describe BankStatement do
  subject(:statement) { described_class.new }
  let(:transaction) { double :transaction, date: Date.new(2017,1,22), amount: 1000.0, type: :credit, balance: 1000.0 }
  let(:transaction_2) {double :transaction_2, date: Date.new(2017,1,23), amount: 300.0, type: :debit, balance: 700.0 }
  let(:history) {[transaction, transaction_2]}

  it "prints transactions in reverse chronological order" do
    expect{statement.print_statement(history)}.to output("date       || credit || debit  || balance\n23/01/2017 ||       || 300.0 || 700.0\n22/01/2017 || 1000.0||       || 1000.0\n").to_stdout
  end
end
