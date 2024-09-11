# frozen_string_literal: true

class CreateTaxTableTypes < ActiveRecord::Migration[7.0]
  def up
    FederalTaxTableType.create(filing_status: "single")
    FederalTaxTableType.create(filing_status: "married_filing_jointly")
    FederalTaxTableType.create(filing_status: "married_filing_separately")
    FederalTaxTableType.create(filing_status: "head_of_household")

    # Federal tax brackets for single filers in 2024
    FederalTaxBracket.create!(tier: "Tier 1", bottom_range: 0, top_range: 11_600, rate: 0.1, cumulative: 0, federal_tax_table_type_id: FederalTaxTableType.find_by(filing_status: "single").id)
    FederalTaxBracket.create(tier: "Tier 2", bottom_range: 11_601, top_range: 47_150, rate: 0.12, cumulative: 1_160, federal_tax_table_type_id: FederalTaxTableType.find_by(filing_status: "single").id)
    FederalTaxBracket.create(tier: "Tier 3", bottom_range: 47_151, top_range: 100_525, rate: 0.22, cumulative: 5_426, federal_tax_table_type_id: FederalTaxTableType.find_by(filing_status: "single").id)
    FederalTaxBracket.create(tier: "Tier 4", bottom_range: 100_526, top_range: 191_950, rate: 0.24, cumulative: 17_168.5, federal_tax_table_type_id: FederalTaxTableType.find_by(filing_status: "single").id)
    FederalTaxBracket.create(tier: "Tier 5", bottom_range: 191_951, top_range: 243_725, rate: 0.32, cumulative: 39_110.5, federal_tax_table_type_id: FederalTaxTableType.find_by(filing_status: "single").id)
    FederalTaxBracket.create(tier: "Tier 6", bottom_range: 243_726, top_range: 609_350, rate: 0.35, cumulative: 55_678.5, federal_tax_table_type_id: FederalTaxTableType.find_by(filing_status: "single").id)
    FederalTaxBracket.create(tier: "Tier 7", bottom_range: 609_351, top_range: 10_000_000, rate: 0.35, cumulative: 183_647.25, federal_tax_table_type_id: FederalTaxTableType.find_by(filing_status: "single").id)

    # Federal tax brackets for married joint filers in 2024
    FederalTaxBracket.create(tier: "Tier 1", bottom_range: 0, top_range: 23_200, rate: 0.1, cumulative: 0, federal_tax_table_type_id: FederalTaxTableType.find_by(filing_status: "married_filing_jointly").id)
    FederalTaxBracket.create(tier: "Tier 2", bottom_range: 23_201, top_range: 94_300, rate: 0.12, cumulative: 2_320, federal_tax_table_type_id: FederalTaxTableType.find_by(filing_status: "married_filing_jointly").id)
    FederalTaxBracket.create(tier: "Tier 3", bottom_range: 94_301, top_range: 201_050, rate: 0.22, cumulative: 10_852, federal_tax_table_type_id: FederalTaxTableType.find_by(filing_status: "married_filing_jointly").id)
    FederalTaxBracket.create(tier: "Tier 4", bottom_range: 201_051, top_range: 383_900, rate: 0.24, cumulative: 34_337, federal_tax_table_type_id: FederalTaxTableType.find_by(filing_status: "married_filing_jointly").id)
    FederalTaxBracket.create(tier: "Tier 5", bottom_range: 383_901, top_range: 487_450, rate: 0.32, cumulative: 78_221, federal_tax_table_type_id: FederalTaxTableType.find_by(filing_status: "married_filing_jointly").id)
    FederalTaxBracket.create(tier: "Tier 6", bottom_range: 487_451, top_range: 731_200, rate: 0.35, cumulative: 111_357, federal_tax_table_type_id: FederalTaxTableType.find_by(filing_status: "married_filing_jointly").id)
    FederalTaxBracket.create(tier: "Tier 7", bottom_range: 731_201, top_range: 10_000_000, rate: 0.35, cumulative: 196_669.50, federal_tax_table_type_id: FederalTaxTableType.find_by(filing_status: "married_filing_jointly").id)

    # Federal tax brackets for married separate filers in 2024
    FederalTaxBracket.create(tier: "Tier 1", bottom_range: 0, top_range: 11_600, rate: 0.1, cumulative: 0, federal_tax_table_type_id: FederalTaxTableType.find_by(filing_status: "married_filing_separately").id)
    FederalTaxBracket.create(tier: "Tier 2", bottom_range: 11_601, top_range: 47_150, rate: 0.12, cumulative: 1_160, federal_tax_table_type_id: FederalTaxTableType.find_by(filing_status: "married_filing_separately").id)
    FederalTaxBracket.create(tier: "Tier 3", bottom_range: 47_151, top_range: 100_525, rate: 0.22, cumulative: 5_426, federal_tax_table_type_id: FederalTaxTableType.find_by(filing_status: "married_filing_separately").id)
    FederalTaxBracket.create(tier: "Tier 4", bottom_range: 100_526, top_range: 191_950, rate: 0.24, cumulative: 17_168.5, federal_tax_table_type_id: FederalTaxTableType.find_by(filing_status: "married_filing_separately").id)
    FederalTaxBracket.create(tier: "Tier 5", bottom_range: 191_951, top_range: 243_725, rate: 0.32, cumulative: 39_110.5, federal_tax_table_type_id: FederalTaxTableType.find_by(filing_status: "married_filing_separately").id)
    FederalTaxBracket.create(tier: "Tier 6", bottom_range: 243_726, top_range: 365_600, rate: 0.35, cumulative: 55_678.5, federal_tax_table_type_id: FederalTaxTableType.find_by(filing_status: "married_filing_separately").id)
    FederalTaxBracket.create(tier: "Tier 7", bottom_range: 365_601, top_range: 10_000_000, rate: 0.35, cumulative: 98_334.75, federal_tax_table_type_id: FederalTaxTableType.find_by(filing_status: "married_filing_separately").id)

    # Federal tax brackets for head of household filers in 2024
    FederalTaxBracket.create(tier: "Tier 1", bottom_range: 0, top_range: 16_550, rate: 0.1, cumulative: 0, federal_tax_table_type_id: FederalTaxTableType.find_by(filing_status: "head_of_household").id)
    FederalTaxBracket.create(tier: "Tier 2", bottom_range: 16_551, top_range: 63_100, rate: 0.12, cumulative: 1_655, federal_tax_table_type_id: FederalTaxTableType.find_by(filing_status: "head_of_household").id)
    FederalTaxBracket.create(tier: "Tier 3", bottom_range: 63_101, top_range: 100_500, rate: 0.22, cumulative: 7_241, federal_tax_table_type_id: FederalTaxTableType.find_by(filing_status: "head_of_household").id)
    FederalTaxBracket.create(tier: "Tier 4", bottom_range: 100_501, top_range: 191_950, rate: 0.24, cumulative: 15_469, federal_tax_table_type_id: FederalTaxTableType.find_by(filing_status: "head_of_household").id)
    FederalTaxBracket.create(tier: "Tier 5", bottom_range: 191_951, top_range: 243_700, rate: 0.32, cumulative: 37_417, federal_tax_table_type_id: FederalTaxTableType.find_by(filing_status: "head_of_household").id)
    FederalTaxBracket.create(tier: "Tier 6", bottom_range: 243_701, top_range: 609_350, rate: 0.35, cumulative: 53_977, federal_tax_table_type_id: FederalTaxTableType.find_by(filing_status: "head_of_household").id)
    FederalTaxBracket.create(tier: "Tier 7", bottom_range: 609_351, top_range: 10_000_000, rate: 0.35, cumulative: 181_954.5, federal_tax_table_type_id: FederalTaxTableType.find_by(filing_status: "head_of_household").id)
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
