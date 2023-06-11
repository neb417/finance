class DashboardController < ApplicationController
  def index
    @incomes = Income.all
    @fixed_expenses = FixedExpense.all.order(annual_cost_cents: :desc)
    @totals = FixedExpense.total_costs
  end
end
