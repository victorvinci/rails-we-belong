# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  # def new
  #   @employee_profile = EmployeeProfile.new
  #   @employee_profile.user = current_user
  #   authorize @employee_profile
  #   super
  # end

  # POST /resource
  # def create
  #   @employee_profile = EmployeeProfile.new(employee_profile_params)
  #   authorize @employee_profile
  #   super do |resource|
  #     @employee_profile.user = resource
  #     @employee_profile.save!
  #   end
  #   # if @employee_profile.save
  #   #   super
  #   # else
  #   #   render :new
  #   # end
  # end

  # GET /resource/edit
  def edit
    @employee_profile = EmployeeProfile.new
    @employee_profile.user = current_user
    authorize @employee_profile
    super
  end

  def update
    @employee_profile = EmployeeProfile.new(employee_profile_params)
    authorize @employee_profile
    super do |resource|
      @employee_profile.user = resource
      @employee_profile.save!
    end
  end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end

  private

  def user_params
    params.
      require(:user).
      permit(:email, :password, :password_confirmation)
  end

  def employee_profile_params
    params.require(:employee_profile).permit(%i[sex
                                                gender_identity
                                                ethnicity
                                                sexual_orientation
                                                age_group
                                                disability])
  end

end
