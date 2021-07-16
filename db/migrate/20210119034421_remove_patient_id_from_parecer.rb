class RemovePatientIdFromParecer < ActiveRecord::Migration[5.2]
  def change
    remove_column :parecers, :patient_id
  end
end
