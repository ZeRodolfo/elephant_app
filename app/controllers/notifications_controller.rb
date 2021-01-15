class NotificationsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:create]
  skip_before_action :verify_authenticity_token, only: [:create]

  def index
    head :ok
  end

  def create
    params.permit!
    notification = Notification.create(data: JSON.dump(params.to_h))
    ProcessNotificationJob.perform_later notification
    head :ok
  end
end
