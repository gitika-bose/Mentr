require "rails_helper"

RSpec.describe UserMailer, type: :mailer do
  describe "email for a session booking" do

    it "book session" do
      User.create(username:"test_user1", email:"git@gmail.com", password:"helloup")
      User.create(username:"test_mentr1", email:"tvp2107@columbia.edu", password:"qwertyuiop")

      mail = UserMailer.book_email(User.find_by(username:"test_mentr1"), User.find_by(username:"test_user1"))

      subject = "Mentorship Section Requested With test_mentr1"
      expect(mail.subject).to eq(subject)
      expect(mail.to).to eq(["tvp2107@columbia.edu"])
      expect(mail.reply_to).to eq(["git@gmail.com"])
      expect(mail.from).to eq(["gb2606@columbia.edu"])
    end

  end
end
