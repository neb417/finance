class NetIncomeCalculator
  attr_reader :annual_income, :daily_income, :weekly_income, :monthly_income, :quarterly_income, :biannual_income

  def initialize(annual_income:)
    @annual_income = annual_income
    @biannual_income = calculate_biannual_income
    @quarterly_income = calculate_quarterly_income
    @monthly_income = calculate_monthly_income
    @weekly_income = calculate_weekly_income
    @daily_income = calculate_daily_income
  end

  def calculate_biannual_income
    @annual_income / 2
  end

  def calculate_quarterly_income
    @annual_income / 4
  end

  def calculate_monthly_income
    @annual_income / 12
  end

  def calculate_weekly_income
    @annual_income / 52
  end

  def calculate_daily_income
    @annual_income / 365
  end
end
