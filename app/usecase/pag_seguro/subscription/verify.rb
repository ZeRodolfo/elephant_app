class PagSeguro::Subscription::Verify < Micro::Case
  include PagSeguro::Utils

  def call!
    data = ::Subscription.all.each do |subscription|
      pag_sub = PagSeguro::Subscription.find_by_code(
        subscription.pag_seguro_id,
        credentials: credentials
      )

      next unless pag_sub.errors.empty?

      if subscription.status != real_status(pag_sub.status)
        subscription.update(status: real_status(pag_sub.status))
      end
    end

    Success result: { updated_subscriptions: data }
  end

  private
    def real_status(status)
      case status
        when 'ACTIVE'
          :active
        when 'CANCELLED'
          :cancelled
        else
          :suspended
      end
    end
end
