class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.string :cep
      t.integer :number
      t.string :street
      t.string :city
      t.string :uf
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
