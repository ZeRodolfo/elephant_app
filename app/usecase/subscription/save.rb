class Subscription::Save < Micro::Case
  attribute :subscription_data
  attribute :user

  def call!
    subscription = user.create_subscription(
      status: :active,
      mercado_pago_id: subscription_data['id']
    )

    Success result: { subscription: subscription }
  end
end
