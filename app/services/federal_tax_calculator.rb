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
    bracket = FederalTaxBracket.where("bottom_range_cents <= ?", taxable_income.fractional).order(:bottom_range_cents).last
    taxable_at_bracket_rate = Money.new(taxable_income - bracket.bottom_range)
    rated = bracket.rate * taxable_at_bracket_rate
    rated + bracket.cumulative
  end

  def taxable_income
    # 2024 standard deduction = 13,850
    @taxable_income ||= income - Money.new(13_850_00)
  end
end
