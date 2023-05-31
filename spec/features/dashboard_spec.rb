require 'rails_helper'

RSpec.describe "Dashboard", type: :feature do
  describe "GET /index" do
    it 'routes to root path' do
      visit root_path
      expect(page).to have_content "Dashboard"
    end
  end
end
