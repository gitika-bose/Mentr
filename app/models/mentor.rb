class Mentor < ApplicationRecord
    belongs_to :user
    has_many :subordinates, class_name: "User", foreign_key: "mentor_id"
    has_many :subjects
end