class Mentee < ApplicationRecord
    belongs_to :user
    has_many :sessions
    has_many :mentors, through: :sessions
end