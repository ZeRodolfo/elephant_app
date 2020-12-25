class Notification::Process < Micro::Case
  flow Notification::Serialize, self

  attribute :notification
  attribute :notification_data

  def call!
    Success result: { data: notification_data }
  end
end
