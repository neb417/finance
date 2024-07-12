# frozen_string_literal: true

module TaxedIncome
  extend ActiveSupport::Concern

  included do
    before_action :salary_income, :hourly_income
  end

  def build_taxed_income_vars!
    @salary_taxed = tax_on_salary
    @hourly_taxed = tax_on_hourly
  end

  private

  def salary_income
    @salary_income ||= Income.find_by(income_type: "Salary")
  end

  def hourly_income
    @hourly_income ||= Income.find_by(income_type: "Hourly")
  end
end