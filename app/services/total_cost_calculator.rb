# frozen_string_literal: true

class TotalCostCalculator
  attr_reader :annual_cost,
              :biannual_cost,
              :quarterly_cost,
              :monthly_cost,
              :bi_weekly_cost,
              :weekly_cost,
              :daily_cost

  def initialize(cost:)
    @annual_cost = cost
    @biannual_cost = calculate_biannual_cost
    @quarterly_cost = calculate_quarterly_cost
    @monthly_cost = calculate_monthly_cost
    @bi_weekly_cost = calculate_bi_weekly_cost
    @weekly_cost = calculate_weekly_cost
    @daily_cost = calculate_daily_cost
  end

  def calculate_biannual_cost
    @annual_cost / 2
  end

  def calculate_quarterly_cost
    @annual_cost / 4
  end

  def calculate_monthly_cost
    @annual_cost / 12
  end

  def calculate_bi_weekly_cost
    @annual_cost / 26
  end

  def calculate_weekly_cost
    @annual_cost / 52
  end

  def calculate_daily_cost
    @annual_cost / 365
  end
end
