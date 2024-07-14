# frozen_string_literal: true

require("rails_helper")

RSpec.describe StateTaxCalculator, type: :service do
  subject(:service) do
    described_class.call(
      income: salary_income.rate
    )
  end

  let!(:salary_income) { create(:income) }
  let!(:tax_brackets) { create(:federal_tax_bracket, :with_all_tiers) }

  it { expect(service).to be_a Money }

  it "calculates state tax" do
    # salary_income = $50,000

    expect(service.format).to eq("$2,200.00")
    expect((salary_income.rate - service).format).to eq("$47,800.00")
  end
end
