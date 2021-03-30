class Session < ApplicationRecord
    enum status: [ :requested, :accepted, :terminated ]

    belongs_to :mentor
    belongs_to :mentee

    def self.request(mentee, mentor)
        Session.create(mentor: mentor, mentee: mentee, status: requested)
    end
end
