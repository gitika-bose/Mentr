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
    @mentor = Mentor.new(mentor_params)

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
    @mentor = Mentor.find_by user: current_user

    if @mentor.update(mentor_params)
      redirect_to catalog_path(current_user.id)
    else
      render :edit
    end
  end

  def destroy
    @mentor = Mentor.find_by user: current_user
    @mentor.destroy

    redirect_to catalog_index_path
  end

private
  def mentor_params
    ({:user => current_user}).merge(params.require(:mentor).permit(:profile, :linkedin, :location, :website, :company))
  end

end
