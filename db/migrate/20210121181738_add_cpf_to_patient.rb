class AddCpfToPatient < ActiveRecord::Migration[5.2]
  def change
    add_column :patients, :cpf, :string
  end
end
