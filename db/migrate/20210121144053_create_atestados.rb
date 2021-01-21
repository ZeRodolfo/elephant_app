class CreateAtestados < ActiveRecord::Migration[5.2]
  def change
    create_table :atestados do |t|
      t.string :text
      t.string :cidade
      t.string :crp

      t.timestamps
    end
  end
end
