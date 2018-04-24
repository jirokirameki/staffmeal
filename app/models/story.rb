class Story < ApplicationRecord
  belongs_to :shop
  
  mount_uploader :image, ImageUploader
  
  validates :shop_id, presence: true
  validates :title, presence: true, length: { maximum: 40 }
  validates :origin, presence: true, length: { maximum: 600 }
  validates :recommend, presence: true, length: { maximum: 600 }  
  validates :atmosphere, presence: true, length: { maximum: 600 }    
end
