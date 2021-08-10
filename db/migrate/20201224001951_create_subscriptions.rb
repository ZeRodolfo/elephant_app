class CreateSubscriptions < ActiveRecord::Migration[5.2]
  def change
    create_table :subscriptions do |t|
      t.integer :status
      t.string :mercado_pago_id
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
