# frozen_string_literal: true

module DashboardBuilder
  extend ActiveSupport::Concern
  include TaxedIncome
  include TotalCost
  include SaveIncome
  include GuiltFree

  def build_dashboard_variables!
    @incomes = Income.order_by_type
    @fixed_expenses = FixedExpense.get_ordered
    @savings_rate = SavingsRate.savings
    @investing_rate = SavingsRate.investing
    build_taxed_income_vars!
    build_savings_vars!
    build_guilt_free_vars!
    build_total_cost_vars!
    Rails.logger.debug "\n *** Building Vars!!\n "
  end
end
