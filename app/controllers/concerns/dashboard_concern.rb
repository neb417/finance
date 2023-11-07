module DashboardConcern
  extend ActiveSupport::Concern

  included do
  end

  def build_instance_variables
    @incomes = Income.order_by_type
    @fixed_expenses = FixedExpense.get_ordered
    @totals = FixedExpense.total_costs
    @federal_tax_brackets = FederalTaxBracket.order_by_range
    @salary_taxed = Income.tax_on_income(income_type: "Salary")
    @hourly_taxed = Income.tax_on_income(income_type: "Hourly")
  end
end
