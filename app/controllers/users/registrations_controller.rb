class Users::RegistrationsController < Devise::RegistrationsController
  include Accessible
  skip_before_action :check_user, except: [:new, :create]

  protected

  def update_resource(resource, params)
    resource.update_without_password(params)
  end

  private

  def sign_up_params
    params
      .require(:user)
      .permit(
        :email,
        :password,
        :password_confirmation,
        :first_name,
        :last_name,
        :phone,
        :document_number,
        :birth_date,
        addresses_attributes: [:cep, :city, :number, :street, :uf, :complement, :neighborhood]
      )
  end

  def account_update_params
    params
      .require(:user)
      .permit(
        :email,
        :password,
        :password_confirmation
      )
  end
end
