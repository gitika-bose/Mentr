require 'rails_helper'

RSpec.describe "Mentors", type: :request do
  describe "GET /new" do
    it "returns http failure" do
      get "/mentors/new"
      expect(response).to have_http_status('302')
    end
  end

  describe "GET /edit" do
    it "returns http failure" do
      get "/mentors/edit"
      expect(response).to have_http_status('302')
    end
  end

end
