require 'operation'

describe Operation do
  subject(:operation) { described_class.new }
  it { is_expected.to respond_to :date }
end
