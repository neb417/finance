require "rails_helper"

RSpec.describe FederalTaxBracketsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/federal_tax_brackets").to route_to("federal_tax_brackets#index")
    end

    it "routes to #new" do
      expect(get: "/federal_tax_brackets/new").to route_to("federal_tax_brackets#new")
    end

    it "routes to #show" do
      expect(get: "/federal_tax_brackets/1").to route_to("federal_tax_brackets#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/federal_tax_brackets/1/edit").to route_to("federal_tax_brackets#edit", id: "1")
    end

    it "routes to #create" do
      expect(post: "/federal_tax_brackets").to route_to("federal_tax_brackets#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/federal_tax_brackets/1").to route_to("federal_tax_brackets#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/federal_tax_brackets/1").to route_to("federal_tax_brackets#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/federal_tax_brackets/1").to route_to("federal_tax_brackets#destroy", id: "1")
    end
  end
end
