class Contribute < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :contribute_likes, dependent: :destroy

  def like_user(user_id)
    contribute_likes.find_by(user_id: user_id)
  end
end
