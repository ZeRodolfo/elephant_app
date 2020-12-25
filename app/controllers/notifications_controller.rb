class NotificationsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:create]
  skip_before_action :verify_authenticity_token, only: [:create]

  def create
    notification = Notification.create(data: params.to_s)
    ProcessNotificationJob.perform_later notification
    head :ok
  end
end
