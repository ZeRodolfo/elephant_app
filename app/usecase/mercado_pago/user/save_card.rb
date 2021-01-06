class MercadoPago::User::SaveCard < Micro::Case
  include MercadoPago::Utils

  attribute :card_token
  attribute :user

  def call!
    return Failure :user_not_integrated if !user.integrated?

    response = client.post("/v1/customers/#{user.mercado_pago_id}/cards", {
      token: card_token
    })

    if ['200', '201'].include? response['status']
      Success :card_saved
    else
      Failure :card_not_saved
    end
  end
end
