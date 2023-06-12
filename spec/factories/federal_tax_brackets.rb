# == Schema Information
#
# Table name: federal_tax_brackets
#
#  id                    :bigint           not null, primary key
#  bottom_range_cents    :integer          default(0), not null
#  bottom_range_currency :string           default("USD"), not null
#  cumulative_cents      :integer          default(0), not null
#  cumulative_currency   :string           default("USD"), not null
#  rate                  :float
#  tier                  :string
#  top_range_cents       :integer          default(0), not null
#  top_range_currency    :string           default("USD"), not null
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#
FactoryBot.define do
  factory :federal_tax_bracket do
    tier { Faker::Name.name }
    bottom_range_cents { Faker::Number.within(range: 1..10) }
    top_range_cents { Faker::Number.within(range: 11..20) }
    rate { Faker::Number.within(range: 0.01..0.5)}
    cumulative_cents { Faker::Number.within(range: 1..20) }
  end
end
