class PatientCodeToString < ActiveRecord::Migration[5.2]
  def change
    change_column(:patients, :code, :string)
  end
end
