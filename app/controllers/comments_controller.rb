class CommentsController < ApplicationController
  def create
    @comment = Comment.create(comment_params)
    if @comment.save
      ActionCable.server.broadcast 'comment_channel', content: @comment
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, park_id: params[:park_id])
  end
end
