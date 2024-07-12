# frozen_string_literal: true

module TaxedIncome
  extend ActiveSupport::Concern

  def build_taxed_income_vars!
    @salary_taxed = net_income(annual_income: salary_income)
    @hourly_taxed = net_income(annual_income: hourly_income)
  end

  private

  def salary_income
    @salary_income ||= Income.find_by(income_type: "Salary").weekly_income * 52
  end

  def hourly_income
    @hourly_income ||= Income.find_by(income_type: "Hourly").weekly_income * 52
  end

  def fica_tax(income:)
    @fica_tax ||= FicaTaxCalculator.call(income: income)
  end

  def federal_tax(income:)
    @federal_tax ||= FederalTaxCalculator.call(income: income)
  end

  def state_tax(income:)
    @state_tax ||= StateTaxCalculator.call(income: income)
  end

  def net_income(annual_income:)
    income = annual_income - (fica_tax(income: annual_income) + federal_tax(income: annual_income) + state_tax(income: annual_income))

    @net_income ||= NetIncomeCalculator.call(annual_income: income)
  end
end
