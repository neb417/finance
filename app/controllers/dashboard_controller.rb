class DashboardController < ApplicationController
  include TotalCost
  include TaxedIncome

  def index
    @incomes = Income.order_by_type
    @fixed_expenses = FixedExpense.get_ordered
    build_taxed_income_vars!
    build_total_cost_vars!
  end
end
