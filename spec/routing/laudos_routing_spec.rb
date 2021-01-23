require "rails_helper"

RSpec.describe LaudosController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/laudos").to route_to("laudos#index")
    end

    it "routes to #new" do
      expect(get: "/laudos/new").to route_to("laudos#new")
    end

    it "routes to #show" do
      expect(get: "/laudos/1").to route_to("laudos#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/laudos/1/edit").to route_to("laudos#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/laudos").to route_to("laudos#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/laudos/1").to route_to("laudos#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/laudos/1").to route_to("laudos#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/laudos/1").to route_to("laudos#destroy", id: "1")
    end
  end
end
