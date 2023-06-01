require "rails_helper"

RSpec.describe "incomes/new", type: :view do
  before(:each) do
    assign(:income, Income.new(
      income_type: "MyString",
      rate: 1,
      hours: 1,
      weekly_income: 1
    ))
  end

  xit "renders new income form" do
    render

    assert_select "form[action=?][method=?]", incomes_path, "post" do
      assert_select "input[name=?]", "income[income_type]"

      assert_select "input[name=?]", "income[rate]"

      assert_select "input[name=?]", "income[hours]"

      assert_select "input[name=?]", "income[weekly_income]"
    end
  end
end
