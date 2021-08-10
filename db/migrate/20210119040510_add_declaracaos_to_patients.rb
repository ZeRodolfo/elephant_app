class AddDeclaracaosToPatients < ActiveRecord::Migration[5.2]
  def change
    add_reference :declaracaos, :patient
  end
end
