require "rails_helper"

RSpec.describe "incomes/index", type: :feature do
  let!(:incomes) { create_list(:income, 2) }

  it "renders a list of incomes" do
    visit incomes_path

    expect(page).to have_content(incomes.first.income_type)
    expect(page).to have_content(incomes.last.income_type)
  end
end
