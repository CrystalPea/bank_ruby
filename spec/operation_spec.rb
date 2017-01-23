require 'operation'

describe Operation do
  subject(:operation) { described_class.new(1000, :credit) }
  it { is_expected.to respond_to :date }

  it "is initialized with current date" do
    expect(operation.date).to eq Date.today
  end

  it "can hold amount" do
    expect(operation.amount).to eq 1000
  end

  it "has a type, either debit or credit" do
    expect(operation.type).to eq :credit
  end


end
