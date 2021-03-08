class CommentsController < ApplicationController
  def create
    @card = Card.find(params[:card_id])
    @new_comment = Comment.new(comment_params)
    @new_comment.card = @card
    @new_comment.user = current_user
    @new_comment.save
    @empty_comment = Comment.new
    authorize @new_comment
    CardChannel.broadcast_to(
      @card,
      render_to_string(partial: "message", locals: { comment: @new_comment, empty_comment: @empty_comment, card: @card })
    )
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
