class CatalogController < ApplicationController
  before_action :authenticate_user!

  def index
    @mentors = get_mentors

    if params[:search] != nil and params[:search] != ""
      @mentors = @mentors.where("profile LIKE ? ", "%#{params[:search]}%").or(@mentors.where("username LIKE ? ", "%#{params[:search]}%"));
    else
      @mentors = @mentors.all;
    end

    Mentor.all.each do |user|
      puts user.linkedin
    end
  end

  def show
    id = params[:id]
    @user = get_mentors.find_by user_id: id 
  end

  private
  def get_mentors
    Mentor
      .select('users.id AS user_id,
        users.username AS username,
        users.email AS email,
        profile,
        linkedin AS professional,
        website,
        location,
        company')
      .joins(:user);
  end

end
