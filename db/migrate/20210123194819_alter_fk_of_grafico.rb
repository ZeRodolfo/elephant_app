class AlterFkOfGrafico < ActiveRecord::Migration[5.2]
  def change
    remove_foreign_key :graficos, :laudos
    add_foreign_key :graficos, :laudos, on_delete: :cascade
  end
end
