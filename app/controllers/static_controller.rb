class StaticController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :redirect_logged_user

  def landing; end

  def termos; end

  private
    def redirect_logged_user
      if current_user.present?
        redirect_to home_path
      end
    end
end
