class AddForeignKeyToAtestados < ActiveRecord::Migration[5.2]
  def change
    add_foreign_key :atestados, :patients
  end
end
