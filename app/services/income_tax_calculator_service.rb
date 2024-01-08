class IncomeTaxCalculatorService
  attr_reader :income,
    :annual_income,
    :federal_tax,
    :fica_tax,
    :net_after_fed_tax,
    :state_tax,
    :total_net_income,
    :bi_weekly_net_income,
    :daily_income,
    :monthly_income,
    :weekly_income,
    :quarterly_income,
    :biannual_income

  def initialize(income:)
    @income = income
    @annual_income = income.weekly_income * 52
    @federal_tax = calculate_fed_tax
    @fica_tax = calculate_fica_tax
    @net_after_fed_tax = calculate_net_after_fed_tax
    @state_tax = calculate_state_tax
    @total_net_income = calculate_total_net_income
    @bi_weekly_net_income = calculate_bi_weekly_income
    @daily_income = calculate_daily_income
    @weekly_income = calculate_weekly_income
    @monthly_income = calculate_monthly_income
    @quarterly_income = calculate_quarterly_income
    @biannual_income = calculate_biannual_income
  end

  private

  def calculate_fed_tax
    bracket = FederalTaxBracket.where("bottom_range_cents <= ?", @annual_income.cents).order(:bottom_range_cents).last
    taxable_at_bracket_rate = Money.new(@annual_income.cents - bracket.bottom_range_cents)
    rated = bracket.rate * taxable_at_bracket_rate
    rated + bracket.cumulative
  end

  def calculate_fica_tax
    @annual_income * 0.0765
  end

  def calculate_state_tax
    @net_after_fed_tax * 0.0463
  end

  def calculate_net_after_fed_tax
    @annual_income - @federal_tax
  end

  def calculate_total_net_income
    @net_after_fed_tax - @fica_tax - @state_tax
  end

  def calculate_bi_weekly_income
    @total_net_income / 26
  end

  def calculate_daily_income
    @total_net_income / 365
  end

  def calculate_weekly_income
    @total_net_income / 52
  end

  def calculate_monthly_income
    @total_net_income / 12
  end

  def calculate_quarterly_income
    @total_net_income / 4
  end

  def calculate_biannual_income
    @total_net_income / 2
  end
end
