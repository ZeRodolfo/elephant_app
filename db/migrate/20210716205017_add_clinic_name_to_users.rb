class AddClinicNameToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :clinic_name, :string
  end
end
