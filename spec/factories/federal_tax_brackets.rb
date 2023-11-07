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
    tier { "Tier 1" }
    bottom_range_cents { 0 }
    top_range_cents { 100000 }
    rate { 0.1 }
    cumulative_cents { 0 }

    trait :tier_2 do
      tier { "Tier 2" }
      bottom_range_cents { 1000100 }
      top_range_cents { 10000000 }
      rate { 0.15 }
      cumulative_cents { 200000 }
    end

    trait :tier_3 do
      tier { "Tier 2" }
      bottom_range_cents { 10000100 }
      top_range_cents { 50000000 }
      rate { 0.25 }
      cumulative_cents { 500000 }
    end

    # trait :with_all_tiers do
    #   after :create do |_record|
    #     create(:federal_tax_bracket, :tier_2)
    #     create(:federal_tax_bracket, :tier_3)
    #   end
    # end
    #
    # to_create do |instance|
    #   instance.id = FederalTaxBracket.find_or_create_by(tier: instance.tier).id
    #   instance.reload
    # end
  end
end
