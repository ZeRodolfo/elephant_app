class AddForeignKeyToFormularios < ActiveRecord::Migration[5.2]
  def change
    add_foreign_key :formularios, :patients
  end
end
