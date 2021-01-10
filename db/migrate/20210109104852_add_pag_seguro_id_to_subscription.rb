class AddPagSeguroIdToSubscription < ActiveRecord::Migration[5.2]
  def change
    add_column :subscriptions, :pag_seguro_id, :string
  end
end
