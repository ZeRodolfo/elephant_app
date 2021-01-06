class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :verify_subscription, unless: :devise_controller?

  def after_sign_in_path_for(resource)
    home_path
  end

  protected
    def verify_subscription
      if current_user && !current_user.has_active_subscription?
        redirect_to subscriptions_path
      end
    end
end
