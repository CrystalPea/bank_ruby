require 'bank'

describe Bank do
  subject(:bank) { described_class.new }

  it { is_expected.to respond_to :balance }

  it { is_expected.to respond_to(:make_deposit).with(1).argument }

  it "making deposit affects the balance" do
    bank.make_deposit(1000)
    expect(bank.balance).to eq 1000
  end

end
