module MercadoPago::Subscription
  class Subscribe < Micro::Case
    include MercadoPago::Utils

    attribute :plan_id
    attribute :email
    attribute :card_token

    def call!
      response = client.post('/preapproval', {
        preapproval_plan_id: plan_id,
        card_token_id: card_token,
        payer_email: email
      })

      if response['status'] == '200' || response['status'] == '201'
        Success result: { subscription_data: response['response'] }
      else
        Failure result: { response: response }
      end
    end
  end
end
