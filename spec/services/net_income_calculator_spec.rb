# frozen_string_literal: true

require("rails_helper")

RSpec.describe NetIncomeCalculator, type: :service do
  subject(:service) do
    described_class.new(
      annual_income: salary_income.rate
    )
  end

  let!(:salary_income) { create(:income) }
  let!(:tax_brackets) { create(:federal_tax_bracket, :with_all_tiers) }

  it { expect(service).to be_a NetIncomeCalculator }

  it { expect(service.annual_income.format).to eq("$50,000.00") }
  it { expect(service.biannual_income.format).to eq("$25,000.00") }
  it { expect(service.quarterly_income.format).to eq("$12,500.00") }
  it { expect(service.monthly_income.format).to eq("$4,166.67") }
  it { expect(service.weekly_income.format).to eq("$961.54") }
  it { expect(service.daily_income.format).to eq("$136.99") }
end
