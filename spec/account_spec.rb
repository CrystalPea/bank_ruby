require 'account'

describe Account do
  let(:operation_klass) { double :operation_klass }
  let(:bank_statement) { double :bank_statement, history: [] }
  subject(:account) { described_class.new({operation_klass: operation_klass, bank_statement: bank_statement}) }
  let(:deposit_operation) { double :deposit_operation }
  let(:withdrawal_operation) { double :withdrawal_operation }

  context "making deposits and withdrawals" do
    before do
      allow(account).to receive(:create_operation).with(1000, :credit) { account.register_operation(deposit_operation) }
      account.make_deposit(1000)
    end

    describe "#make_deposit" do
      it "adds deposit to the balance" do
        expect(account.balance).to eq 1000
      end

      it "registers deposit in operation history" do
        expect(account.see_history).to eq [deposit_operation]
      end
    end

    describe "#make_withdrawal" do
      before do
        allow(account).to receive(:create_operation).with(300, :debit) { account.register_operation(withdrawal_operation) }
        account.make_withdrawal(300)
      end

      it "substracts deposit from the balance" do
        expect(account.balance).to eq 700
      end

      it "registers withdrawal in operation history" do
        expect(account.see_history).to eq [deposit_operation, withdrawal_operation]
      end
    end
  end



end
