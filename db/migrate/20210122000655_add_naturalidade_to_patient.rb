class AddNaturalidadeToPatient < ActiveRecord::Migration[5.2]
  def change
    add_column :patients, :naturalidade, :string
  end
end
