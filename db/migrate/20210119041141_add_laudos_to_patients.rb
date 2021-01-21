class AddLaudosToPatients < ActiveRecord::Migration[5.2]
  def change
    add_reference :laudos, :patient
  end
end
