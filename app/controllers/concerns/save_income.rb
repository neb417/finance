# frozen_string_literal: true

module SaveIncome
  extend ActiveSupport::Concern

  def build_savings_vars!(salary_income:, hourly_income:)
    @salary_saving = savings(income: salary_income)
    @salary_invest = investing(income: salary_income)
    @hourly_saving = savings(income: hourly_income)
    @hourly_invest = investing(income: hourly_income)
  end

  private

  def savings(income:)
    SavingsCalculator.new(income, savings_rate)
  end

  def investing(income:)
    SavingsCalculator.new(income, investing_rate)
  end

  def savings_rate
    @savings_rate ||= SavingsRate.savings_rate
  end

  def investing_rate
    @investing_rate ||= SavingsRate.investing_rate
  end
end
