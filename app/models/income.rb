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
    when "Other"
    #   Unsure
    else
      false
    end
  end
end
