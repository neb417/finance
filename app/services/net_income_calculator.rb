class NetIncomeCalculator
  attr_reader :annual_income, :daily_income, :weekly_income, :monthly_income, :quarterly_income, :biannual_income

  def initialize(annual_income:)
    @annual_income = annual_income
    @biannual_income = annual_income / 2
    @quarterly_income = annual_income / 4
    @monthly_income = annual_income / 12
    @weekly_income = annual_income / 52
    @daily_income = annual_income / 365
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
