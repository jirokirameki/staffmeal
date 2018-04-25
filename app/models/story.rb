class Story < ApplicationRecord
  belongs_to :shop
  
  mount_uploader :image, ImageUploader
  
  # 常にチェック
  validates :shop_id, presence: true
  validates :title, length: { maximum: 50 }
  validates :origin, length: { maximum: 250 }
  validates :recommend, length: { maximum: 250 }
  validates :atmosphere, length: { maximum: 250 }    
  
  # post時のみチェック
  with_options on: :post do
    validates :title, presence: true
    validates :origin, presence: true
    validates :recommend, presence: true
    validates :atmosphere, presence: true
  end
end
