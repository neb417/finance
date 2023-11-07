require "rails_helper"

RSpec.describe "federal_tax_brackets/index", type: :feature do
  # before(:each) do
  #   assign(:federal_tax_brackets, [
  #     FederalTaxBracket.create!(
  #       tier: "Tier",
  #       bottom_range: 2,
  #       top_range: 3,
  #       rate: 4.5,
  #       cumulative: 5
  #     ),
  #     FederalTaxBracket.create!(
  #       tier: "Tier",
  #       bottom_range: 2,
  #       top_range: 3,
  #       rate: 4.5,
  #       cumulative: 5
  #     )
  #   ])
  # end
  let!(:fed1) { create(:federal_tax_bracket) }
  let!(:fed2) { create(:federal_tax_bracket) }

  it "renders a list of federal_tax_brackets" do
    visit federal_tax_brackets_path
    expect(page).to have_content(fed1.tier)
    expect(page).to have_content(fed2.tier)
  end
  #   render
  #   expect(page).to have_contents
  #   cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
  #   binding.pry
  #   assert_select cell_selector, text: Regexp.new("Tier".to_s), count: 2
  #   assert_select cell_selector, text: Regexp.new(2.to_s), count: 2
  #   assert_select cell_selector, text: Regexp.new(3.to_s), count: 2
  #   assert_select cell_selector, text: Regexp.new(4.5.to_s), count: 2
  #   assert_select cell_selector, text: Regexp.new(5.to_s), count: 2
  # end
end
