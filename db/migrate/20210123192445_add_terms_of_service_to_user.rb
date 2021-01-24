class AddTermsOfServiceToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :terms_of_service, :boolean, {default: false, null: false}
  end
end
