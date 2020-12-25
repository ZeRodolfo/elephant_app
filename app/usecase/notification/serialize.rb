class Notification::Serialize < Micro::Case
  attribute :notification

  def call!
    Success result: { notification_data: JSON.parse(notification.data) }
  rescue JSON::ParserError
    Failure :invalid_notification
  end
end
