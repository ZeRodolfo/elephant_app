class AddForeignKeyToLaudos < ActiveRecord::Migration[5.2]
  def change
    add_foreign_key :laudos, :patients
  end
end
