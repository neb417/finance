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
  end

  def build_locals(taxed_income)
    income = taxed_income.income
    {
      income: taxed_income,
      total_cost: @total_cost,
      investing_amount: income.is_hourly? ? @hourly_invest : @salary_invest,
      savings_amount: income.is_hourly? ? @hourly_saving : @salary_saving,
      guilt_free: income.is_hourly? ? @guilt_free_hourly : @guilt_free_salary
    }
  end
end
