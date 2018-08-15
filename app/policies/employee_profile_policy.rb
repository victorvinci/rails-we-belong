class EmployeeProfilePolicy < ApplicationPolicy

  def show?
    employee?
  end

  def create?
    true
  end

  def update?
    true
  end

  def edit?
    update?
  end

  def destroy?
    employee?
  end

  private

  def employee?
    @user.employee_profile.nil?
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
