class CatalogController < ApplicationController
  before_action :authenticate_user!

  def index
    if params[:mentor] != nil and params[:mentor] != ""
      UserMailer.with(:user => current_user, :mentor => User.find_by(id:params[:mentor])).book_email.deliver_now
    end

    if params[:search] != nil and params[:search] != ""
      @users = User.search(params[:search]);
    else
      @users = User.all;
    end
  end

  def show
    id = params[:id] # retrieve movie ID from URI route
    @user = User.find(id)
  end
end
