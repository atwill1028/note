class Contribute < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :contribute_likes, dependent: :destroy
  mount_uploader :image, ImageUploader
  def like_user(user_id)
    contribute_likes.find_by(user_id: user_id)
  end

  def before_contribute
    Contribute.order("created_at DESC").find_by("created_at <= ? and id <?",created_at, id)
  end

  def next_contribute
    Contribute.order(created_at: :desc, id: :desc).where("created_at >= ? and id > ?", created_at, id).reverse.first
  end
end
