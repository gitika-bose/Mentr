require 'rails_helper'

RSpec.describe "Payments", type: :request do
  describe "GET /checkout" do
    it "returns http success" do
      get "/payment/checkout"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /failure" do
    it "returns http success" do
      get "/payment/failure"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /success" do
    it "returns http success" do
      get "/payment/success"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /selected" do
    it "returns http success" do
      get "/payment/selected"
      expect(response).to have_http_status(:success)
    end
  end

end
