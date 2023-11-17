require "rails_helper"

RSpec.describe SavingsRatesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/savings_rates").to route_to("savings_rates#index")
    end

    it "routes to #new" do
      expect(get: "/savings_rates/new").to route_to("savings_rates#new")
    end

    it "routes to #show" do
      expect(get: "/savings_rates/1").to route_to("savings_rates#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/savings_rates/1/edit").to route_to("savings_rates#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/savings_rates").to route_to("savings_rates#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/savings_rates/1").to route_to("savings_rates#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/savings_rates/1").to route_to("savings_rates#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/savings_rates/1").to route_to("savings_rates#destroy", id: "1")
    end
  end
end
