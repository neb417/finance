# frozen_string_literal: true

module TaxedIncome
  extend ActiveSupport::Concern

  def build_income_tax_variables!
    @salary_taxed = build_income_tax_object(income: salary_income)
    @hourly_taxed = build_income_tax_object(income: hourly_income)
  end

  # def salary_taxed_variables
  #   @federal_tax = FederalTaxCalculator.call(income: salary_income)
  #   @fica_tax = FicaTaxCalculator.call(income: salary_income)
  #   @state_tax = StateTaxCalculator.call(income: salary_income)
  #   @salary_net_income = salary_income - (@fica_tax + @federal_tax + @state_tax)
  # end
  #
  # def hourly_taxed_variables
  #   federal_tax = FederalTaxCalculator.call(income: hourly_income)
  #   fica_tax = FicaTaxCalculator.call(income: hourly_income)
  #   state_tax = StateTaxCalculator.call(income: hourly_income)
  #   hourly_net_income = hourly_income - (fica_tax + federal_tax + state_tax)
  #   OpenStruct.new(federal_tax: federal_tax, fica_tax: fica_tax, state_tax: state_tax, net_income: hourly_net_income)
  # end

  private

  def salary_income
    @salary_income = Income.find_by(income_type: "Salary").weekly_income * 52
  end

  def hourly_income
    @hourly_income = Income.find_by(income_type: "Hourly").weekly_income * 52
  end

  def build_income_tax_object(income:)
    federal_tax = FederalTaxCalculator.call(income: hourly_income)
    fica_tax = FicaTaxCalculator.call(income: hourly_income)
    state_tax = StateTaxCalculator.call(income: hourly_income)
    hourly_net_income = hourly_income - (fica_tax + federal_tax + state_tax)
    OpenStruct.new(federal_tax: federal_tax, fica_tax: fica_tax, state_tax: state_tax, net_income: hourly_net_income)
  end
  #
  # def fica_tax(income:)
  #   @fica_tax = FicaTaxCalculator.call(income: income)
  # end
  #
  # def federal_tax(income:)
  #   @federal_tax ||= FederalTaxCalculator.call(income: income)
  # end
  #
  # def state_tax(income:)
  #   @state_tax ||= StateTaxCalculator.call(income: income)
  # end
  #
  # def net_income(annual_income:)
  #   annual_income - (fica_tax(income: annual_income) + federal_tax(income: annual_income) + state_tax(income: annual_income))
  #
  #   # @net_income ||= NetIncomeCalculator.call(annual_income: income)
  # end
end
