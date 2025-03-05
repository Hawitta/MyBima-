require "rails_helper"

RSpec.describe BenefitiariesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/benefitiaries").to route_to("benefitiaries#index")
    end

    it "routes to #new" do
      expect(get: "/benefitiaries/new").to route_to("benefitiaries#new")
    end

    it "routes to #show" do
      expect(get: "/benefitiaries/1").to route_to("benefitiaries#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/benefitiaries/1/edit").to route_to("benefitiaries#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/benefitiaries").to route_to("benefitiaries#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/benefitiaries/1").to route_to("benefitiaries#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/benefitiaries/1").to route_to("benefitiaries#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/benefitiaries/1").to route_to("benefitiaries#destroy", id: "1")
    end
  end
end
