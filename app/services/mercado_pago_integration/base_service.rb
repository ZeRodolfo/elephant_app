require 'mercadopago'

module MercadoPagoIntegration
  class BaseService
    def self.call(*params, client: nil, **kwparams)
      self.new(client: client).call(*params, **kwparams)
    end

    attr_accessor :client

    def initialize(client: nil)
      @client = client || MercadoPago.new(ENV['MERCADO_PAGO_ACCESS_TOKEN'])
    end
  end
end
