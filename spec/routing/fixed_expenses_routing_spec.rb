require "rails_helper"

RSpec.describe FixedExpensesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/fixed_expenses").to route_to("fixed_expenses#index")
    end

    it "routes to #new" do
      expect(get: "/fixed_expenses/new").to route_to("fixed_expenses#new")
    end

    it "routes to #show" do
      expect(get: "/fixed_expenses/1").to route_to("fixed_expenses#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/fixed_expenses/1/edit").to route_to("fixed_expenses#edit", id: "1")
    end

    it "routes to #create" do
      expect(post: "/fixed_expenses").to route_to("fixed_expenses#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/fixed_expenses/1").to route_to("fixed_expenses#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/fixed_expenses/1").to route_to("fixed_expenses#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/fixed_expenses/1").to route_to("fixed_expenses#destroy", id: "1")
    end
  end
end
