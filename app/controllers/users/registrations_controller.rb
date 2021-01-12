class Users::RegistrationsController < Devise::RegistrationsController
  include Accessible
  skip_before_action :check_user, except: [:new, :create]

  def new
    @user = User.new
    @user.addresses.build
  end
  protected

  def update_resource(resource, params)
    resource.update_without_password(params)
  end

  private

  def sign_up_params
    params.require(:user).permit(:email, :password, :password_confirmation, :first_name, :last_name, :phone, :document_number)
  end

  def account_update_params
    params.require(:user).permit(:category, :email, :password, :password_confirmation)
  end
end