require 'rails_helper'

RSpec.describe MentorsController, type: :controller  do
  describe "GET #new" do
    context "user is not signed in" do
      it "should redirect to login" do
        get :new, params: {}
        expect(response).to redirect_to('/users/sign_in')
      end
    end
    context "user is signed in" do
      login_user
      it "should render mentors page" do
        get :new, params: {}
        expect(response).to have_http_status(200)
      end
    end
  end
  
end
