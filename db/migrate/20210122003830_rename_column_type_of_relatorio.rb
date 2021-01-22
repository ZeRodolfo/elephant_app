class RenameColumnTypeOfRelatorio < ActiveRecord::Migration[5.2]
  def change
    rename_column :relatorios, :type, :kind
    change_column :relatorios, :kind, :string, default: 'psicologico'
  end
end
