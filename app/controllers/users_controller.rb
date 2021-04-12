class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    id = params[:id]
    @user = Mentor.find_by user_id: id
  end
  
end
