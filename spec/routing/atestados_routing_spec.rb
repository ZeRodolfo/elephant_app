require "rails_helper"

RSpec.describe AtestadosController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/atestados").to route_to("atestados#index")
    end

    it "routes to #new" do
      expect(get: "/atestados/new").to route_to("atestados#new")
    end

    it "routes to #show" do
      expect(get: "/atestados/1").to route_to("atestados#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/atestados/1/edit").to route_to("atestados#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/atestados").to route_to("atestados#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/atestados/1").to route_to("atestados#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/atestados/1").to route_to("atestados#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/atestados/1").to route_to("atestados#destroy", id: "1")
    end
  end
end
