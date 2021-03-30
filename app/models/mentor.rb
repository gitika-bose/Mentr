class Mentor < ApplicationRecord
    belongs_to :user
    has_many :sessions
    has_many :mentees, through: :sessions
end