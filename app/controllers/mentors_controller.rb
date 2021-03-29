class MentorsController < ApplicationController
  before_action :authenticate_user!

  def new
    if Mentor.find_by user: current_user
      redirect_to mentors_edit_path
    else
      @mentor = Mentor.new
    end
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
    @mentor = Mentor.find_by user: current_user
  end
  
  def update
    @mentor = Mentor.find(user: current_user)

    if @mentor.update()
      redirect_to @mentor
    else
      render :edit
    end
  end

end
