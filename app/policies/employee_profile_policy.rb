class EmployeeProfilePolicy < ApplicationPolicy

  def show?
    employee?
  end

  def create?
    employee?
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
    @user.role == 'employee'
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
