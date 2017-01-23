require 'bank_Statement'

describe BankStatement do
  subject(:statement) { described_class.new }
  let(:operation) { double :operation }

  it "has empty history on initialisation" do
    expect(statement.history).to eq []
  end

  it "can receive operations and add them to the history" do
    statement.add_operation(operation)
    expect(statement.history).to eq [operation]
  end
end
