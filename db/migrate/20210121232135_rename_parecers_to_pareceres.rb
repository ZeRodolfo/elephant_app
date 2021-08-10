class RenameParecersToPareceres < ActiveRecord::Migration[5.2]
  def change
    rename_table :parecers, :pareceres
  end
end
