class FederalTaxCalculator
  include Callable

  def initialize(income:)
    self.income = income
  end

  def call
    calculate
  end

  private

  attr_accessor :income

  def calculate
    bracket = FederalTaxBracket.where("bottom_range_cents <= ?", income.fractional).order(:bottom_range_cents).last
    taxable_at_bracket_rate = Money.new(income - bracket.bottom_range)
    rated = bracket.rate * taxable_at_bracket_rate
    rated + bracket.cumulative
  end
end
