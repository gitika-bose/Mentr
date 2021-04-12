class Mentor < ApplicationRecord
    belongs_to :user
    has_one_attached :resume
    has_many :sessions
    has_and_belongs_to_many :subjects
    has_many :mentees, through: :sessions

    def addSubject(subject_name)
        subjects << Subject.find_by_name(subject_name)
    end

    def username
        user.username
    end

    def email
        user.email
    end

    def professional
        linkedin
    end

    def self.withUserInfo
        Mentor.select('users.id AS user_id,
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