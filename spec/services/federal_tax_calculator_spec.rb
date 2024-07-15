# frozen_string_literal: true

require("rails_helper")

RSpec.describe FederalTaxCalculator, type: :service do
  subject(:service) do
    described_class.call(
      income: salary_income.rate
    )
  end

  let!(:salary_income) { create(:income) }
  let!(:tax_brackets) { create(:federal_tax_bracket, :with_all_tiers) }
  let!(:standard_deduction) { create(:standard_deduction) }

  it { expect(service).to be_a Money }

  it "calculates federal tax" do
    # salary_income = $50,000
    # standard_deduction = $13,850
    # tax_brackets = 10% on first $1,000, 15% from $1,001 to $100,000, 25% from $100,001 to $500,000

    expect(service.format).to eq("$5,372.35")
    expect((salary_income.rate - service).format).to eq("$44,627.65")
  end
end
