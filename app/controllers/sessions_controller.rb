class SessionsController < ApplicationController
  before_action :authenticate_user!

  def show
    @sessions_as_mentor = Session.joins(:mentor).where("mentors.user_id = ?", current_user.id).all
    @sessions_as_mentee = Session.joins(:mentee).where("mentees.user_id = ?", current_user.id).all
  end

  def create
    if params[:mentor_id] != nil
      UserMailer.with(:user => current_user, :mentor => User.find_by(id:params[:mentor_id])).book_email.deliver_now!
      if !(Mentee.find_by user: current_user)
        Mentee.create(user: current_user)
      end
      @mentee = Mentee.find_by user: current_user
      @mentor = Mentor.find_by user_id: params[:mentor_id]
      Session.request(@mentee, @mentor)
      
      redirect_to sessions_show_path
    else
      redirect_to catalog_index_path
    end
  end

  def approve
    @session = Session.find(params[:session_id])
    @session.accepted!
    redirect_to sessions_show_path
  end

  def cancel
    @session = Session.find(params[:session_id])
    @session.terminated!
    redirect_to sessions_show_path
  end

end
