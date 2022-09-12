class PostImage < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  has_many :post_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  
  
  def get_image
    if image.attached?
      image
    else
      'no_image.jpg'
    end
  end
  
  validates :shop_name, presence: true
  validates :image, presence: true, blob: { content_type: :image }
  
  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end
end
