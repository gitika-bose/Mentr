class MentorsController < ApplicationController
  before_action :authenticate_user!

  def new
    @mentor = Mentor.new
  end

  def create
    @mentor = Mentor.new(user: current_user)

    if @mentor.save
      redirect_to catalog_index_path
    else
      render :new
    end
  end

  def edit
  end
end
