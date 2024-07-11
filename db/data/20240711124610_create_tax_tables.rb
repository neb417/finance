# frozen_string_literal: true

class CreateTaxTables < ActiveRecord::Migration[7.0]
  def up
    FederalTaxBracket.create(tier: 'Tier 1', bottom_range: 0, top_range: 23_200, rate: 0.1, cumulative: 0)
    FederalTaxBracket.create(tier: 'Tier 2', bottom_range: 23_001, top_range: 94_300, rate: 0.12, cumulative: 2_320)
    FederalTaxBracket.create(tier: 'Tier 3', bottom_range: 94_301, top_range: 201_050, rate: 0.22, cumulative: 10_852)
    FederalTaxBracket.create(tier: 'Tier 4', bottom_range: 201_051, top_range: 383_900, rate: 0.24, cumulative: 34_337)
    FederalTaxBracket.create(tier: 'Tier 5', bottom_range: 383_901, top_range: 487_450, rate: 0.32, cumulative: 78_221)
    FederalTaxBracket.create(tier: 'Tier 6', bottom_range: 487_451, top_range: 731_200, rate: 0.35, cumulative: 111_357)
    FederalTaxBracket.create(tier: 'Tier 7', bottom_range: 731_201, top_range: 10_000_000, rate: 0.35, cumulative: 196_669)
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
