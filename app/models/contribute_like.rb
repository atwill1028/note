class ContributeLike < ApplicationRecord
  belongs_to :user
  belongs_to :contribute, counter_cache: :likes_count
end
