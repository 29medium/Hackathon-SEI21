class WorkSessionPolicy < ApplicationPolicy
  def index?
    true
  end

  def show?
    admin? || (!admin? && user==record)
  end

  def new?
    create?
  end

  def create?
    (!admin? && user==record)
  end

  def end_session?
    (!admin? && user==record)
  end

  def edit?
    update?
  end

  def update?
    false
  end

  def destroy?
    false
  end

  # Scope for Users
  class Scope < Scope
    def resolve
      if user.admin?
        scope.all
      else
        scope.where(task_id: Task.where(user_id: user.id))
      end
    end
  end
end
