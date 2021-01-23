require "rails_helper"

RSpec.describe DeclaracaosController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/declaracaos").to route_to("declaracaos#index")
    end

    it "routes to #new" do
      expect(get: "/declaracaos/new").to route_to("declaracaos#new")
    end

    it "routes to #show" do
      expect(get: "/declaracaos/1").to route_to("declaracaos#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/declaracaos/1/edit").to route_to("declaracaos#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/declaracaos").to route_to("declaracaos#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/declaracaos/1").to route_to("declaracaos#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/declaracaos/1").to route_to("declaracaos#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/declaracaos/1").to route_to("declaracaos#destroy", id: "1")
    end
  end
end
