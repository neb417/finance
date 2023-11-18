require "rails_helper"

RSpec.describe "savings_rates/show", type: :view do
  before(:each) do
    assign(:savings_rate, SavingsRate.create!(
      name: "savings",
      rate: 2.5
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/2.5/)
  end
end
