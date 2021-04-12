class Mentor < ApplicationRecord
    belongs_to :user
    has_one_attached :resume
    has_many :sessions
    has_and_belongs_to_many :subjects
    has_many :mentees, through: :sessions

    def addSubject(subject_name)
        subjects << Subject.find_by_name(subject_name)
    end
end