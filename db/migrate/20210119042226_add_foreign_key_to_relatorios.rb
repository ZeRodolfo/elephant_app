class AddForeignKeyToRelatorios < ActiveRecord::Migration[5.2]
  def change
    add_foreign_key :relatorios, :patients
  end
end
