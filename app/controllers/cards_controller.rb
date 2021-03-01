class CardsController < ApplicationController
  before_action :set_card, only: [:show, :edit]

  def index
    @cards = Card.all
  end

  def show
    @user = current_user
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
  end

  def edit
    @user = current_user
  end

  def update
    @card.update
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
