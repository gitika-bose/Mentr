class UserMailer < ApplicationMailer
  default from: 'gb2606@columbia.edu'

  def book_email(mentor=nil, user=nil)
    if mentor == nil
      @mentor = params[:mentor]
    else
      @mentor = mentor
    end
    if user == nil
      @user = params[:user]
    else
      @user = user
    end

    @reply_to = @user.email
    @subject = 'Mentorship Section Requested With ' + @mentor.username

    mail(reply_to: @reply_to, to: @mentor.email, subject: @subject)
  end
end
