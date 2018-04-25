class JobOffer < ApplicationRecord
  belongs_to :shop
  
  mount_uploader :image, ImageUploader
  
  # 常にチェック
  validates :shop_id, presence: true
  validates :title, length: { maximum: 50 }
  validates :what, length: { maximum: 250 }
  validates :team, length: { maximum: 250 }  
  validates :want, length: { maximum: 250 }
  
  # post時のみチェック
  with_options on: :post do
    validates :title, presence: true
    validates :what, presence: true
    validates :team, presence: true
    validates :want, presence: true
  end
end
