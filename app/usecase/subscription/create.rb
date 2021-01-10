class Subscription::Create < Micro::Case
  flow Subscription::ValidateParams,
       PagSeguro::Subscription::Flow,
       Subscription::Save
end
