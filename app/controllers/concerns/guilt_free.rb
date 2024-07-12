# frozen_string_literal: true

module GuiltFree
  def build_guilt_free_vars!
    @guilt_free_salary = GuiltFreeCalculator.new(@salary_taxed, salary_savings_totalizer)
    @guilt_free_hourly = GuiltFreeCalculator.new(@hourly_taxed, hourly_savings_totalizer)
  end

  def salary_savings_totalizer
    @salary_saving.annual_saving + @salary_invest.annual_saving
    # @salary_saving + @salary_investing
  end

  def hourly_savings_totalizer
    @hourly_saving.annual_saving + @salary_invest.annual_saving
  end
end
