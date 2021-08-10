class RemoveCategoryFromUser < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :category, :integer
  end
end
