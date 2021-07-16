class RenameColumnTypeOfLaudo < ActiveRecord::Migration[5.2]
  def change
    rename_column :laudos, :type, :kind
  end
end
