require "rails_helper"

RSpec.describe "savings_rates/edit", type: :view do
  let(:savings_rate) {
    SavingsRate.create!(
      name: "MyString",
      rate: 1.5
    )
  }

  before(:each) do
    assign(:savings_rate, savings_rate)
  end

  it "renders the edit savings_rate form" do
    render

    assert_select "form[action=?][method=?]", savings_rate_path(savings_rate), "post" do
      assert_select "input[name=?]", "savings_rate[name]"

      assert_select "input[name=?]", "savings_rate[rate]"
    end
  end
end
