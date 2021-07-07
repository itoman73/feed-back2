class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :feedbacks
  has_many :authors
  has_many :favorites, dependent: :destroy     # ユーザー/お気に入り → 1:多
  mount_uploader :image, ImageUploader
end
