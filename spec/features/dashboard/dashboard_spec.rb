require "rails_helper"

RSpec.describe "Dashboard", type: :feature do
  let!(:income1) { create(:income) }
  let!(:income2) { create(:income, :hourly) }
  let!(:fed1) { create(:federal_tax_bracket) }
  let!(:fed2) { create(:federal_tax_bracket, :tier_2) }
  let!(:fed3) { create(:federal_tax_bracket, :tier_3) }
  let!(:fixed_expenses) { create_list(:fixed_expense, 2) }
  let!(:saving_rate) { create(:savings_rate) }
  let!(:investing_rate) { create(:savings_rate, name: "investing", rate: 0.02) }

  describe "GET /index" do
    it "routes to root path" do
      visit root_path
      expect(page).to have_content "Budget Calculator"
    end

    it "has incomes on dashboard" do
      visit root_path

      expect(page).to have_content income1.income_type
      expect(page).to have_content income2.income_type
      expect(page).to have_link "New Income"
    end

    it "has fixed expenses on the dashboard" do
      fixed1 = fixed_expenses.first
      fixed2 = fixed_expenses.last

      visit root_path

      expect(page).to have_content(fixed1.expense_name)
      expect(page).to have_content(fixed2.expense_name)
    end
  end
end
