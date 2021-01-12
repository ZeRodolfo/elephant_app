class Subscription::Create < Micro::Case
  flow Subscription::ValidateParams,
      # TODO: Adicionar essas etapas em produção
      #  MercadoPago::User::Create,
      #  MercadoPago::User::SaveCard,
       MercadoPago::Subscription::Subscribe,
       Subscription::Save
end
