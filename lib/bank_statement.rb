class BankStatement
  attr_reader :history

  def initialize
    @history = []
  end

  def add_operation(operation)
    self.history << operation
  end

end
