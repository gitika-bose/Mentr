require "rails_helper"

RSpec.describe UserMailer, type: :mailer do
  describe "email for a session booking" do

    it "book session" do
      User.create(username:"test_user1", email:"gitika.bose@gmail.com", password:"qwertyuiop")
      User.create(username:"test_mentor1", email:"gb2606@columbia.edu", password:"qwertyuiop")

      mail = UserMailer.book_email(User.find_by(username:"test_mentor1"), User.find_by(username:"test_user1"))

      subject = "Mentorship Section Requested With test_mentor1"
      expect(mail.subject).to eq(subject)
      expect(mail.to).to eq(["gb2606@columbia.edu"])
      expect(mail.reply_to).to eq(["gitika.bose@gmail.com"])
      expect(mail.from).to eq(["gb2606@columbia.edu"])
    end

  end
end
