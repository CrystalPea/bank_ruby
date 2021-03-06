require 'bank'

describe Bank do
  let(:transaction_klass) { double :transaction_klass }
  let(:transaction_history) { double :transaction_history, history: [] }
  let(:bank_statement) { double :bank_statement}
  let(:account) { double :account, balance: ({pounds: 0, pence: 0}) }
  subject(:bank) { described_class.new({transaction_klass: transaction_klass, transaction_history: transaction_history, bank_statement: bank_statement, account: account}) }
  let(:deposit_transaction) { double :deposit_transaction }
  let(:withdrawal_transaction) { double :withdrawal_transaction }


  context "making deposits and withdrawals" do
    describe "#make_deposit" do
      it "lets user deposit money" do
        expect(account).to receive(:make_deposit).with({pounds: 1000, pence: 0})
        allow(bank).to receive(:create_transaction).with(({pounds: 1000, pence: 0}), :credit) { bank.register_transaction(deposit_transaction) }
        bank.make_deposit({pounds: 1000, pence: 0})
      end

      it "registers deposit in transaction history" do
        allow(account).to receive(:make_deposit).with({pounds: 1000, pence: 0})
        allow(bank).to receive(:create_transaction).with(({pounds: 1000, pence: 0}), :credit) { bank.register_transaction(deposit_transaction) }
        bank.make_deposit({pounds: 1000, pence: 0})
        expect(bank.see_history).to eq [deposit_transaction]
      end
    end

    describe "#make_withdrawal" do
      it "lets user withdraw money" do
        expect(account).to receive(:make_withdrawal).with({pounds: 300, pence: 0})
        allow(bank).to receive(:create_transaction).with(({pounds: 300, pence: 0}), :debit) { bank.register_transaction(withdrawal_transaction) }
        bank.make_withdrawal({pounds: 300, pence: 0})
      end

      it "registers withdrawal in transaction history" do
        allow(account).to receive(:make_withdrawal).with({pounds: 300, pence: 0})
        allow(bank).to receive(:create_transaction).with(({pounds: 300, pence: 0}), :debit) { bank.register_transaction(withdrawal_transaction) }
        bank.make_withdrawal({pounds: 300, pence: 0})
        expect(bank.see_history).to eq [withdrawal_transaction]
      end
    end
  end

  context "checking bank account statement" do
    describe "#show_bank_statement" do
      it "prints history of transactions to screen" do
      expect(bank_statement).to receive(:print_statement).with(bank.see_history)
      bank.show_bank_statement
      end
    end
  end
end
