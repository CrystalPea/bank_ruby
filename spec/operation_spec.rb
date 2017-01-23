require 'operation'

describe Operation do
  subject(:operation) { described_class.new }
  it { is_expected.to respond_to :date }

  it "is initialized with current date" do
    expect(operation.date).to eq Date.today
  end
end
