# frozen_string_literal: true

module TaxedIncome
  extend ActiveSupport::Concern

  def build_income_tax_variables!
    @salary_taxed = build_income_tax_object(income: salary_income)
    @hourly_taxed = build_income_tax_object(income: hourly_income)
  end

  def salary_income
    @salary_income = Income.find_by(income_type: "Salary").weekly_income * 52
  end

  def hourly_income
    @hourly_income = Income.find_by(income_type: "Hourly").weekly_income * 52
  end

  def federal_tax_table_type_id
    filter = params[:federal_tax_table_type_id].present? ? {id: params[:federal_tax_table_type_id]} : {filing_status: "single"}
    @federal_tax_table_type_id = FederalTaxTableType.find_by(filter).id
  end

  def build_income_tax_object(income:)
    federal_tax = FederalTaxCalculator.call(income: income, federal_tax_table_type_id: federal_tax_table_type_id)
    fica_tax = FicaTaxCalculator.call(income: income)
    state_tax = StateTaxCalculator.call(income: income)
    net_income = income - (fica_tax + federal_tax + state_tax)
    OpenStruct.new(federal_tax: federal_tax, fica_tax: fica_tax, state_tax: state_tax, net_income: net_income)
  end
end
