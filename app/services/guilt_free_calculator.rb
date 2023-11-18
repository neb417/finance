# frozen_string_literal: true

class GuiltFreeCalculator
  attr_reader :annual_guilt_free,
    :biannual_guilt_free,
    :quarterly_guilt_free,
    :monthly_guilt_free,
    :bi_weekly_guilt_free,
    :weekly_guilt_free,
    :daily_guilt_free

  def initialize(taxed_income, savings_totals)
    @taxed_income = taxed_income
    @savings_totals = savings_totals
    @annual_guilt_free = calculate_annual_guilt_free
    @biannual_guilt_free = calculate_biannual_guilt_free
    @quarterly_guilt_free = calculate_quarterly_guilt_free
    @monthly_guilt_free = calculate_monthly_guilt_free
    @bi_weekly_guilt_free = calculate_bi_weekly_guilt_free
    @weekly_guilt_free = calculate_weekly_guilt_free
    @daily_guilt_free = calculate_daily_guilt_free
  end

  def calculate_annual_guilt_free
    @taxed_income - @savings_totals
  end

  def calculate_biannual_guilt_free
    @annual_guilt_free / 2
  end

  def calculate_quarterly_guilt_free
    @annual_guilt_free / 4
  end

  def calculate_monthly_guilt_free
    @annual_guilt_free / 12
  end

  def calculate_bi_weekly_guilt_free
    @annual_guilt_free / 26
  end

  def calculate_weekly_guilt_free
    @annual_guilt_free / 52
  end

  def calculate_daily_guilt_free
    @annual_guilt_free / 365
  end
end
