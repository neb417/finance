require 'rails_helper'

RSpec.describe "Dashboard", type: :feature do
  describe "GET /index" do
    it 'routes to root path' do
      visit root_path
      expect(page).to have_content "Dashboard"
    end

    it 'has incomes on dashboard' do
      incomes = create_list(:income, 3)
      income1 = incomes.first
      income2 = incomes.second
      income3 = incomes.third

      visit root_path

      expect(page).to have_content income1.income_type
      expect(page).to have_content income2.income_type
      expect(page).to have_content income3.income_type
      expect(page).to have_link "New income"
    end
  end
end
