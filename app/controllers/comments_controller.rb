class CommentsController < ApplicationController
  def create
    raise
    @comment = Comment.new(comment_params)
    @comment.user = current_user
    @comment.card = Card.find(params[:card_id])
    @comment.save
    authorize @comment
    redirect_to cards_path
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
