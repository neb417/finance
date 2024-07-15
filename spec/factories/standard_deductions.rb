# == Schema Information
#
# Table name: standard_deductions
#
#  id              :bigint           not null, primary key
#  amount_cents    :integer          default(0), not null
#  amount_currency :string           default("USD"), not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
FactoryBot.define do
  factory :standard_deduction do
    # standard deduction amount is $13,850
    amount_cents { 1_385_000 }
    amount_currency { "USD" }
  end
end
