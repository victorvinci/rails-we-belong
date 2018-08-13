class EmployeeProfilesController < ApplicationController
  before_action :set_user

  def new
    @employee_profile = EmployeeProfile.new
    @employee_profile.user = current_user
    authorize @employee_profile
  end



  private

  def set_user
    @user = current_user
  end
end
