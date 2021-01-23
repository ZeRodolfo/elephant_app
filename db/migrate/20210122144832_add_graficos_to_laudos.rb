class AddGraficosToLaudos < ActiveRecord::Migration[5.2]
  def change
    add_reference :graficos, :laudos
  end
end
