class ContributesController < ApplicationController
  before_action :set_user
  def new
    @contribute = Contribute.new
  end

  def create
    @contribute = @user.contributes.new(contribute_params)
    @contribute.save
  end

  private
  def contribute_params
    params.require(:contribute).permit(:image, :title, :content).merge(user_id: current_user.id)
  end

  def set_user
    @user = User.find(current_user.id)
  end
end
