class ContributeLikesController < ApplicationController
  def create
    @like = ContributeLike.create(user_id: current_user.id, contribute_id: params[:contribute_id])
    @contribute = Contribute.find_by(id: params[:contribute_id])
  end

  def destroy
    like = ContributeLike.find_by(user_id: current_user.id, contribute_id: params[:contribute_id])
    like.destroy
    @contribute = Contribute.find_by(id: params[:contribute_id])
  end
end
