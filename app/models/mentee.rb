class Mentee < ApplicationRecord
    belongs_to :user
    has_many :mentors
end