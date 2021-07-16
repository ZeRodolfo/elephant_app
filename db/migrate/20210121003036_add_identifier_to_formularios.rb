class AddIdentifierToFormularios < ActiveRecord::Migration[5.2]
  def change
    add_column :formularios, :identifier, :integer
  end
end
