require "rails_helper"

RSpec.describe UserMailer, type: :mailer do
  describe "email for a session booking" do
    User.create(username:"test_user1", email:"gitika.bose@gmail.com")
    User.create(username:"test_mentor1", email:"gb2606@columbia.edu")
    params = {mentor: User.find_by_username("test_mentor1"), user: User.find_by_username("test_user1")}
    let(:mail) { UserMailer.book_email }

    let(:subject) {"Mentorship Section Requested With test_mentor1"}
    it "book session" do
      expect(mail.subject).to eq(subject)
      expect(mail.to).to eq(["gb2606@columbia.edu"])
      expect(mail.from).to eq(["gitika.bose@gmail.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Hi")
    end
  end
end
