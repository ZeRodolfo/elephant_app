class Subscription::Save < Micro::Case
  attribute :user
  attribute :pagseguro_subscription

  def call!
    subscription = user.create_subscription(
      status: :active,
      pag_seguro_id: pagseguro_subscription.code,
    )

    Success result: { subscription: subscription }
  end
end
