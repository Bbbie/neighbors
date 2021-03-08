class CardsController < ApplicationController
  before_action :set_card, only: [:show, :edit, :archive]

  def index
    # View parcels board
    if params[:query] == "parcels"
      @cards = policy_scope(Card).where(board: "parcels").where(archived: false).order(created_at: :desc)
      @title = "Parcels"

    # View mutual help board
    elsif params[:query] == "mutual-help"
      @cards = policy_scope(Card).where(board: "mutual_help").where(archived: false).order(created_at: :desc)
      @title = "Mutual help"

    # View community board
    elsif params[:query] == "community"
      @cards = policy_scope(Card).where(board: "community").where(archived: false).order(created_at: :desc)
      @title = "Community"

    # View missed board
    elsif params[:query] == "missed"
     @cards = policy_scope(Card).where("created_at > ?", current_user.last_logout).where(archived: false).order(created_at: :desc)
     @title = "What you've missed"

    # View my cards page
    elsif params[:query] == "my-cards"
      @cards = policy_scope(Card).where(archived: false).where(user: current_user).order(created_at: :desc)
      @title = "My cards"

    # View
    elsif params[:query] == "my-cards-archived"
      @cards = policy_scope(Card).where(user: current_user, archived: true).order(created_at: :desc)
      @title = "My cards"
    end
    @empty_card = Card.new
    @empty_recipient = CardRecipient.new
    @comment = Comment.new
  end

  def show
    @user = current_user
    authorize @card
  end

  def create
    @card = Card.new(card_params)
    @user = current_user
    @card.user = @user
    @card_users = User.where(id: params['card'][:user_ids])
    @card_users.each do |user|
      CardRecipient.create(user: user, card: @card)
    end
    if @card.save
      redirect_to cards_path
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

  def archive
    @card.archived = true
    @card.save
    redirect_to cards_path(query: "my-cards-archived")
    authorize @card
  end

  private

  def set_card
    @card = Card.find(params[:id])
  end

  def card_params
    params.require(:card).permit(:board, :category, :title, :description, :start_date, :start_time, :end_date, :end_time, :picture, :archived)
  end
end
