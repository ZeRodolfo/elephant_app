module MercadoPagoIntegration
  class CreateUserService < BaseService
    def call(user)
      return user if user.integrated?

      @user = user

      validate_params
      create_user_on_mercado_pago
      save_mercado_pago_id

      @user
    end

    attr_reader :user, :mercado_pago_id

    private
      def validate_params
        if user.addresses.empty?
          raise 'O usuário não possui nenhum endereço cadastrado'
        end
      end

      def address
        user.addresses.first
      end

      def create_user_on_mercado_pago
        response = client.post(
          '/v1/customers', {
            email: user.email,
            first_name: user.first_name,
            last_name: user.last_name,
            phone: {
              area_code: user.phone[0..1],
              number: user.phone[2..-1]
            },
            identification: {
              type: user.document_type,
              number: user.document_number
            },
            address: {
              zip_code: address.cep,
              street_name: address.street,
              street_number: address.number
            },
            description: "Assinante Elephant"
          }
        )

        if response['status'] != '201'
          raise 'Não foi possível cadastrar o usuário no mercado pago'
        end

        @mercado_pago_id = response['response']['id']
      end

      def save_mercado_pago_id
        user.update(mercado_pago_id: mercado_pago_id)
      end
  end
end
