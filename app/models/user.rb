class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts, dependent: :nullify
  has_many :likes, dependent: :destroy
  mount_uploader :image, ImageUploader


  has_many :follows, dependent: :destroy
  has_many :followings, through: :follows, source: :target

  has_many :received_follows, class_name: "Follow", foreign_key: :target_id, dependent: :destroy
  has_many :followers, through: :received_follows, source: :user

  has_many :items, dependent: :destroy
  has_many :orders, dependent: :destroy

end
