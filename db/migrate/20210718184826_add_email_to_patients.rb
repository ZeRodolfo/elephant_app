class AddEmailToPatients < ActiveRecord::Migration[5.2]
  def change
    add_column :patients, :email, :string
  end
end
