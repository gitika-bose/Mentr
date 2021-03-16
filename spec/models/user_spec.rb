require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'add new user' do
    context 'add gitika.bose@gmail.com' do
      it 'no users initially' do
        @user = User.find_by_email("gitika.bose@gmail.com")
        expect(@user).to eq nil
      end
      it 'one user added to database' do
        User.create(email:"gitika.bose@gmail.com", username: "gitikabose", password: "yogurt5678")
        @user = User.find_by_email("gitika.bose@gmail.com")
        expect(@user.email).to eq "gitika.bose@gmail.com"
      end
    end
  end
end
