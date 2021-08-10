class ChangeForgeinKeyOnUsersTable < ActiveRecord::Migration[5.2]
  def change
    remove_reference :users, :user_preference, foreign_key: true
    add_reference :users, :user_preference, foreign_key: true, on_delete: :nullify
  end
end
