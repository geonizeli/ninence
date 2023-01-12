class PaymentOrderPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all if @user.admin?

      scope.where(originator_id: @user.id)
    end
  end

  def index?
    true
  end

  def show?
    @user.admin? || @record.originator_id == @user.id
  end

  def create?
    true
  end

  def update?
    @user.admin?
  end

  def destroy?
    @user.admin?
  end
end
