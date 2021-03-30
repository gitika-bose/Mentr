class Session < ApplicationRecord
    enum status: [ :requested, :accepted, :terminated ]

    belongs_to :mentor
    belongs_to :mentee

    def self.request(mentee, mentor)
        @sess = Session.create(mentor: mentor, mentee: mentee)
        @sess.requested!
    end
end
