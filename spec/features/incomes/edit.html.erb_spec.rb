require "rails_helper"

RSpec.describe "incomes/edit", type: :view do
  let(:income) {
    Income.create!(
      income_type: "MyString",
      rate: 1,
      hours: 1,
      weekly_income: 1
    )
  }

  before(:each) do
    assign(:income, income)
  end

  xit "renders the edit income form" do
    render

    assert_select "form[action=?][method=?]", income_path(income), "post" do
      assert_select "input[name=?]", "income[income_type]"

      assert_select "input[name=?]", "income[rate]"

      assert_select "input[name=?]", "income[hours]"

      assert_select "input[name=?]", "income[weekly_income]"
    end
  end
end
