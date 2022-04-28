class Users::RegistrationsController < Devise::RegistrationsController
  include Accessible
  skip_before_action :check_user, except: [:new, :create]

  protected

  def update_resource(resource, params)
    params[:terms_of_service] = true
    # resource.valid?

    # resource.errors.each do |t|
    #   puts t
    # end
    if !params[:password].blank?
      resource.password = params[:password]
      resource.password_confirmation = params[:password_confirmation]
    end
    
    resource.update_without_password(params)
  end

  def after_update_path_for(resource)
    edit_user_registration_path
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
        :terms_of_service,
        :crp,
        :clinic_name,
        addresses_attributes: [:id, :cep, :city, :number, :street, :uf, :complement, :neighborhood]
      )
  end

  def account_update_params
    params
      .require(:user)
      .permit(
        :first_name,
        :birth_date,
        :email,
        :password,
        :password_confirmation,
        :phone,
        :crp,
        :clinic_name,
        addresses_attributes: [:id, :cep, :city, :number, :street, :uf, :complement, :neighborhood]
      )
  end
end
