require 'bank_statement'
require 'date'

describe BankStatement do
  subject(:statement) { described_class.new }
  let(:operation) { double :operation, date: Date.new(2017,1,22), amount: 1000.00, type: :credit, balance: 1000.00 }
  let(:operation_2) {double :operation_2, date: Date.new(2017,1,23), amount: 300.00, type: :debit, balance: 700.00 }

  it "has empty history on initialisation" do
    expect(statement.history).to eq []
  end

  it "can receive operations and add them to the history" do
    statement.add_operation(operation)
    expect(statement.history).to eq [operation]
  end

  it "prints operations in reverse chronological order" do
    statement.add_operation(operation)
    statement.add_operation(operation_2)
    expect{statement.print_statement}.to output("date       || credit || debit  || balance\n23/01/2017 ||        || 300.00 || 700.00\n22/01/2017 || 1000.00||        || 1000.00").to_stdout
  end
end
