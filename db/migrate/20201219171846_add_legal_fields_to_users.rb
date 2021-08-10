class AddLegalFieldsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :document_number, :string
    add_column :users, :document_type, :string, default: 'CPF'
    add_column :users, :phone, :string
  end
end
