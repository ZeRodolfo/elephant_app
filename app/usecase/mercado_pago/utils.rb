require 'mercadopago'

module MercadoPago::Utils
  def client
    @client ||= MercadoPago.new(ENV['MERCADO_PAGO_ACCESS_TOKEN'])
  end
end
