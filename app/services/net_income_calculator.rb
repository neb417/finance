class NetIncomeCalculator
  attr_reader :annual_income, :daily_income, :weekly_income, :monthly_income, :quarterly_income, :biannual_income

  def initialize(annual_income:)
    @annual_income = annual_income
    @biannual_income = biannual_income
    @quarterly_income = quarterly_income
    @monthly_income = monthly_income
    @weekly_income = weekly_income
    @daily_income = daily_income
  end

  def biannual_income
    annual_income / 2
  end

  def quarterly_income
    annual_income / 4
  end

  def monthly_income
    annual_income / 12
  end

  def weekly_income
    annual_income / 52
  end

  def daily_income
    annual_income / 365
  end
end
