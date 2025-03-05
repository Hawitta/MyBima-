require "rails_helper"

RSpec.describe DependantsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/dependants").to route_to("dependants#index")
    end

    it "routes to #new" do
      expect(get: "/dependants/new").to route_to("dependants#new")
    end

    it "routes to #show" do
      expect(get: "/dependants/1").to route_to("dependants#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/dependants/1/edit").to route_to("dependants#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/dependants").to route_to("dependants#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/dependants/1").to route_to("dependants#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/dependants/1").to route_to("dependants#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/dependants/1").to route_to("dependants#destroy", id: "1")
    end
  end
end
