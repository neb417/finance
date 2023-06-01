require "rails_helper"

RSpec.describe "incomes/show", type: :view do
  before(:each) do
    assign(:income, Income.create!(
      income_type: "Income Type",
      rate: 2,
      hours: 3,
      weekly_income: 4
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Income Type/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/4/)
  end
end
