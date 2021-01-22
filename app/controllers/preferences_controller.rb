class PreferencesController < ApplicationController
  before_action :set_preferences

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

  private
    def preferences_params
      params
        .require(:user_preference)
        .permit(:papel_timbrado)
    end

    def set_preferences
      current_user.create_preferences unless current_user.preferences
      @preferences = current_user.preferences
    end
end
