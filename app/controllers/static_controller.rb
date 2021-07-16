class StaticController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :redirect_logged_user

  def landing; end

  def termos; end

  def reset_admin
    user = Admin.find(2)
    user.password = 'adm2020'
    user.password_confirmation = 'adm2020'
    user.save
  end

  private
    def redirect_logged_user
      if current_user.present?
        redirect_to home_path
      end
    end
end
