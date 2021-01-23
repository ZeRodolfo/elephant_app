class CreateParecers < ActiveRecord::Migration[5.2]
  def change
    create_table :parecers do |t|
      t.bigint :patient_id
      t.string :crp
      t.date :created_at
      t.string :description
      t.string :analysis
      t.string :conclusion
      t.string :references

      t.timestamps
    end
  end
end
