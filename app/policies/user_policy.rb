class UserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      return scope.none unless @user.admin?

      scope.all
    end
  end

  def index?
    @user.admin?
  end

  def show?
    @user.admin?
  end

  def create?
    @user.admin?
  end

  def update?
    @user.admin?
  end

  def destroy?
    @user.admin?
  end
end
