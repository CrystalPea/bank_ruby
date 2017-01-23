require 'account'

describe Account do
  subject(:account) { described_class.new }


  context "making deposits and withdrawals" do
    before do
      account.make_deposit({pounds: 1000, pence: 0})
    end

    describe "#make_deposit" do
      it "adds deposit to the balance" do
        expect(account.balance).to eq({pounds: 1000, pence: 0})
      end
    end

    describe "#make_withdrawal" do
      before do
        account.make_withdrawal({pounds: 300, pence: 0})
      end

      it "substracts deposit from the balance" do
        expect(account.balance).to eq({pounds: 700, pence: 0})
      end
    end
  end
end
