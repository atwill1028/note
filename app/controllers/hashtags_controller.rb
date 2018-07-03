class HashtagsController < ApplicationController
  before_action :get_category, :get_hashtag

  def show
    @contained_hashtag_contributes = Contribute.joins(:contribute_tags).where(contribute_tags: {name: get_hashtag}).order("contributes.created_at DESC")
    @contained_hashtag_contributes_count = @contained_hashtag_contributes.count
    @likes = ContributeLike.all.includes(:user)
    @content_max_length = 200
  end

  private
  def get_category
    @category = params[:controller]
  end

  def get_hashtag
    @hashtag = params[:hashtag]
  end
end
