require 'account'

describe Account do
  subject(:account) { described_class.new }


  context "making deposits and withdrawals" do
    before do
      account.make_deposit(1000)
    end

    describe "#make_deposit" do
      it "adds deposit to the balance" do
        expect(account.balance).to eq 1000
      end
    end

    describe "#make_withdrawal" do
      before do
        account.make_withdrawal(300)
      end

      it "substracts deposit from the balance" do
        expect(account.balance).to eq 700
      end
    end
  end
end
