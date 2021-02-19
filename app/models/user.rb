class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :validatable
  
  def self.guest
    find_or_create_by!(nickname: 'ゲスト', email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
    end
  end

  def favorited_by?(route_id)
    Like.where(route_id: route_id).exists?
  end

  validates :nickname, presence: true

  has_many :routes ,dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes


end
