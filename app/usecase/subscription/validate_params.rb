class Subscription::ValidateParams < Micro::Case
  attribute :card_token
  attribute :user
  attribute :remote_ip

  def call!
    plan_code = ENV['PAGSEGURO_PLAN_CODE']
    plan_reference = ENV['PAGSEGURO_PLAN_REFERENCE']

    return Failure :missing_plan_code unless plan_code
    return Failure :missing_plan_reference unless plan_reference
    return Failure :invalid_card_token if card_token.blank?
    return Failure :user_subscribed if user.subscription.present?

    Success result: {
      plan_code: plan_code,
      plan_reference: plan_reference,
      card_token: card_token,
      email: user.email
    }
  end
end
