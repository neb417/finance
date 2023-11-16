# == Schema Information
#
# Table name: incomes
#
#  id                     :bigint           not null, primary key
#  hours                  :integer
#  income_type            :string
#  rate_cents             :integer          default(0), not null
#  rate_currency          :string           default("USD"), not null
#  weekly_income_cents    :integer          default(0), not null
#  weekly_income_currency :string           default("USD"), not null
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
class Income < ApplicationRecord
  monetize :rate_cents
  monetize :weekly_income_cents

  def update_from_dashboard(params:)
    income = params[:income]
    income_type_passed = income[:income_type]

    case income_type_passed
    when "HR"
      update(
        income_type: "Hourly",
        rate: income[:rate],
        hours: income[:hours],
        weekly_income: income[:rate].to_f * income[:hours].to_f
      )
    when "SA"
      update(
        income_type: "Salary",
        rate: income[:rate],
        hours: 40,
        weekly_income: income[:rate].to_f / 52
      )
    else
      false
    end
  end

  def self.order_by_type
    Income.all.order(income_type: :desc)
  end

  def is_hourly?
    income_type == "Hourly"
  end

  def is_salary?
    income_type == "Salary"
  end

  def self.tax_on_income(income_type:)
    income = Income.find_by(income_type: income_type)
    IncomeTaxCalculatorService.new(income: income)
  end
end
