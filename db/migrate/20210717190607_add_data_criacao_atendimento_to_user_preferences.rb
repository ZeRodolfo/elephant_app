class AddDataCriacaoAtendimentoToUserPreferences < ActiveRecord::Migration[5.2]
  def change
    add_column :user_preferences, :data_criacao_atendimento, :boolean
  end
end
