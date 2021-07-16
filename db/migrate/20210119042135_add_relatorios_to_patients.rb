class AddRelatoriosToPatients < ActiveRecord::Migration[5.2]
  def change
    add_reference :relatorios, :patient
  end
end
