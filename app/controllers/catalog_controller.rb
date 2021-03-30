class CatalogController < ApplicationController
  before_action :authenticate_user!

  def index
    @mentors = get_mentors

    puts "NOTICE ME"
    if params[:mentor] != nil and params[:mentor] != ""
      puts "IM IN THERE"
      UserMailer.with(:user => current_user, :mentor => User.find_by(id:params[:mentor])).book_email.deliver_now
      if !(Mentee.find_by user: current_user)
        Mentee.create(user: current_user)
      end
      Session.request(:mentee => (Mentee.find_by user: current_user), :mentor => (Mentor.find_by user_id: params[:mentor]))
      puts "Created a new session"
      puts Session
    end

    if params[:search] != nil and params[:search] != ""
      @mentors = @mentors.where("username LIKE ? ", "%#{params[:search]}%");
    else
      @mentors = @mentors.all;
    end

    Mentor.all.each do |user|
      puts user.linkedin
    end
  end

  def show
    id = params[:id]
    @user = get_mentors.find_by user_id: id #Mentor.select('users.id AS id, users.email as email, users.username as username').joins(:user).all.find_by id: id
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
