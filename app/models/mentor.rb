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

    scope :filter_by_search, -> (term) do
      @subjects = Subject.all
      @mentor_ids = []
      @subjects.each do |sub|
        if sub.name.downcase[term.downcase]
          sub.mentors.each do |mentor|
            @mentor_ids.push(mentor.id)
          end
        end
      end
      Mentor.all.each do |mntr|
        if mntr.user.username.downcase[term.downcase]
          @mentor_ids.push(mntr.id)
        end
      end
      where(id: @mentor_ids).or(where("LOWER(profile) like ?", "#{term.downcase}%"))
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
