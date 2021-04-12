class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    id = params[:id]
    @mentor = Mentor.find_by_id(id)
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
