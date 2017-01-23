class Operation
  attr_reader :date, :amount, :type

  def initialize(amount, type)
    @date = Date.today
    @amount = amount
    @type = :credit
  end
end
