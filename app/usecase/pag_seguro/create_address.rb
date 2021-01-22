class PagSeguro::CreateAddress < Micro::Case
  attribute :user

  def call!
    address = user.addresses.first

    return Failure result: { message: 'Usuário não possui endereço' } unless address

    Success result: {
      pagseguro_address: {
        street: address.street,
        number: address.number.to_s,
        complement: address.complement,
        district: address.neighborhood,
        city: address.city,
        state: address.uf,
        country: 'BRA',
        postal_code: address.cep
      }
    }
  end
end
