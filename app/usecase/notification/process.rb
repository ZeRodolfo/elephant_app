class Notification::Process < Micro::Case
  flow Notification::Serialize,
       PagSeguro::Subscription::Update,
       self

  attribute :notification

  def call!
    notification.processed!
    Success :processed
  end
end
