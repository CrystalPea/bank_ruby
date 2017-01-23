require 'bank_Statement'

describe BankStatement do
  subject(:statement) { described_class.new }

  it "has empty history on initialisation" do
    expect(statement.history).to eq []
  end
end
