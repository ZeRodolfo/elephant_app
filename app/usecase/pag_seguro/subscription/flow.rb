class PagSeguro::Subscription::Flow < Micro::Case
  flow PagSeguro::CreateAddress,
       PagSeguro::Subscription::Create
end
