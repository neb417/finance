class FederalTaxCalculator
  include Callable

  def initialize(income:, federal_tax_table_type_id:)
    self.income = income
    self.federal_tax_table_type_id = federal_tax_table_type_id
  end

  def call
    calculate
  end

  private

  attr_accessor :income, :federal_tax_table_type_id

  def calculate
    bracket = FederalTaxBracket.where(federal_tax_table_type_id: federal_tax_table_type_id ).where("bottom_range_cents <= ?", income.fractional).order(:bottom_range_cents).last
    taxable_at_bracket_rate = Money.new(income - bracket.bottom_range)
    rated = bracket.rate * taxable_at_bracket_rate
    rated + bracket.cumulative
  end
end
