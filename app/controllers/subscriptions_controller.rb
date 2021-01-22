class SubscriptionsController < ApplicationController
  skip_before_action :verify_subscription
  before_action :redirect_to_home, except: [:index, :cancel]

  def index
    @active = current_user.subscription&.active?
  end

  def new
    gon.session = PagSeguro::Session.create
  end

  def create
    Subscription::Create
      .call(card_token: params[:token], user: current_user, remote_ip: request.remote_ip)
      .on_success { |result| redirect_to home_path }
      .on_failure do |result|
        flash.now[:alert] = result.data
        render :new
      end
  end

  def cancel
    PagSeguro::Subscription::Cancel
      .call(user: current_user)
      .on_success { |r| redirect_to subscriptions_path, notice: 'Assinatura cancelada' }
      .on_failure do |r|
        redirect_to edit_user_registration_path, alert: r.data[:message]
      end
  end

  private

  def redirect_to_home
    redirect_to home_path if current_user&.has_active_subscription?
  end
end
