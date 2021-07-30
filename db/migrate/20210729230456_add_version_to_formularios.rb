class AddVersionToFormularios < ActiveRecord::Migration[5.2]
  def change
    add_column :formularios, :version, :string, default: '1'
  end
end
