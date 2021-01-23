class AddGraficosToLaudos2 < ActiveRecord::Migration[5.2]
  def change
    add_reference :graficos, :laudo
  end
end
