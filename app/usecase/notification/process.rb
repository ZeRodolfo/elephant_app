class Notification::Process < Micro::Case
  flow Notification::Serialize, self

  attribute :notification
  attribute :notification_data

  def call!
    # TODO: Since signature is handled every day, this should do nothing.
    #       Eventualy it should update subscription status if necessary.
    Success result: { data: notification_data }
  end
end
