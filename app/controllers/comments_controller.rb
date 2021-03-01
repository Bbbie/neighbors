class CommentsController < ApplicationController
  def create
    @user = current_user
    @card = Card.find(params[:card_id])
    @comment = Comment.new(comment_params)
    @comment.user = current_user
    @comment.card = @card
    @comment.save
    redirect_to card_path(@card)
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
