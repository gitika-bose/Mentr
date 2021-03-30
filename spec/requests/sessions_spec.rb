require 'rails_helper'

RSpec.describe "Sessions", type: :request do
  describe "GET /show" do
    it "returns http failure for not logged in" do
      get "/sessions/show"
      expect(response).to have_http_status('302')
    end
  end

end
