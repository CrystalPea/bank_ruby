require 'bank'

describe Bank do
  let(:operation_klass) { double :operation_klass }
  let(:bank_statement) { double :bank_statement, history: [] }
  let(:account) { double :account, balance: 0 }
  subject(:bank) { described_class.new({operation_klass: operation_klass, bank_statement: bank_statement, account: account}) }

  it "lets user deposit money" do
    expect(account).to receive(:make_deposit).with(300)
    bank.make_deposit(300)
  end


end
