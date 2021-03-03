class CardsController < ApplicationController
  before_action :set_card, only: [:show, :edit]

  def index
    # View parcels board
    if params[:query] == "parcels"
      @cards = policy_scope(Card).where(board: "parcels")
      @title = "Parcels"

    # View mutual help board
    elsif params[:query] == "mutual-help"
      @cards = policy_scope(Card).where(board: "mutual_help")
      @title = "Mutual help"

    # View community board
    elsif params[:query] == "community"
      @cards = policy_scope(Card).where(board: "community")
      @title = "Community"

    # View missed board
    elsif params[:query] == "missed"
     @cards = policy_scope(Card).where("created_at > ?", current_user.last_logout)
     @title = "What you've missed"

    # View my cards page
    elsif params[:query] == "my-cards"
      @cards = policy_scope(Card).where(user: current_user)
      @title = "My cards"

    # View
    elsif params[:query] == "my-cards-archived"
      @cards = policy_scope(Card).where(user: current_user, archived: true)
      @title = "My cards"

    # Default to board = missed
    else
      @cards = policy_scope(Card).where(board: "parcels")
      @title = "Parcels"
    end
  end

  def show
    @user = current_user
    authorize @card
  end

  def create
    @card = Card.new(card_params)
    @user = current_user
    @card.user = @user
    if @card.save
      redirect_to card_path(@card)
    else
      redirect_to cards_path
    end
    authorize @card
  end

  def edit
    @user = current_user
    authorize @card
  end

  def update
    @card.update
    authorize @card
    redirect_to card_path(@card)
  end

  private

  def set_card
    @card = Card.find(params[:id])
  end

  def card_params
    params.require(:card).permit(:board, :category, :title, :description, :start_date, :start_time, :end_date, :end_time, :picture, :archived)
  end
end
