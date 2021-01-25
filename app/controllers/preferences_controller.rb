class PreferencesController < ApplicationController
  before_action :set_preferences, only: [:index, :update]

  def index; end

  def update
    if @preferences.update(preferences_params)
      redirect_to preferences_path, notice: 'Ajustes salvos'
    else
      if @preferences.errors[:papel_timbrado].any?
        flash[:alert] = @preferences.errors[:papel_timbrado].join(', ')
      end
      redirect_to preferences_path
    end
  end

  def download_psd
    send_file "#{Rails.root}/public/samples/timbrado.psd",
      filename: 'timbrado.psd',
      type: 'image/vnd.adobe.photoshop'
  end

  def download_png
    send_file "#{Rails.root}/public/samples/timbrado.png",
      filename: 'timbrado.png',
      type: 'image/png'
  end

  private
    def preferences_params
      params
        .require(:user_preference)
        .permit(:papel_timbrado)
    end

    def set_preferences
      if current_user.user_preference.nil?
        current_user.create_user_preference
      end

      @preferences = current_user.user_preference
    end
end
