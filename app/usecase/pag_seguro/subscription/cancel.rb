class PagSeguro::Subscription::Cancel < Micro::Case
  include PagSeguro::Utils

  attribute :user

  def call!
    if user.subscription.nil? || !user.subscription.active?
      return Failure result: { message: 'Usuário não possui assinatura ativa' }
    end

    cancel = PagSeguro::SubscriptionCanceller.new(subscription_code: user.subscription.pag_seguro_id)
    cancel.credentials = credentials
    cancel.save

    if cancel.errors.any?
      Failure result: { message: 'Não foi possível cancelar a assinatura'}
    else
      user.subscription.destroy!
      Success :subscription_canceled
    end
  end
end
