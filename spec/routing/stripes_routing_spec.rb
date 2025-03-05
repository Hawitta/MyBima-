require "rails_helper"

RSpec.describe StripesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/stripes").to route_to("stripes#index")
    end

    it "routes to #new" do
      expect(get: "/stripes/new").to route_to("stripes#new")
    end

    it "routes to #show" do
      expect(get: "/stripes/1").to route_to("stripes#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/stripes/1/edit").to route_to("stripes#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/stripes").to route_to("stripes#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/stripes/1").to route_to("stripes#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/stripes/1").to route_to("stripes#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/stripes/1").to route_to("stripes#destroy", id: "1")
    end
  end
end
