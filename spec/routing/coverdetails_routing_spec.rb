require "rails_helper"

RSpec.describe CoverdetailsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/coverdetails").to route_to("coverdetails#index")
    end

    it "routes to #new" do
      expect(get: "/coverdetails/new").to route_to("coverdetails#new")
    end

    it "routes to #show" do
      expect(get: "/coverdetails/1").to route_to("coverdetails#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/coverdetails/1/edit").to route_to("coverdetails#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/coverdetails").to route_to("coverdetails#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/coverdetails/1").to route_to("coverdetails#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/coverdetails/1").to route_to("coverdetails#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/coverdetails/1").to route_to("coverdetails#destroy", id: "1")
    end
  end
end
