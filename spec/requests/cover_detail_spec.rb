require 'rails_helper'

RSpec.describe "CoverDetails", type: :request do
  describe "GET /cover_id:integer" do
    it "returns http success" do
      get "/cover_detail/cover_id:integer"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /category:string" do
    it "returns http success" do
      get "/cover_detail/category:string"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /optional:string" do
    it "returns http success" do
      get "/cover_detail/optional:string"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /younger_age:integer" do
    it "returns http success" do
      get "/cover_detail/younger_age:integer"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /older_age:integer" do
    it "returns http success" do
      get "/cover_detail/older_age:integer"
      expect(response).to have_http_status(:success)
    end
  end

end
