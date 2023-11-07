require "rails_helper"

RSpec.describe "federal_tax_brackets/show", type: :feature do
  # before(:each) do
  #   assign(:federal_tax_bracket, FederalTaxBracket.create!(
  #     tier: "Tier",
  #     bottom_range: 2,
  #     top_range: 3,
  #     rate: 4.5,
  #     cumulative: 5
  #   ))
  # end
  let!(:fed1) { create(:federal_tax_bracket) }
  let!(:fed2) { create(:federal_tax_bracket, :tier_2) }

  it "renders attributes in <p>" do
    visit federal_tax_bracket_path(fed2)
    expect(page).to have_content(fed2.tier)
    expect(page).to_not have_content(fed1.tier)
  end
end
