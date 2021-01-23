require "rails_helper"

RSpec.describe RelatoriosController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/relatorios").to route_to("relatorios#index")
    end

    it "routes to #new" do
      expect(get: "/relatorios/new").to route_to("relatorios#new")
    end

    it "routes to #show" do
      expect(get: "/relatorios/1").to route_to("relatorios#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/relatorios/1/edit").to route_to("relatorios#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/relatorios").to route_to("relatorios#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/relatorios/1").to route_to("relatorios#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/relatorios/1").to route_to("relatorios#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/relatorios/1").to route_to("relatorios#destroy", id: "1")
    end
  end
end
