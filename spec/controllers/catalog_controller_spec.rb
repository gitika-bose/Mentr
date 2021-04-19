require 'rails_helper'

RSpec.describe CatalogController, type: :controller  do
  describe "GET #catalog" do
    context "user is not signed in" do
      it "should redirect to homepage" do
        get :index, params: {}
        expect(response).to redirect_to('/users/sign_in')
      end
    end
    context "user is signed in" do
      login_user
      it "should render all categories" do
        get :index, params: {}
        expect(response).to have_http_status(200)
      end
    end
  end

  describe "GET #catalog show" do
    context "user is signed in and wishes to view specific category" do
      login_user
      it "should render all mentors" do
        get :show, params: {id:-1}
        expect(response).to have_http_status(200)
      end
    end
  end
end
