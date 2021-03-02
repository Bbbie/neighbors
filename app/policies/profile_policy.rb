class ProfilePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def new?
    true
  end

  def create
    true
  end

  def show?
    true
  end

  def update
    record.user == user
  end
end
