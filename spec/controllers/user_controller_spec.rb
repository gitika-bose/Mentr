require 'rails_helper'

RSpec.describe UsersController, type: :controller  do
  describe "GET #user show" do
    context "user is not signed in" do
      it "should redirect to sign in" do
        User.create(username:"user", email:"user@user.com", password:"userrrrr")
        Mentor.create(id:User.find_by_username("user"), profile:"i am a user", company:"use", location:"utilize")

        get :show, params:{id:User.find_by_username("user").id}
        expect(response).to redirect_to('/users/sign_in')
      end
    end
    context "user is signed in" do
      login_user
      it "should render user" do
        User.create(username:"user", email:"user@user.com", password:"userrrrr")
        Mentor.create(id:User.find_by_username("user"), profile:"i am a user", company:"use", location:"utilize")

        get :show, params:{id:User.find_by_username("user").id}
        expect(response).to have_http_status(200)
      end
    end
  end
end
