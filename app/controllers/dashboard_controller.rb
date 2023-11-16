class DashboardController < ApplicationController
  def index
    @incomes = Income.order_by_type
    @fixed_expenses = FixedExpense.get_ordered
    @total_annual_cost = FixedExpense.total_annual_cost
    @total_monthly_cost = FixedExpense.total_monthly_cost
    @total_bi_weekly_cost = FixedExpense.total_bi_weekly_cost
    @federal_tax_brackets = FederalTaxBracket.order_by_range
    @salary_taxed = Income.tax_on_income(income_type: "Salary")
    @hourly_taxed = Income.tax_on_income(income_type: "Hourly")
  end
end
