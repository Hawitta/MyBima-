require 'rails_helper'

RSpec.describe "CoverDetails", type: :request do
  describe "GET /cover_id:integer" do
    it "returns http success" do
      get "/cover_details/cover_id:integer"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /category:string" do
    it "returns http success" do
      get "/cover_details/category:string"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /optional:string" do
    it "returns http success" do
      get "/cover_details/optional:string"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /younger_age:integer" do
    it "returns http success" do
      get "/cover_details/younger_age:integer"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /older_age:integer" do
    it "returns http success" do
      get "/cover_details/older_age:integer"
      expect(response).to have_http_status(:success)
    end
  end

end
