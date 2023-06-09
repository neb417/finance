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
FactoryBot.define do
  factory :income do
    income_type { "MyString" }
    rate { 1 }
    hours { 1 }
    weekly_income { 1 }
  end
end
