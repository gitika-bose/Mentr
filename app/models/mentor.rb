class Mentor < ApplicationRecord
    belongs_to :user
    has_one_attached :resume
    has_many :sessions
    has_many :subjects
    has_many :mentees, through: :sessions
end