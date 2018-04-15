class Shop < ApplicationRecord
  validates :shop_name, presence: true, length: { maximum: 50 }
  validates :company_name, presence: true, length: { maximum: 50 }
  validates :url, length: { maximum: 255 }, presence: true, 
                  format: /\A#{URI::regexp(%w(http https))}\z/,
                  uniqueness: { case_sensitive: false }
  validates :staff_name, presence: true, length: { maximum: 50 }
  validates :tel, presence: true, length: { maximum: 50 }
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :lockable, :timeoutable, :confirmable
end
