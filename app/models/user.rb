class User < ApplicationRecord
  validates :name, presence: true, length: { maximum: 50 }
  
  has_many :likes
  has_many :posts, through: :likes

  def like(post)
    self.likes.find_or_create_by(post_id: post.id)
  end

  def unlike(post)
    like = self.likes.find_by(post_id: post.id)
    like.destroy if like
  end

  def liking?(post)
    self.posts.include?(post)
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable, :lockable, :timeoutable
         #, :omniauthable, omniauth_providers: [:twitter]         
end
