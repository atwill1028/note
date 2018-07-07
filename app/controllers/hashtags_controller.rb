class HashtagsController < ApplicationController
  before_action :get_hashtag, :show_and_popular

  def show
    @contained_hashtag_contributes = Contribute.joins(:contribute_tags).where(contribute_tags: {name: get_hashtag}).order("contributes.created_at DESC")
    @contained_hashtag_contributes_count = @contained_hashtag_contributes.count
    @sort_type = "new"
  end

  def popular
    @contained_hashtag_contributes = Contribute.joins(:contribute_tags).where(contribute_tags: {name: get_hashtag}).order("likes_count DESC, created_at DESC")
    @contained_hashtag_contributes_count = @contained_hashtag_contributes.count
  end

  private

  def get_hashtag
    @hashtag = params[:hashtag]
  end

  def show_and_popular
    @likes = ContributeLike.all.includes(:user)
    @content_max_length = 200
  end
end
