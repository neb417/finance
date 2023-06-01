require "rails_helper"

RSpec.describe "fixed_expenses/show", type: :view do
  before(:each) do
    assign(:fixed_expense, FixedExpense.create!(
      expense_name: "Expense",
      annual_cost: 2,
      monthly_cost: 3,
      bi_weekly_cost: 4
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Expense/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/4/)
  end
end
