class AddParecersToPatients < ActiveRecord::Migration[5.2]
  def change
    add_reference :parecers, :patient
  end
end
