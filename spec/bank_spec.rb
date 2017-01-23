require 'bank'

describe Bank do
  let(:operation_klass) { double :operation_klass }
  let(:bank_statement) { double :bank_statement, history: [] }
  let(:account) { double :account, balance: 0 }
  subject(:bank) { described_class.new({operation_klass: operation_klass, bank_statement: bank_statement, account: account}) }
  let(:deposit_operation) { double :deposit_operation }
  let(:withdrawal_operation) { double :withdrawal_operation }

  it "lets user deposit money" do
    expect(account).to receive(:make_deposit).with(1000)
    allow(bank).to receive(:create_operation).with(1000, :credit) { bank.register_operation(deposit_operation) }
    bank.make_deposit(1000)
  end

  it "registers deposit in operation history" do
    allow(account).to receive(:make_deposit).with(1000)
    allow(bank).to receive(:create_operation).with(1000, :credit) { bank.register_operation(deposit_operation) }
    bank.make_deposit(1000)
    expect(bank.see_history).to eq [deposit_operation]
  end

  it "lets user withdraw money" do
    expect(account).to receive(:make_withdrawal).with(300)
    allow(bank).to receive(:create_operation).with(300, :debit) { bank.register_operation(withdrawal_operation) }
    bank.make_withdrawal(300)
  end

  it "registers withdrawal in operation history" do
    allow(account).to receive(:make_withdrawal).with(300)
    allow(bank).to receive(:create_operation).with(300, :debit) { bank.register_operation(withdrawal_operation) }
    bank.make_withdrawal(300)
    expect(bank.see_history).to eq [withdrawal_operation]
  end


end
