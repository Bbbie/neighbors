class CardPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all.order(created_at: :desc)
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
end
