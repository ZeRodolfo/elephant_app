class ProcessNotificationJob < ApplicationJob
  queue_as :default

  def perform(notification)
    Notification::Process.call(notification: notification)
  end
end
