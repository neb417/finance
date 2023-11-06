class IncomeTaxCalculator
  attr_reader :income,
    :annual_income,
    :federal_tax,
    :net_after_fed_tax,
    :state_tax,
    :total_net_income,
    :bi_weekly_net_income

  def initialize(income:)
    @income = income
    @annual_income = income.weekly_income_cents * 52
    @federal_tax = nil
    @net_after_fed_tax = nil
    @state_tax = nil
    @total_net_income = nil
    @bi_weekly_net_income = nil
  end

  def calculate_taxes
    @federal_tax = calculate_fed_tax
    @net_after_fed_tax = calculate_net_after_fed_tax
    @state_tax = calculate_state_tax
    @total_net_income = calculate_total_net_income
    @bi_weekly_net_income = calculate_bi_weekly_income
  end

  private

  def calculate_fed_tax
    bracket = FederalTaxBracket.where("bottom_range_cents <= ?", @annual_income).order(:bottom_range_cents).last
    rated = bracket.rate * @annual_income
    Money.new(rated + bracket.cumulative_cents, "USD")
  end

  def calculate_state_tax
    state_tax = (@net_after_fed_tax.fractional * 0.0463).to_i
    Money.new(state_tax, "USD")
  end

  def calculate_net_after_fed_tax
    Money.new(@annual_income - @federal_tax.fractional, "USD")
  end

  def calculate_total_net_income
    Money.new(@net_after_fed_tax.fractional - @state_tax.fractional, "USD")
  end

  def calculate_bi_weekly_income
    Money.new(@total_net_income.fractional / 26)
  end
end
