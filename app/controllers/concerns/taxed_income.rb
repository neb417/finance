# frozen_string_literal: true

module TaxedIncome
  extend ActiveSupport::Concern

  def build_income_tax_variables!
    @salary_taxed = build_income_tax_object(income: salary_income)
    @hourly_taxed = build_income_tax_object(income: hourly_income)
  end

  def salary_income
    @salary_income = Income.find_by(income_type: "Salary")
  end

  def hourly_income
    @hourly_income = Income.find_by(income_type: "Hourly")
  end

  def federal_tax_table_type_id
    filter = params[:federal_tax_table_type_id].present? ? {id: params[:federal_tax_table_type_id]} : {filing_status: "single"}
    @federal_tax_table_type_id = FederalTaxTableType.find_by(filter).id
  end

  def build_income_tax_object(income:)
    annual_income = income.weekly_income * 52
    federal_tax = FederalTaxCalculator.call(income: annual_income, federal_tax_table_type_id: federal_tax_table_type_id)
    fica_tax = FicaTaxCalculator.call(income: annual_income)
    state_tax = StateTaxCalculator.call(income: annual_income)
    net_income = annual_income - (fica_tax + federal_tax + state_tax)
    OpenStruct.new(federal_tax: federal_tax, fica_tax: fica_tax, state_tax: state_tax, net_income: net_income)
  end
end
