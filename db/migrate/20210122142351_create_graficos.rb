class CreateGraficos < ActiveRecord::Migration[5.2]
  def change
    create_table :graficos do |t|
      t.json :data
      t.string :kind, default: 'bar'
      t.string :title

      t.timestamps
    end
  end
end
