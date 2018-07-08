class HashtagsController < ApplicationController
  before_action :get_hashtag

  def show
    @contained_hashtag_contributes = Contribute.joins(:contribute_tags).where(contribute_tags: {name: get_hashtag}).order("contributes.created_at DESC")
    @contained_hashtag_contributes_count = @contained_hashtag_contributes.count
  end

  def popular
    @contained_hashtag_contributes = Contribute.joins(:contribute_tags).where(contribute_tags: {name: get_hashtag}).order("likes_count DESC, created_at DESC")
    @contained_hashtag_contributes_count = @contained_hashtag_contributes.count
  end

  private

  def get_hashtag
    @hashtag = params[:hashtag]
  end

end
