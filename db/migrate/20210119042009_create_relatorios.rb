class CreateRelatorios < ActiveRecord::Migration[5.2]
  def change
    create_table :relatorios do |t|
      t.string :crp
      t.string :atendido
      t.string :solicitante
      t.string :description
      t.string :procedure
      t.string :analysis
      t.string :conclusion
      t.string :goal
      t.integer :type

      t.timestamps
    end
  end
end
