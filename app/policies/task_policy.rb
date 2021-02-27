class TaskPolicy < ApplicationPolicy
  def index?
    true
  end

  def show?
    admin? || (common? || user==record)
  end

  def new?
    create?
  end

  def create?
    admin?
  end

  def edit?
    update?
  end

  def update?
    admin?
  end

  def destroy?
    admin?
  end

  # Scope for Users
  class Scope < Scope
    def resolve
    end
  end
end
