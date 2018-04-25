class Shop < ApplicationRecord
  validates :shop_name, presence: true, length: { maximum: 50 }
  validates :url, length: { maximum: 255 }, 
                  format: /\A|#{URI::regexp(%w(http https))}\z/
                  # , uniqueness: { case_sensitive: false }
  validates :phone_number, length: { maximum: 20 }
  
  mount_uploader :image, ImageUploader
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :lockable, :timeoutable

  geocoded_by :address
  before_update do  
    if !self.prefecture.nil? && !self.city.nil? && !self.street.nil?
      self.address = self.prefecture + self.city + self.street
      if !self.building.nil?
        self.address = self.address + self.building
      end
      # 緯度経度の計算
      geocode
    end
  end

  has_many :posts, dependent: :destroy
  has_one :story, dependent: :destroy
  has_one :job_offer, dependent: :destroy
end
