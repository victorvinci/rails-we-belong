class EmployeeProfilePolicy < ApplicationPolicy

  def show?
    employee?
  end

  def create?
    true
  end

  def update?
    employee?
  end

  def edit?
    update?
  end

  def destroy?
    employee?
  end

  private

  def employee?
    !current_user.role.nil?
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
