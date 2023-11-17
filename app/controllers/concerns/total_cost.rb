# frozen_string_literal: true

module TotalCost
  def total_annual_cost
    Money.new(get_sum(:annual_cost_cents))
  end

  def total_monthly_cost
    Money.new(get_sum(:monthly_cost_cents))
  end

  def total_bi_weekly_cost
    Money.new(get_sum(:bi_weekly_cost_cents))
  end

  def build_total_cost_vars!
    @total_annual_cost = total_annual_cost
    @total_monthly_cost = total_monthly_cost
    @total_bi_weekly_cost = total_bi_weekly_cost
  end

  private

  def get_sum(time_period)
    FixedExpense.sum(&time_period)
  end
end
