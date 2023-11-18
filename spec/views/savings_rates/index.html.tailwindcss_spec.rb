require "rails_helper"

RSpec.describe "savings_rates/index", type: :view do
  before(:each) do
    assign(:savings_rates, [
      SavingsRate.create!(
        name: "Name",
        rate: 2.5
      ),
      SavingsRate.create!(
        name: "Name",
        rate: 2.5
      )
    ])
  end

  it "renders a list of savings_rates" do
    render
    cell_selector = (Rails::VERSION::STRING >= "7") ? "div>p" : "tr>td"
    assert_select cell_selector, text: Regexp.new("Name".to_s), count: 2
    assert_select cell_selector, text: Regexp.new(2.5.to_s), count: 2
  end
end
