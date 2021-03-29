class CatalogController < ApplicationController
  def index
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
