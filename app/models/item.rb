class Item < ApplicationRecord
  belongs_to :user, optional: true
  mount_uploader :image, ImageUploader
  has_many :line_items, dependent: :destroy

end
