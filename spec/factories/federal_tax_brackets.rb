# == Schema Information
#
# Table name: federal_tax_brackets
#
#  id                        :bigint           not null, primary key
#  bottom_range_cents        :integer          default(0), not null
#  bottom_range_currency     :string           default("USD"), not null
#  cumulative_cents          :integer          default(0), not null
#  cumulative_currency       :string           default("USD"), not null
#  rate                      :float
#  tier                      :string
#  top_range_cents           :integer          default(0), not null
#  top_range_currency        :string           default("USD"), not null
#  created_at                :datetime         not null
#  updated_at                :datetime         not null
#  federal_tax_table_type_id :bigint
#
# Indexes
#
#  index_federal_tax_brackets_on_federal_tax_table_type_id  (federal_tax_table_type_id)
#
# Foreign Keys
#
#  fk_rails_...  (federal_tax_table_type_id => federal_tax_table_types.id)
#
FactoryBot.define do
  # tax_brackets = 10% on first $1,000, 15% from $1,001 to $100,000, 25% from $100,001 to $500,000

  factory :federal_tax_bracket do
    tier { "Tier 1" }
    bottom_range_cents { 0 }
    top_range_cents { 100_000 } # $1,000.00
    rate { 0.1 }
    cumulative_cents { 0 }

    trait :tier_2 do
      tier { "Tier 2" }
      bottom_range_cents { 100_100 } # $1,001.00
      top_range_cents { 10_000_000 } # $100,000.00
      rate { 0.15 }
      cumulative_cents { 10_000 } # $100.00
    end

    trait :tier_3 do
      tier { "Tier 2" }
      bottom_range_cents { 10_000_100 } # $100,001.00
      top_range_cents { 50_000_000 } # $500,000.00
      rate { 0.25 }
      cumulative_cents { 1_485_000 } # $14,850.00
    end

    trait :with_all_tiers do
      after :create do |_record|
        create(:federal_tax_bracket, :tier_2)
        create(:federal_tax_bracket, :tier_3)
      end
    end
    #
    # to_create do |instance|
    #   instance.id = FederalTaxBracket.find_or_create_by(tier: instance.tier).id
    #   instance.reload
    # end
  end
end
