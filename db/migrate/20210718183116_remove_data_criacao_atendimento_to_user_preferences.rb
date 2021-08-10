class RemoveDataCriacaoAtendimentoToUserPreferences < ActiveRecord::Migration[5.2]
  def change
    remove_column :user_preferences, :data_criacao_atendimento
  end
end
