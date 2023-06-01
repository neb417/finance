# == Schema Information
#
# Table name: fixed_expenses
#
#  id                      :bigint           not null, primary key
#  annual_cost_cents       :integer          default(0), not null
#  annual_cost_currency    :string           default("USD"), not null
#  bi_weekly_cost_cents    :integer          default(0), not null
#  bi_weekly_cost_currency :string           default("USD"), not null
#  expense_name            :string
#  monthly_cost_cents      :integer          default(0), not null
#  monthly_cost_currency   :string           default("USD"), not null
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#
FactoryBot.define do
  factory :fixed_expense do
    expense_name { "MyString" }
    annual_cost { 1 }
    monthly_cost { 1 }
    bi_weekly_cost { 1 }
  end
end
