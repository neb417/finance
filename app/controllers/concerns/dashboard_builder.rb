# frozen_string_literal: true

module DashboardBuilder
  include TaxedIncome
  include TotalCost

  def build_dashboard_variables!
    @incomes = Income.order_by_type
    @fixed_expenses = FixedExpense.get_ordered
    build_taxed_income_vars!
    build_total_cost_vars!
  end
end
