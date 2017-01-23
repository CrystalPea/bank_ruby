require 'bank'

describe Bank do
  subject(:bank) { described_class.new }

  context "making deposits and withdrawals" do
    before do
      bank.make_deposit(1000)
    end
    
    describe "#make_deposit" do
      it "adds deposit to the balance" do
        expect(bank.balance).to eq 1000
      end

    end

    describe "#make_withdrawal" do
      it "substracts deposit from the balance" do
        bank.make_withdrawal(300)
        expect(bank.balance).to eq 700
      end

    end
  end

end
