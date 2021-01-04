class SubscriptionsController < ApplicationController
  def index; end

  def create
    Subscription::Create
      .call(card_token: params[:token], user: current_user)
      .on_success { |result| render json: result.data }
      .on_failure do |result|
        render json: { message: result.data }, status: :unprocessable_entity
      end
  end

  def gate
    
  end
end
