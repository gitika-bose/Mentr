require 'rails_helper'

RSpec.describe "Sessions", type: :request do

  describe "GET /show" do
    it "returns http 302 for not-logged in" do
      get "/sessions/show", params: {}
      expect(response).to have_http_status(302)
    end
  end

end
