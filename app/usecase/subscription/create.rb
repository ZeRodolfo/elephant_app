class Subscription::Create < Micro::Case
  flow Subscription::ValidateParams,
       MercadoPago::Subscription::Subscribe,
       Subscription::Save
end
