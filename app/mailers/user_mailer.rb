class UserMailer < ApplicationMailer
  default from: 'gb2606@columbia.edu'

  def book_email
    @mentor = params[:mentor]
    @user = params[:user]

    @reply_to = @user.email
    @subject = 'Mentorship Section Requested With ' + @mentor.username

    mail(reply_to: @reply_to, to: @mentor.email, subject: @subject)
  end
end
