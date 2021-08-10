class AddFormularioToPatients < ActiveRecord::Migration[5.2]
  def change
    add_reference :formularios, :patient
  end
end
