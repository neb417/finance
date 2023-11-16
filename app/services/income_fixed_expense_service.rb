# frozen_string_literal: true

class IncomeFixedExpenseService
  attr_reader :total_annual_cost, :total_monthly_cost, :total_bi_weekly_cost

  def initialize
    @total_annual_cost = FixedExpense.total_annual_cost
    @total_monthly_cost = FixedExpense.total_monthly_cost
    @total_bi_weekly_cost = FixedExpense.total_bi_weekly_cost
  end
end
