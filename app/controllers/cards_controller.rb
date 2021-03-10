class CardsController < ApplicationController
  before_action :set_card, only: [:show, :edit, :archive, :update]

  def index
    # View parcels board
    if params[:query] == "parcels"
      @cards = policy_scope(Card).where(board: "parcels").where(archived: false).order(created_at: :desc)
      @title = "Parcels"

    # View mutual help board
    elsif params[:query] == "mutual_help"
      @cards = policy_scope(Card).where(board: "mutual_help").where(archived: false).order(created_at: :desc)
      @title = "Mutual help"

    # View community board
    elsif params[:query] == "community"
      @cards = policy_scope(Card).where(board: "community").where(archived: false).order(created_at: :desc)
      @title = "Community"

    # View missed board
    elsif params[:query] == "missed"
      missed_cards = policy_scope(Card).where("created_at > ?", current_user.last_logout)
      missed_comments = policy_scope(Card).joins(:comments).where("comments.created_at > ?", current_user.last_logout)
      @cards = missed_cards.union(missed_comments).order(created_at: :desc)
      @title = "What you've missed"

    # View my cards page
    elsif params[:query] == "my-cards"
      @cards = policy_scope(Card).where(archived: false).where(user: current_user).order(created_at: :desc)
      @title = "My cards"

    # View
    elsif params[:query] == "my-cards-archived"
      @cards = policy_scope(Card).where(user: current_user, archived: true).order(created_at: :desc)
      @title = "My cards"

    else
      missed_cards = policy_scope(Card).where("created_at > ?", current_user.last_logout)
      missed_comments = policy_scope(Card).joins(:comments).where("comments.created_at > ?", current_user.last_logout)
      @cards = missed_cards.union(missed_comments).order(created_at: :desc)
      @title = "What you've missed"

    end
    @empty_card = Card.new
    @empty_recipient = CardRecipient.new
    @empty_comment = Comment.new
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
    authorize @card
    @card.save!
    if @card.board == "parcels"
      redirect_to cards_path(query: "parcels")
    elsif @card.board == "mutual_help"
      redirect_to cards_path(query: "mutual_help")
    elsif cards_path(query: "community")
      redirect_to cards_path(query: "community")
    end
  end

  def edit
    @user = current_user
    authorize @card
  end

  def update
    @card.update(card_params)
    authorize @card
    redirect_to cards_path(query: "my-cards")
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
    params.require(:card).permit(:board, :category, :title, :description, :start_date, :start_time, :end_date, :end_time, :archived, pictures: [] )
  end
end
