class NetIncomeCalculator
  include Callable

  def initialize(annual_income:)
    self.annual_income = annual_income
  end

  def call
    calculate_incomes
  end

  private

  attr_accessor :annual_income, :daily_income, :weekly_income, :monthly_income, :quarterly_income, :biannual_income

  def calculate_incomes
    self.daily_income = annual_income / 365
    self.weekly_income = annual_income / 52
    self.monthly_income = annual_income / 12
    self.quarterly_income = annual_income / 4
    self.biannual_income = annual_income / 2
  end
end