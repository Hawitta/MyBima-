require "rails_helper"

RSpec.describe BrokersController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/brokers").to route_to("brokers#index")
    end

    it "routes to #new" do
      expect(get: "/brokers/new").to route_to("brokers#new")
    end

    it "routes to #show" do
      expect(get: "/brokers/1").to route_to("brokers#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/brokers/1/edit").to route_to("brokers#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/brokers").to route_to("brokers#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/brokers/1").to route_to("brokers#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/brokers/1").to route_to("brokers#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/brokers/1").to route_to("brokers#destroy", id: "1")
    end
  end
end
