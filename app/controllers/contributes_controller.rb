class ContributesController < ApplicationController

  def new
    @contribute = Contribute.new
  end

  def create
    @contribute = current_user.contributes.build(contribute_params)
    if @contribute.save
      redirect_to new_contribute_path
    else
      render :index
    end
  end

  def index
    @contributes = Contribute.all.includes(:user).order("created_at DESC")
    @likes = ContributeLike.all.includes(:user)
    @content_max_length = 200
  end

  def show
    @target_contribute = Contribute.find(params[:id])
  end

  private
  def contribute_params
    params.require(:contribute).permit(:image, :title, :content, :price, :tag)
  end
end
