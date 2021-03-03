class CommunityPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
      # scope.where(record.address == params[:address])
    end
  end

  def index?
    true
  end

  def search?
    true
  end

  def create?
    true
  end
end
