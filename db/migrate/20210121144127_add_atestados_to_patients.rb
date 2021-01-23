class AddAtestadosToPatients < ActiveRecord::Migration[5.2]
  def change
    add_reference :atestados, :patient
  end
end
