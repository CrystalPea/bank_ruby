require 'operation'

describe Operation do
  subject(:operation) { described_class.new({amount: 1000, type: :credit, balance: 2000}) }
  it { is_expected.to respond_to :date }

  it "is initialized with current date" do
    expect(operation.date).to eq Date.today
  end

  it "holds an amount" do
    expect(operation.amount).to eq 1000
  end

  it "has a type, either debit or credit" do
    expect(operation.type).to eq :credit
  end

  it "holds bank balance state" do
    expect(operation.balance).to eq 2000
  end
end
