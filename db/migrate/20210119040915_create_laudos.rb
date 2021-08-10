class CreateLaudos < ActiveRecord::Migration[5.2]
  def change
    create_table :laudos do |t|
      t.string :crp
      t.string :solicitante
      t.string :description
      t.string :procedure
      t.string :analysis
      t.string :conclusion
      t.string :references
      t.integer :type

      t.timestamps
    end
  end
end
