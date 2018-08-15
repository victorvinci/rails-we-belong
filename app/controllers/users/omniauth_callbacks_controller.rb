class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController

  def linkedin
    @user = User.from_omniauth(request.env["omniauth.auth"])
    if @user.new_record?
      @user.save
      session[:user_return_to] = edit_user_registration_url
    end
    sign_in_and_redirect @user, event: :authentication #this will throw if @user is not activated
    set_flash_message(:notice, :success, kind: "LinkedIn") if is_navigational_format?
  end

  # def facebook
  #   @user = User.from_omniauth(request.env["omniauth.auth"])
  #   if @user.persisted?
  #     sign_in_and_redirect @user, event: :authentication #this will throw if @user is not activated
  #     set_flash_message(:notice, :success, kind: "Facebook") if is_navigational_format?
  #   else
  #     @user.save
  #     session["devise.facebook_data"] = request.env["omniauth.auth"]
  #     redirect_to edit_user_registration_url
  #   end
  # end

  def failure
    redirect_to root_path
  end

end
