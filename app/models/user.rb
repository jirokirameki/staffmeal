class User < ApplicationRecord
  validates :user_name, presence: true, length: { maximum: 50 }
  
  has_many :likes
  has_many :posts, through: :likes

  def like(post)
    self.likes.find_or_create_by(post_id: post.id)
    # self.reload
  end

  def unlike(post)
    like = self.likes.find_by(post_id: post.id)
    like.destroy if like
    # self.reload
  end

  def liking?(post)
    self.posts.include?(post)
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable, :lockable, :timeoutable, :omniauthable, omniauth_providers: [:twitter]         

  def self.from_omniauth(auth)
    find_or_create_by(provider: auth["provider"], uid: auth["uid"]) do |user|
      user.provider = auth["provider"]
      user.uid = auth["uid"]
      user.user_name = auth["info"]["nickname"]
    end
  end

  def self.new_with_session(params, session)
    if session["devise.user_attributes"]
      new(session["devise.user_attributes"]) do |user|
        user.attributes = params
      end
    else
      super
    end
  end
end