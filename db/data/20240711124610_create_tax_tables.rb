# frozen_string_literal: true

class CreateTaxTables < ActiveRecord::Migration[7.0]
  def up
    # Federal tax brackets for single filers in 2024
    FederalTaxBracket.create(tier: "Tier 1", bottom_range: 0, top_range: 11_600, rate: 0.1, cumulative: 0)
    FederalTaxBracket.create(tier: "Tier 2", bottom_range: 11_601, top_range: 47_150, rate: 0.12, cumulative: 1_160)
    FederalTaxBracket.create(tier: "Tier 3", bottom_range: 47_151, top_range: 100_525, rate: 0.22, cumulative: 5_426)
    FederalTaxBracket.create(tier: "Tier 4", bottom_range: 100_526, top_range: 191_950, rate: 0.24, cumulative: 17_168.5)
    FederalTaxBracket.create(tier: "Tier 5", bottom_range: 191_951, top_range: 243_725, rate: 0.32, cumulative: 39_110.5)
    FederalTaxBracket.create(tier: "Tier 6", bottom_range: 243_726, top_range: 609_350, rate: 0.35, cumulative: 55_678.5)
    FederalTaxBracket.create(tier: "Tier 7", bottom_range: 609_351, top_range: 10_000_000, rate: 0.35, cumulative: 183_647.25)
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
