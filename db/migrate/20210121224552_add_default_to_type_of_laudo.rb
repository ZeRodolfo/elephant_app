class AddDefaultToTypeOfLaudo < ActiveRecord::Migration[5.2]
  def change
    change_column :laudos, :type, :string, default: 'psicologico'
  end
end
