class StateTaxCalculator
  include Callable

  def initialize(income:)
    self.income = income
  end

  #  Colorado state tax rate is 4.4%
  def call
    income * 0.044
  end

  private

  attr_accessor :income
end
