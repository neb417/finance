# frozen_string_literal: true

class SavingsCalculator
  attr_reader :saving_amount,
    :annual_saving,
    :biannual_saving,
    :quarterly_saving,
    :monthly_saving,
    :bi_weekly_saving,
    :weekly_saving,
    :daily_saving

  def initialize(income_type, saving_rate)
    @annual_income = income_type
    @saving_rate = saving_rate.rate
    @annual_saving = calculate_savings
    @bi_weekly_saving = calculate_bi_weekly_saving
    @daily_saving = calculate_daily_saving
    @weekly_saving = calculate_weekly_saving
    @monthly_saving = calculate_monthly_saving
    @quarterly_saving = calculate_quarterly_saving
    @biannual_saving = calculate_biannual_saving
  end

  def calculate_savings
    @annual_income * @saving_rate
  end

  def calculate_daily_saving
    @annual_saving / 365
  end

  def calculate_weekly_saving
    @annual_saving / 52
  end

  def calculate_bi_weekly_saving
    @annual_saving / 26
  end

  def calculate_monthly_saving
    @annual_saving / 12
  end

  def calculate_quarterly_saving
    @annual_saving / 4
  end

  def calculate_biannual_saving
    @annual_saving / 2
  end
end
