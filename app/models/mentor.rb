class Mentor < ApplicationRecord
    belongs_to :user
    has_many :mentors
    has_many :subjects
end