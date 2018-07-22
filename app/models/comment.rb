class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :contribute
  has_many :comment_likes, dependent: :destroy
  def like_user(user_id)
    comment_likes.find_by(user_id: user_id)
  end
end
