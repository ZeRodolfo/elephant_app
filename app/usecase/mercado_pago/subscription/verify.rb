module MercadoPago::Subscription
  class Verify < Micro::Case
    include MercadoPago::Utils

    def call!
      data = ::Subscription.all.each do |subscription|
        response = client.get("/preapproval/#{subscription.mercado_pago_id}")

        next unless ['200', '201'].include? response['status']

        remote_sub = response['response']

        if subscription.status != real_status(remote_sub['status'])
          subscription.update(status: real_status(remote_sub['status']))
        end
      end

      Success result: { data: data }
    end

    private
      def real_status(status)
        case status
        when 'authorized'
          :active
        when 'cancelled'
          :cancelled
        else
          :suspended
        end
      end
  end
end
