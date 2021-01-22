# {
#   "notificationCode"=>"37830B-696A5F6A5F44-4FF44A5F8690-66ABAF",
#   "notificationType"=>"preApproval",
#   "controller"=>"notifications",
#   "action"=>"create"
# }
class PagSeguro::Subscription::Update < Micro::Case
  include PagSeguro::Utils

  attribute :notification
  attribute :notification_data

  def call!
    if notification_data['notificationType'] != 'preApproval'
      return Success :notification_ignored
    end

    subscription = PagSeguro::Subscription.find_by_notification_code(
      notification_data['notificationCode'],
      credentials: credentials
    )

    subject = ::Subscription.find_by(pag_seguro_id: subscription.code)

    if subject.present? && subject.status != real_status(subscription.status)
      subject.update(status: real_status(subscription.status))
    end

    Success :finished
  end

  private
    def real_status(status)
      case status
        when 'ACTIVE'
          :active
        when 'CANCELLED'
          :cancelled
        else
          :suspended
      end
    end
end
