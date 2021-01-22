class Subscription::ValidateParams < Micro::Case
  attribute :card_token
  attribute :user
  attribute :remote_ip

  def call!
    plan_code = ENV['PAGSEGURO_PLAN_CODE']
    plan_reference = ENV['PAGSEGURO_PLAN_REFERENCE']

    return fail_with('Sistema configura incorretamente, contate o administrador') unless plan_code
    return fail_with('Sistema configura incorretamente, contate o administrador') unless plan_reference
    return fail_with('Dados inválido, tente novamente') if card_token.blank?

    if user.subscription.present?
      if user.subscription.active?
        return fail_with('Usuário já possui assinatura ativa')
      else
        user.subscription.destroy!
      end
    end

    Success result: {
      plan_code: plan_code,
      plan_reference: plan_reference,
      card_token: card_token,
      email: user.email
    }
  end

  private
    def fail_with(message)
      Failure result: { message: message }
    end
end
