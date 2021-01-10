class PagSeguro::Subscription::Create < Micro::Case
  include PagSeguro::Utils

  attribute :user
  attribute :card_token
  attribute :plan_code
  attribute :plan_reference
  attribute :remote_ip
  attribute :pagseguro_address

  def call!
    subscription = PagSeguro::Subscription.new(
      plan: plan_code,
      reference: plan_reference,
      sender: {
        name: user.name,
        email: user.email,
        ip: remote_ip,
        hash: 'hash',
        phone: {
          area_code: user.phone_ddd,
          number: user.phone_number
        },
        document: { type: user.document_type, value: user.document_number },
        address: pagseguro_address
      },
      payment_method: {
        token: card_token,
        holder: {
          name: user.name,
          birth_date: user.birth_date,
          document: { type: user.document_type, value: user.document_number },
          billing_address: pagseguro_address,
          phone: { area_code: user.phone_ddd, number: user.phone_number }
        }
      }
    )

    subscription.credentials = credentials
    subscription.create

    if subscription.errors.empty?
      Success result: { pagseguro_subscription: subscription }
    else
      Failure result: { pagseguro_subscription: subscription }
    end
  end
end
