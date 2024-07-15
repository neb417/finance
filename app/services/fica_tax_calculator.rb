class FicaTaxCalculator
  include Callable

  def initialize(income:)
    self.income = income
  end

  def call
    income * 0.0765
  end

  private

  attr_accessor :income
end
