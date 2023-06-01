require "rails_helper"

RSpec.describe "fixed_expenses/index", type: :view do
  before(:each) do
    assign(:fixed_expenses, [
      FixedExpense.create!(
        expense_name: "Expense",
        annual_cost: 2,
        monthly_cost: 3,
        bi_weekly_cost: 4
      ),
      FixedExpense.create!(
        expense_name: "Expense",
        annual_cost: 2,
        monthly_cost: 3,
        bi_weekly_cost: 4
      )
    ])
  end

  it "renders a list of fixed_expenses" do
    render
    cell_selector = (Rails::VERSION::STRING >= "7") ? "div>p" : "tr>td"
    assert_select cell_selector, text: Regexp.new("Expense".to_s), count: 2
    assert_select cell_selector, text: Regexp.new(2.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(3.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(4.to_s), count: 2
  end
end
