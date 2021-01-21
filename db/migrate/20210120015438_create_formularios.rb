class CreateFormularios < ActiveRecord::Migration[5.2]
  def change
    create_table :formularios do |t|
      t.json :content
      t.string :type

      t.timestamps
    end
  end
end
