class CommentsController < ApplicationController

  def create
    @new_comment = Comment.create(comment_params)
    redirect_to contributes_path
  end

private
  def comment_params
    params.require(:comment).permit(:content, :contribute_id).merge(user_id: current_user.id)
  end
end
