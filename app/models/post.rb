class Post < ApplicationRecord
  belongs_to :shop
  
  mount_uploader :image, ImageUploader
  
  validates :shop_id, presence: true
  validates :comment, presence: true, length: { maximum: 255 }
  
  has_many :likes
  has_many :users, through: :likes  
end
