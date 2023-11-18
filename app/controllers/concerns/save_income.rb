# frozen_string_literal: true

module SaveIncome
  extend ActiveSupport::Concern
  include TaxedIncome

  def build_savings_vars!
    @hourly_saving = hourly_saving
    @hourly_invest = hourly_investing
    @salary_saving = salary_saving
    @salary_invest = salary_investing
  end

  def salary_investing
    SavingsCalculator.new(tax_on_salary, set_invest_rate)
  end

  def salary_saving
    SavingsCalculator.new(tax_on_salary, set_save_rate)
  end

  def hourly_investing
    SavingsCalculator.new(tax_on_hourly, set_invest_rate)
  end

  def hourly_saving
    SavingsCalculator.new(tax_on_hourly, set_save_rate)
  end

  private

  def set_save_rate
    SavingsRate.savings.rate
  end

  def set_invest_rate
    SavingsRate.investing.rate
  end
end
