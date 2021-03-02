class CommunityPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
      # scope.where(record.address == params[:address])
    end
  end

  def index?
    true
  end

  def search?
    true
  end
end
