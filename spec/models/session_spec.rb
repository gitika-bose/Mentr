require 'rails_helper'

RSpec.describe Session, type: :model do
  describe 'create' do
    let(:menter) { Mentor.new() }
    let(:mentee) { Mentee.new() }
    it 'is valid with correct parameters' do
      expect(Session.request(mentee, menter)).to be_truthy
    end
  end
end
