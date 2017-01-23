require 'bank'

describe Bank do
  subject(:bank) { described_class.new }

  it { is_expected.to respond_to :balance }

end
