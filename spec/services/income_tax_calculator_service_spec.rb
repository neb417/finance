# frozen_string_literal: true

require("rails_helper")

RSpec.describe IncomeTaxCalculatorService, type: :service do
  let(:salary) { create(:income) }
  let(:hourly) { create(:income, :hourly) }
  let!(:tax_brackets) { create(:federal_tax_bracket, :with_all_tiers) }
  let!(:taxed_salary) { IncomeTaxCalculatorService.new(income: salary) }
  let!(:taxed_hourly) { IncomeTaxCalculatorService.new(income: hourly) }

  describe "income taxes calculator" do
    it { expect(taxed_salary).to be_an IncomeTaxCalculatorService }
    it { expect(taxed_hourly).to be_an IncomeTaxCalculatorService }

    it "calculates salary" do
      expect(taxed_salary.income).to be_truthy
      expect(taxed_salary.annual_income).to be_truthy
      expect(taxed_salary.fica_tax).to be_truthy
      expect(taxed_salary.agi_deduction).to be_truthy
      expect(taxed_salary.agi).to be_truthy
      expect(taxed_salary.federal_income_tax).to be_truthy
      expect(taxed_salary.total_federal_tax).to be_truthy
      expect(taxed_salary.net_after_fed_tax).to be_truthy
      expect(taxed_salary.state_tax).to be_truthy
      expect(taxed_salary.total_net_income).to be_truthy
      expect(taxed_salary.bi_weekly_net_income).to be_truthy
      expect(taxed_salary.daily_income).to be_truthy
      expect(taxed_salary.weekly_income).to be_truthy
      expect(taxed_salary.monthly_income).to be_truthy
      expect(taxed_salary.quarterly_income).to be_truthy
      expect(taxed_salary.biannual_income).to be_truthy
    end

    it "calculates hourly" do
      expect(taxed_hourly.income).to be_truthy
      expect(taxed_hourly.annual_income).to be_truthy
      expect(taxed_hourly.fica_tax).to be_truthy
      expect(taxed_hourly.agi_deduction).to be_truthy
      expect(taxed_hourly.agi).to be_truthy
      expect(taxed_hourly.federal_income_tax).to be_truthy
      expect(taxed_hourly.total_federal_tax).to be_truthy
      expect(taxed_hourly.net_after_fed_tax).to be_truthy
      expect(taxed_hourly.state_tax).to be_truthy
      expect(taxed_hourly.total_net_income).to be_truthy
      expect(taxed_hourly.bi_weekly_net_income).to be_truthy
      expect(taxed_hourly.daily_income).to be_truthy
      expect(taxed_hourly.weekly_income).to be_truthy
      expect(taxed_hourly.monthly_income).to be_truthy
      expect(taxed_hourly.quarterly_income).to be_truthy
      expect(taxed_hourly.biannual_income).to be_truthy
    end
  end
end
