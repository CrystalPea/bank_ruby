require 'transaction'

describe Transaction do
  subject(:transaction) { described_class.new({amount: 1000, type: :credit, balance: 2000}) }
  it { is_expected.to respond_to :date }

  it "is initialized with current date" do
    expect(transaction.date).to eq Date.today
  end

  it "holds an amount" do
    expect(transaction.amount).to eq 1000
  end

  it "has a type, either debit or credit" do
    expect(transaction.type).to eq :credit
  end

  it "holds bank balance state" do
    expect(transaction.balance).to eq 2000
  end
end
