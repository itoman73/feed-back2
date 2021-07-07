class Feedback < ApplicationRecord
        belongs_to :user
        has_many :authors, dependent: :destroy
        has_many :favorites, dependent: :destroy
end
