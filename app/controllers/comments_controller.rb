class CommentsController < ApplicationController
  LIKES = CommentLike.all.includes(:user)
  def create
    @new_comment = Comment.create(comment_params)
    @target_comments = @new_comment.contribute.comments
    @target_comments_count = @target_comments.count
  end

  def destroy
    @delete_comment = Comment.find_by(id: delete_params)
    @target_contribute = @delete_comment.contribute
    @delete_comment.destroy
    @target_comments = @target_contribute.comments
    @target_comments_count = @target_comments.count
  end

  private
  def comment_params
    params.require(:comment).permit(:content, :contribute_id).merge(user_id: current_user.id)
  end

  def delete_params
    params[:id]
  end
end
