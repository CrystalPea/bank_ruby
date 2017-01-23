class Operation
  attr_reader :date, :debit

  def initialize(debit=nil)
    @date = Date.today
    @debit = debit
  end
end
