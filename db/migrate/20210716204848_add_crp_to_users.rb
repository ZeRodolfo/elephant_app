class AddCrpToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :crp, :string
  end
end
