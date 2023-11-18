require "rails_helper"

RSpec.describe "savings_rates/new", type: :view do
  before(:each) do
    assign(:savings_rate, SavingsRate.new(
      name: "MyString",
      rate: 1.5
    ))
  end

  it "renders new savings_rate form" do
    render

    assert_select "form[action=?][method=?]", savings_rates_path, "post" do
      assert_select "input[name=?]", "savings_rate[name]"

      assert_select "input[name=?]", "savings_rate[rate]"
    end
  end
end
