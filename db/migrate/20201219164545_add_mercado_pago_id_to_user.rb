class AddMercadoPagoIdToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :mercado_pago_id, :string
  end
end
