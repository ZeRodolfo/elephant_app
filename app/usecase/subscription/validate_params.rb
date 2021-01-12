class Subscription::ValidateParams < Micro::Case
  attribute :card_token
  attribute :user

  def call!
    plan_id = ENV['MERCADO_PAGO_PLAN_ID']

    return Failure :missing_plan_id unless plan_id
    return Failure :invalid_card_token if card_token.blank?
    return Failure :user_subscribed if user.subscription.present?

    Success result: {
      plan_id: plan_id,
      card_token: card_token,
      email: user.email
    }
  end
end
