class CommentsController < ApplicationController
  def create
    comment = Comment.create(comment_params)
    redirect_to "/parks/#{comment.park.id}"
  end

  private
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, park_id: params[:park_id])
  end
end
