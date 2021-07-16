class ChangeColumnTypeFromFormularios < ActiveRecord::Migration[5.2]
  def change
    rename_column :formularios, :type, :kind
  end
end
