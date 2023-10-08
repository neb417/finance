class DashboardController < ApplicationController
  include SetDashboardInstanceVariables
  def index
    @incomes = Income.all
    @fixed_expenses = FixedExpense.get_ordered
    @totals = FixedExpense.total_costs
  end
end
