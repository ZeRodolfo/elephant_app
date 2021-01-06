class MercadoPago::User::Create < Micro::Case
  attribute :user

  def call!
    Success result: {
      integrated_user: MercadoPagoIntegration::CreateUserService.call(user)
    }
  rescue => e
    Failure :error_integrating_user, result: { error: e }
  end
end
