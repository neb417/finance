require "rails_helper"

RSpec.describe "federal_tax_brackets/new", type: :view do
  before(:each) do
    assign(:federal_tax_bracket, FederalTaxBracket.new(
      tier: "MyString",
      bottom_range: 1,
      top_range: 1,
      rate: 1.5,
      cumulative: 1
    ))
  end

  it "renders new federal_tax_bracket form" do
    render

    assert_select "form[action=?][method=?]", federal_tax_brackets_path, "post" do
      assert_select "input[name=?]", "federal_tax_bracket[tier]"

      assert_select "input[name=?]", "federal_tax_bracket[bottom_range]"

      assert_select "input[name=?]", "federal_tax_bracket[top_range]"

      assert_select "input[name=?]", "federal_tax_bracket[rate]"

      assert_select "input[name=?]", "federal_tax_bracket[cumulative]"
    end
  end
end
