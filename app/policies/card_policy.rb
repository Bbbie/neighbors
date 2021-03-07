class CardPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all.order(created_at: :desc)
      # scope.where(current_user == user).order(created_at: :desc).or(scope.where(record.users.include?(user))).order(created_at: :desc)
      # scope.where(current_user == user).order(created_at: :desc) || scope.where(record.users.exists?(user)).order(created_at: :desc)
      # scope.where(current_user == user).order(created_at: :desc) || scope.where(record.users.present?(user)).order(created_at: :desc)
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
