class AddForeignKeyToDeclaracaos < ActiveRecord::Migration[5.2]
  def change
    add_foreign_key :declaracaos, :patients
  end
end
