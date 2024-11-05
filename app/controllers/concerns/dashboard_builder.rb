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
    build_income_tax_variables!
    build_savings_vars!(salary_income: @salary_taxed.net_income, hourly_income: @hourly_taxed.net_income)
    build_guilt_free_vars!
    build_total_cost_vars!
  end

  def build_locals(taxed_income)
    {

      total_cost: @total_cost,
      investing_amount: taxed_income.is_hourly? ? @hourly_invest : @salary_invest,
      savings_amount: taxed_income.is_hourly? ? @hourly_saving : @salary_saving,
      guilt_free: taxed_income.is_hourly? ? @guilt_free_hourly : @guilt_free_salary
    }
  end
end
