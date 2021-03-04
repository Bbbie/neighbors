class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    @comment.user = current_user
    @comment.card = Card.find(params[:card_id])
    @comment.save
    authorize @comment
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
