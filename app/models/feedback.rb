class Feedback < ApplicationRecord
        belongs_to :user
        has_many :authors
end
