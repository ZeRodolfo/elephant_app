class UndoAddGraficosToLaudos < ActiveRecord::Migration[5.2]
  def change
    remove_reference :graficos, :laudos
  end
end
