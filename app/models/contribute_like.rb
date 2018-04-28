class ContributeLike < ApplicationRecord
  belongs_to :user
  belongs_to :contribute
end
