require "rails_helper"

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to test the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator. If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails. There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.

RSpec.describe "/fixed_expenses", type: :request do
  # This should return the minimal set of attributes required to create a valid
  # FixedExpense. As you add validations to FixedExpense, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  describe "GET /index" do
    it "renders a successful response" do
      FixedExpense.create! valid_attributes
      get fixed_expenses_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      fixed_expense = FixedExpense.create! valid_attributes
      get fixed_expense_url(fixed_expense)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_fixed_expense_url
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "renders a successful response" do
      fixed_expense = FixedExpense.create! valid_attributes
      get edit_fixed_expense_url(fixed_expense)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new FixedExpense" do
        expect {
          post fixed_expenses_url, params: {fixed_expense: valid_attributes}
        }.to change(FixedExpense, :count).by(1)
      end

      it "redirects to the created fixed_expense" do
        post fixed_expenses_url, params: {fixed_expense: valid_attributes}
        expect(response).to redirect_to(fixed_expense_url(FixedExpense.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new FixedExpense" do
        expect {
          post fixed_expenses_url, params: {fixed_expense: invalid_attributes}
        }.to change(FixedExpense, :count).by(0)
      end

      it "renders a response with 422 status (i.e. to display the 'new' template)" do
        post fixed_expenses_url, params: {fixed_expense: invalid_attributes}
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "PATCH /index" do
    context "with valid parameters" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested fixed_expense" do
        fixed_expense = FixedExpense.create! valid_attributes
        patch fixed_expense_url(fixed_expense), params: {fixed_expense: new_attributes}
        fixed_expense.reload
        skip("Add assertions for updated state")
      end

      it "redirects to the fixed_expense" do
        fixed_expense = FixedExpense.create! valid_attributes
        patch fixed_expense_url(fixed_expense), params: {fixed_expense: new_attributes}
        fixed_expense.reload
        expect(response).to redirect_to(fixed_expense_url(fixed_expense))
      end
    end

    context "with invalid parameters" do
      it "renders a response with 422 status (i.e. to display the 'edit' template)" do
        fixed_expense = FixedExpense.create! valid_attributes
        patch fixed_expense_url(fixed_expense), params: {fixed_expense: invalid_attributes}
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested fixed_expense" do
      fixed_expense = FixedExpense.create! valid_attributes
      expect {
        delete fixed_expense_url(fixed_expense)
      }.to change(FixedExpense, :count).by(-1)
    end

    it "redirects to the fixed_expenses list" do
      fixed_expense = FixedExpense.create! valid_attributes
      delete fixed_expense_url(fixed_expense)
      expect(response).to redirect_to(fixed_expenses_url)
    end
  end
end
