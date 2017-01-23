class Operation
  attr_reader :date, :amount, :type, :balance

  def initialize(hash)
    @date = Date.today
    @amount = hash[:amount]
    @type = hash[:type]
    @balance = hash[:balance]
  end
end
