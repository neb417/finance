require "rails_helper"

RSpec.describe "fixed_expenses/edit", type: :view do
  let(:fixed_expense) {
    FixedExpense.create!(
      expense_name: "MyString",
      annual_cost: 1,
      monthly_cost: 1,
      bi_weekly_cost: 1
    )
  }

  before(:each) do
    assign(:fixed_expense, fixed_expense)
  end

  it "renders the edit fixed_expense form" do
    render

    assert_select "form[action=?][method=?]", fixed_expense_path(fixed_expense), "post" do
      assert_select "input[name=?]", "fixed_expense[expense_name]"

      assert_select "input[name=?]", "fixed_expense[annual_cost]"

      assert_select "input[name=?]", "fixed_expense[monthly_cost]"

      assert_select "input[name=?]", "fixed_expense[bi_weekly_cost]"
    end
  end
end
