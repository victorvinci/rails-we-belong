class ApplicationController < ActionController::Base
  protect_from_forgery
  before_action :authenticate_user!
  include Pundit

  # Pundit: white-list approach.
  after_action :verify_authorized, except: :index, unless: :skip_pundit?
  after_action :verify_policy_scoped, only: :index, unless: :skip_pundit?

  # Uncomment when you *really understand* Pundit!
  # rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  # def user_not_authorized
  #   flash[:alert] = "You are not authorized to perform this action."
  #   redirect_to(root_path)
  # end
  def default_url_options
    { host: ENV["HOST"] || "localhost:3000" }
  end

  private

  def skip_pundit?
    devise_controller? || params[:controller] =~ /(^(rails_)?admin)|(^pages$)|(^searches$)/
  end

  protected

  def configure_permitted_parameters
   # devise_parameter_sanitizer.permit(:account_update, keys: [:terms_of_service, employee_profile_attributes: [:sex]])
    devise_parameter_sanitizer.permit(:account_update) do |user_params|
      user_params.permit({ terms_of_service: [] }, :email, :password, :password_confirmation)
    end
  end
end
