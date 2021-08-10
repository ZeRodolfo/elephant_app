class AddDataAtualToUserPreferences < ActiveRecord::Migration[5.2]
  def change
    add_column :user_preferences, :data_atual, :boolean
  end
end
