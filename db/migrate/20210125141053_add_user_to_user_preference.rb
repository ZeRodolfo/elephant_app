class AddUserToUserPreference < ActiveRecord::Migration[5.2]
  def change
    remove_reference :users, :user_preference
    add_reference :user_preferences, :user, foreign_key: true
  end
end
