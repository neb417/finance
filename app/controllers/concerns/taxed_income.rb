# frozen_string_literal: true

module TaxedIncome
  extend ActiveSupport::Concern

  def tax_on_salary
    income = Income.find_by(income_type: "Salary")
    IncomeTaxCalculatorService.new(income: income)
  end

  def tax_on_hourly
    income = Income.find_by(income_type: "Hourly")
    IncomeTaxCalculatorService.new(income: income)
  end

  def build_taxed_income_vars!
    @salary_taxed = tax_on_salary
    @hourly_taxed = tax_on_hourly
  end
end
