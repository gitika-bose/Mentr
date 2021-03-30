require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'add new user' do
    context 'add fakeemail@gmail.com' do
      it 'no users initially' do
        @user = User.find_by_email("fakeemail@gmail.com")
        expect(@user).to eq nil
      end
      it 'one user added to database' do
        User.create(email:"gitika.bose@gmail.com", username: "gitikabose", password: "yogurt5678")
        @user = User.find_by_email("gitika.bose@gmail.com")
        expect(@user.email).to eq "gitika.bose@gmail.com"
      end
      it "something" do
        response = User.find_for_database_authentication({username: "bob", email:"bob@mentr.me"})
        expect(response).to eq nil
      end
    end
  end
  describe 'bad new user add' do
    context 'add git@gmail.com' do
      it 'missing username' do
        User.create(email:"git@gmail.com", password: "yogurt1234")
        @user = User.find_by_email("git@gmail.com")
        expect(@user).to eq nil
      end
    end
  end
  describe 'search for user' do
    context 'git@gmail.com' do
      it 'missing username' do
        User.create(email:"git@gmail.com", username: "gitikabose", password: "yogurt5678")
        @user = User.search("gitika")
        expect(@user[0]).to eq User.find_by(username:"gitikabose")
      end
    end
  end
end
