class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    @comment.user = current_user
    @card = Card.find(params[:card_id])
    @comment.card = @card
    @comment.save
    authorize @comment
    redirect_to cards_path(@comment, anchor: "myModal<%= @card.id %>")
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
