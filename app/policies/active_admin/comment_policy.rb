class ActiveAdmin::CommentPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def index?
    true
  end

  def show?
    true
  end

  def create?
    true
  end

  def update?
    record_from_user?
  end

  def destroy?
    record_from_user?
  end

  private

  def record_from_user?
    record.author == user
  end
end
