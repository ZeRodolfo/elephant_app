class CreateDeclaracaos < ActiveRecord::Migration[5.2]
  def change
    create_table :declaracaos do |t|
      t.string :crp
      t.string :text
      t.string :city

      t.timestamps
    end
  end
end
