require 'bank'

describe Bank do
  subject(:bank) { described_class.new }

  it "adds deposit to the balance" do
    bank.make_deposit(1000)
    expect(bank.balance).to eq 1000
  end

  it { is_expected.to respond_to(:make_withdrawal).with(1).argument }

  it "substracts deposit from the balance" do
    bank.make_deposit(1000)
    bank.make_withdrawal(300)
    expect(bank.balance).to eq 700
  end

end
