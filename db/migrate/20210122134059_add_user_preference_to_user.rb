class AddUserPreferenceToUser < ActiveRecord::Migration[5.2]
  def change
    add_reference :users, :user_preference, foreign_key: true
  end
end
