require "transaction_history"

describe TransactionHistory do
  subject(:transaction_history) { described_class.new }

  let(:transaction) { double :transaction, date: Date.new(2017,1,22), amount: 1000.0, type: :credit, balance: 1000.0 }
  let(:transaction_2) {double :transaction_2, date: Date.new(2017,1,23), amount: 300.0, type: :debit, balance: 700.0 }

  it "has empty history on initialisation" do
    expect(transaction_history.history).to eq []
  end

  it "can receive transactions and add them to the history" do
    transaction_history.add_transaction(transaction)
    expect(transaction_history.history).to eq [transaction]
  end
end
