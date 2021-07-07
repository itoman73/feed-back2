class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :feedback
  
  validates_uniqueness_of :feedback_id, scope: :user_id
end
