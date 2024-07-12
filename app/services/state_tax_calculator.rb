class StateTaxCalculator
  include Callable

  def initialize(state:, income:)
    self.income = income
    self.state = state
  end

  def call
    income * 0.044
  end

  private

  attr_accessor :income, :state

end