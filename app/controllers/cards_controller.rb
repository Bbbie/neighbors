class CardsController < ApplicationController
  before_action :set_card, only: [:show, :edit]

  def index
    # All cards
    @cards = policy_scope(Card)
    # 4 Tabs in nav bar
    # @missed_cards = @cards.where()
    @parcels_cards = @cards.where(board: "parcels")
    @mutual_help_cards = @cards.where(board: "mutual_help")
    @community_cards = @cards.where(board: "community")
    # My cards (with one filter: (archived: true)
    @my_cards = @cards.where(:user == current_user)
    @my_archived_cards = @my_cards.where(archived: true)
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
