class CardPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      my_cards = user.cards
      recipients = user.cards_as_recipient
      everything = my_cards.union(recipients)
    end
  end

  def show?
    true
  end

  def create?
    true
  end

  def edit?
    record.user == user
  end

  def update?
    edit?
  end

  def archive?
    true
  end
end
