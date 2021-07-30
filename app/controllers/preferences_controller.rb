class PreferencesController < ApplicationController
  before_action :set_preferences, only: [:index, :update, :destroy_papel_timbrado]

  def index; end

  def update
    if preferences_params.key?(:data_atual)
      if preferences_params[:data_atual] == '1'
        preferences_params[:data_atual] = 1
      else
        preferences_params[:data_atual] = 0
      end
    else
      preferences_params[:data_atual] = 0
    end

    if @preferences.update(preferences_params)
      redirect_to preferences_path, notice: 'Ajustes salvos'
    else
      if @preferences.errors[:papel_timbrado].any?
        flash[:alert] = @preferences.errors[:papel_timbrado].join(', ')
      end
      redirect_to preferences_path
    end
  end

  def destroy_papel_timbrado
    if @preferences.papel_timbrado.attached?
      @preferences.papel_timbrado.purge
    end

    redirect_to preferences_path, notice: 'Papel timbrado removido'
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
        .fetch(:user_preference, {})
        .permit(:papel_timbrado, :data_atual, :data_criacao_atendimento)
    end

    def set_preferences
      if current_user.user_preference.nil?
        current_user.create_user_preference
      end

      @preferences = current_user.user_preference
    end
end
