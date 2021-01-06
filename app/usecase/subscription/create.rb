class Subscription::Create < Micro::Case
  flow Subscription::ValidateParams,
       MercadoPago::User::Create,
       MercadoPago::Subscription::Subscribe,
       Subscription::Save
end
