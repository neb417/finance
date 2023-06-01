require "rails_helper"

RSpec.describe "fixed_expenses/new", type: :view do
  before(:each) do
    assign(:fixed_expense, FixedExpense.new(
      expense_name: "MyString",
      annual_cost: 1,
      monthly_cost: 1,
      bi_weekly_cost: 1
    ))
  end

  it "renders new fixed_expense form" do
    render

    assert_select "form[action=?][method=?]", fixed_expenses_path, "post" do
      assert_select "input[name=?]", "fixed_expense[expense_name]"

      assert_select "input[name=?]", "fixed_expense[annual_cost]"

      assert_select "input[name=?]", "fixed_expense[monthly_cost]"

      assert_select "input[name=?]", "fixed_expense[bi_weekly_cost]"
    end
  end
end
