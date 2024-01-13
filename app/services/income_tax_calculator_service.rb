class IncomeTaxCalculatorService
  attr_reader :income,
              :annual_income,
              :fica_tax,
              :agi_deduction,
              :agi,
              :federal_income_tax,
              :total_federal_tax,
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
    @fica_tax = calculate_fica_tax
    @agi_deduction = calculate_agi_deduction
    @agi = calculate_agi
    @federal_income_tax = calculate_fed_tax
    @total_federal_tax = calculate_total_federal_tax
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

  def calculate_fica_tax
    @annual_income * 0.153
  end

  def calculate_agi_deduction
    @fica_tax * 0.5
  end

  def calculate_agi
    @annual_income - @agi_deduction
  end

  def calculate_fed_tax
    bracket = FederalTaxBracket.where("bottom_range_cents <= ?", @agi.cents).order(:bottom_range_cents).last
    taxable_at_bracket_rate = Money.new(@agi - bracket.bottom_range)
    rated = bracket.rate * taxable_at_bracket_rate
    rated + bracket.cumulative
  end

  def calculate_total_federal_tax
    @fica_tax + @federal_income_tax
  end

  def calculate_state_tax
    @net_after_fed_tax * 0.044
  end

  def calculate_net_after_fed_tax
    @agi - @federal_income_tax
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
