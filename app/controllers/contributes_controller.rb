class ContributesController < ApplicationController
  LIKES = ContributeLike.all.includes(:user)
  CONTENT_MAX_LENGTH = 200

  def new
    @contribute = Contribute.new
    @tag = ContributeTag.new
  end

  def create
    @contribute = current_user.contributes.build(contribute_params)
    tag_params[:name].split(",").each do |tag_param|
      one_tag = @contribute.contribute_tags.build(name: "#{tag_param}")
      one_tag.save
    end
    if @contribute.save
      redirect_to new_contribute_path
    else
      render :index
    end
  end

  def index
    @contributes = Contribute.all.includes(:user).order("created_at DESC")
  end

  def show
    @target_contribute = Contribute.find(params[:id])
    @recommended_contributes_number = 3
    @recommended_contributes = @target_contribute.user.contributes.order("likes_count DESC, id DESC").where.not(id:params[:id]).limit(@recommended_contributes_number)
    @before_contribute = @target_contribute.before_contribute
    @next_contribute = @target_contribute.next_contribute
    @comment = Comment.new
    @target_comments = @target_contribute.comments
    @target_comments_count = @target_comments.count
  end

  private
  def contribute_params
    params.require(:contribute).permit(:image, :title, :content, :price)
  end

  def tag_params
    params.require(:contribute_tag)
  end
end
