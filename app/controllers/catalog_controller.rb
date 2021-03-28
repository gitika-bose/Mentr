class CatalogController < ApplicationController
  def index
    @users = User.all;
  end

  def show
    id = params[:id] # retrieve movie ID from URI route
    @user = User.find(id)
  end
end
