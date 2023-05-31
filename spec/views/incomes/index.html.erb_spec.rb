require "rails_helper"

RSpec.describe "incomes/index", type: :view do
  before(:each) do
    assign(:incomes, [
      Income.create!(
        income_type: "Income Type",
        rate: 2,
        hours: 3,
        weekly_income: 4
      ),
      Income.create!(
        income_type: "Income Type",
        rate: 2,
        hours: 3,
        weekly_income: 4
      )
    ])
  end

  it "renders a list of incomes" do
    render
    cell_selector = (Rails::VERSION::STRING >= "7") ? "div>p" : "tr>td"
    assert_select cell_selector, text: Regexp.new("Income Type".to_s), count: 2
    assert_select cell_selector, text: Regexp.new(2.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(3.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(4.to_s), count: 2
  end
end
