require 'transaction'

describe Transaction do
  subject(:transaction) { described_class.new({amount: ({pounds: 1000, pence: 0}), type: :credit, balance: ({pounds: 2000, pence: 0})}) }
  it { is_expected.to respond_to :date }

  it "is initialized with current date" do
    expect(transaction.date).to eq Date.today
  end

  it "holds an amount" do
    expect(transaction.amount).to eq({pounds: 1000, pence: 0})
  end

  it "has a type, either debit or credit" do
    expect(transaction.type).to eq :credit
  end

  it "holds bank balance state" do
    expect(transaction.balance).to eq({pounds: 2000, pence: 0})
  end
end
