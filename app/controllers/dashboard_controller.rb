class DashboardController < ApplicationController
  def index
    @incomes = Income.all
    @fixed_expenses = FixedExpense.all
    @totals = FixedExpense.total_costs
  end
end
