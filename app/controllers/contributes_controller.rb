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
    @contributes = Contribute.all.includes(:user)
  end

  private
  def contribute_params
    params.require(:contribute).permit(:image, :title, :content, :price, :tag)
  end
end
