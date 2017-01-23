require 'bank'

describe Bank do
  subject(:bank) { described_class.new }

  it "making deposit registers in the balance" do
    bank.make_deposit(1000)
    expect(bank.balance).to eq 1000
  end

end
