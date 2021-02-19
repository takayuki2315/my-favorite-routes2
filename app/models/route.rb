class Route < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :city
  belongs_to_active_hash :category

  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :likes
  has_one_attached :image, dependent: :destroy

  validates :title, presence: true
  validates :text, presence: true
  validates :city_id, presence: true
  validates :category_id, numericality: { other_than: 0 }
  validates :image, presence: true

  def self.search(search)
    if search != ""
      Route.where(['title LIKE(?) or text LIKE(?)', "%#{search}%", "%#{search}%"])
    else
      Route.all
    end
  end
  
end
