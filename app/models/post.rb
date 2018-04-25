class Post < ApplicationRecord
  belongs_to :shop
  
  mount_uploader :image, ImageUploader
  
  validates :shop_id, presence: true
  validates :comment, length: { maximum: 140 }
  
  has_many :likes, dependent: :destroy
  has_many :users, through: :likes
  
  # 今日の投稿されたPostを取得
  scope :created_today, -> { where(created_at: Time.zone.now.all_day) }
end
