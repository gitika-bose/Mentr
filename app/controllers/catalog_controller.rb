class CatalogController < ApplicationController
  before_action :authenticate_user!

  def index
    @mentors = get_mentors

    if params[:mentor] != nil and params[:mentor] != ""
      UserMailer.with(:user => current_user, :mentor => User.find_by(id:params[:mentor])).book_email.deliver_now
    end

    if params[:search] != nil and params[:search] != ""
      @mentors = @mentors.where("username LIKE ? ", "%#{params[:search]}%");
    else
      @mentors = @mentors.all;
    end
  end

  def show
    id = params[:id] # retrieve movie ID from URI route
    @user = get_mentors.find_by user_id: id #Mentor.select('users.id AS id, users.email as email, users.username as username').joins(:user).all.find_by id: id
  end

  private
  def get_mentors
    Mentor
      .select('users.id AS user_id, users.username AS username, users.email AS email')
      .joins(:user);
  end

end
